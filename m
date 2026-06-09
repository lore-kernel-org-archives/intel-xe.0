Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE863CD8CB9
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 16:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C82B10E4AA;
	Tue,  9 Jun 2026 16:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZFzf8vm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF9310E4AA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781021545; x=1812557545;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S7QXGBaaPnkQtSmgkqyLU5SIFDthoz1r8n3S/h/r9Mc=;
 b=JZFzf8vmh48Cfv2A6m1d7NC68SDDg+QNjptaiWy6cUW8bctk6srrd8qr
 eWDiOoziFdYNBKT7dmTCUre55OWat9IKo+D1J5XqWKp0CakTMKyG56TJM
 +KGZV9XR29ZTualTQhhjNlT4dsC+HiR4w98TDxwCEBN+bnjSPVqmuTpD3
 5iG75WtsMsLvElozA7NAYuKhncpVtoVdbYC8SeiQvfMEmjM2Pinj8hpvw
 VQe1WnooBbzQgbGzc308a5s3l8uOl96NAU1cPmEzaCKJc1OjbKuLWI5V5
 guCD5TnaWqjSKcNArUvOi9KhhKemfoJdjgaKekUoKfR9UVOE3nSBuajMC A==;
X-CSE-ConnectionGUID: li5dg8F4SjiBhD7CCCRmbw==
X-CSE-MsgGUID: gr151JxkQ0e/E/JBrqHCBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99365092"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99365092"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:12:24 -0700
X-CSE-ConnectionGUID: A/u+1x8JQgCZUDC5Fi9EUQ==
X-CSE-MsgGUID: mMtnnNoWR0yqGeAlUozwcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="250834686"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:12:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:12:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 09:12:23 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:12:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0RU7w5BjYd1XFn1zeTrSGxEixsd49g1ab8C/olgEt64RgC2tbY0OV8lE8GEc9pqQmhNxsLPHzBTbAuBZg6m6uFIgwnxrLxsuAX9+QO5C9mdMFuDqMdscewTXhs7xmVsrUlPFdClkLpwxvOyRWaQVYrunHEgryKM/8M5JMZNGkWtTOX6bc32BOEDFuuLuwU0T4KA7x7muToZJwsR4vhte6Ogd3p+FzYSiMNt5lvE0yZFAuOs4YHHwBgJAnm2H1T1yuoqK0/a+SbPustzNYRXhq/OvZzD7X1qYhi5gt5oEQY8mgebyMVtVagm/Agn31gJTJwOII6ulkXNopUYI7weQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEWhKn5g+kcAtHM/5nzRXk26zzGAV8wPpv3WlR5e2Us=;
 b=Xdg4OvSYtktVz9ygXOUorT3l77R4g4/Ma3Sz18S72yv35e+K2WpKqD/CzuO+K9NBnFwk8mAsRExQzBBy7oCYw+8uLeIWhluNml53oqkrh0R7A+irQaMwFUeDSyzaxAWIsdBb7fLt+8eJfv7mncHMar6AN55WRQgU+XSU0M2+ruDULg4Z+xFS3yJAYVbxsc8nwyCUJBuKqSOG555YU0dA4tj0yxoxSfKZQGziL7mMWPkPHCCg4X8dlAy+1wFmmI/MO0XFwiJGc9QaPzF2fhuIWyAgTQNLE56cTGF+QmAVjfDbZsc+Ro8CTRIBsJbNUU5zI1sjXtzQ2w4DYWQJvpEVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 16:12:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:12:19 +0000
Date: Tue, 9 Jun 2026 09:12:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
Message-ID: <aig7YF98Ehelgeek@gsse-cloud1.jf.intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
 <aigyd1rBHQHc8FKl@gsse-cloud1.jf.intel.com>
 <aig5uLonYEgjeZaA@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aig5uLonYEgjeZaA@intel.com>
X-ClientProxiedBy: MW4PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:303:6a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 58034649-4082-4aae-6629-08dec641e19a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: /3HIhFax9toF5NvS7h3m1GEornXgzXJfFZG75qwkUYhrvV6D0FUUfPYIEh4F8Qe4QLyBZG/dEp/lm47WyFWX05VUor3fCviu962cHM4sx6LASWvdPCvEl0t1rJ8qSw6yif6tSjBLAuG6Mgvv855QT2wLyQiMF6oXXq8rBmSADDar670Z1SLpbk+D55e/Jtt66gcI43YArMZ7yVLMapaBmBFgsu/S91AIbIDH3yysgLoGKNpyrk2Rk51s5yXCR8qmVGRNMOx33WhLpdIcdV47eIHFLtp4PRxgf/uZ0d1qZrgx0kyHBYMJyaHrfUFfv1daiXdLU/ptvBz5hjUzw+Xg5oOgizvRa37VeSaifN7iQO1LLvWmte4dF78wY4CHcnM5Lsot5lLC9qjQA37V/0FXiMb6fT5c1QPJBZGv5TE1QMTe3o8hXM/lN+O9NEvhKq6oiRbVI8VTBcfxi/H7f4ANCw/2IiXcfzraONxkLKC3MR/8E3rlD6fmHTCZihNjM5IqRTO5cpsiJiIqQbv+dgG7LijH5frEqC2BiTBkEDT6nLH7vdE+81ojtvPc0GpGdoIU6GXwbGcmZ9lAqhRh+CNo4kwL2pezI6zOZUl5SaK8QE9TKbM8yP7e7DG94him/8iWL31nvlGi2cgpMgeGq/JOdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFV5YW5Ic1laVktieWZhbTRLZGMwS3NQQUdkbVlUS0EyV2FHRlVzamdyenVw?=
 =?utf-8?B?RGd6REhRRVRJZnh0WFVSZzBPelkwNC9renF4YktMdEtXSU1hYlUzT1RNeFM0?=
 =?utf-8?B?MXY4Z3U5KzdrZytoVFV5US9XVTA2NGZQelIrcUsvVzRUN2RtaGlpaTdRcy9w?=
 =?utf-8?B?eDFGQ0svVDV4TkRvZExuQjg5SzdxK1V4TG5qRUF2Z2tYRHZXcEIyZjhmZkNr?=
 =?utf-8?B?YTRnQmcvMzlQdCtHdlF1bW9UNE5rVFNyb1VvS2EyUXZOVm1jVzJJdVhaYW5X?=
 =?utf-8?B?bnRKU0g3RUd3b1laYVZnemR2VnlRZisvOCt5ZmZvTVpkVk5RdVRJOHBBUSto?=
 =?utf-8?B?cmZVcmpiNlJIWUpiWUp1VGorbFRHRWdObjhGVWpXRDZIQXN4Q0U2N1NZUEps?=
 =?utf-8?B?bm1pbERpdXltNmF1SHhHbWNJallOS0wxV245Qlg0UDVlZkdldmFiRWFYcUJS?=
 =?utf-8?B?b0JuYno3ZUJWdWdWN29US0s4VnlXOGFsaXkrNVY0YVllYmx5eUFxRVRSM0ZT?=
 =?utf-8?B?YklHUEFETU1tcVkvWEtGVk1XNC9QZWQ2bk9PdUszeWZSci8wQmZEY3BUUEZ5?=
 =?utf-8?B?eDQ0OUx0c3FzeGgzZUZ3b3lEUERPNnorYVZKWi82SHRTOHJzVUtCVWpyUUZ6?=
 =?utf-8?B?M3BZQUxSSEhZTC9PNml3eDFhSGlVNHhPcE15S0hXc3lmZ24rWkEvNThHbHR4?=
 =?utf-8?B?QjhOU0gvSm93MW5kNXJIb3kyNEJBV2V6ajY5TTJ0RGJ0bHlEZWVrZ2xMVGRl?=
 =?utf-8?B?YytVM1dZRDM0eUNQTWk3UCtkSS95d3ZqQ0xQajJ1ZFJRQVJCNEVPOHdFazgz?=
 =?utf-8?B?T0dKb0Z5SW9UYmZtWmUyMDN3ck5JSVBVUXJTUjhTVFVQUG9ZRHBKR1ZzUDNH?=
 =?utf-8?B?QVRGLzQ0VG5CR3pUSEsrbTExd1hFWDQ5bWRKbVBQdmR6VWRtVVQ1R09Wd0VI?=
 =?utf-8?B?OEtCTEtSYWZmN3hSUnVTL2RNMVoxYkxKMEczWTlUc1AvZnVPSm8rVWtNeHFY?=
 =?utf-8?B?VkpaQXpCRGxpYVg2TUdnbDFnaDZKaHVGQjRjYzFYZ0hUeVl6YXo1S3ZLeFp0?=
 =?utf-8?B?SzdxL05QWkZFSzFmRllaS0tnaURRZnU2Z2RXaUlvUzZsSUlxL1pIMUpnS2pU?=
 =?utf-8?B?cHRSMTFYNDlVZXBoSTBkL0ptOVB6aE1YMzVpVEdUNXljVENmNXFLcS9QY3Jn?=
 =?utf-8?B?WHNLTVZuTGRKVzRQRzMxVnRmVjhmd0xXamtQNjhoVDl5dERoRkJVLzdaUzNa?=
 =?utf-8?B?TGxXeFpFVFNwWnNOL3NTZStodWJaeFFjTDhhR3E2clNNMHR3dXZzS2QvVWpp?=
 =?utf-8?B?dHloNzJCb21ab2phNlBCMTZsUFpORjJSN2FqbEFqeEZRUk9WVjlycDl0Yk9R?=
 =?utf-8?B?TS9NS28xN3B4MlJzbDQ5eHVDT3ExLzZaa214QXk3amlxeGMxTmlOcyt5OXBz?=
 =?utf-8?B?ZGxtbjRQSFZYaXdBY0lqZVVZZ1pYQWEyNU9oeWVzQVgvcmlqbmhzcTBWaWdY?=
 =?utf-8?B?V2RBRlRSakJRZTBHVkg3QlQvQmdnTWEweTA4QkNvbHVjVzc0UDdPcVlDV05Q?=
 =?utf-8?B?eUxqS05QWmFIZnZ1MmFxTDB3R3MrTHorQlB4VG1YOUE3VlVGdjVScUI3R0pO?=
 =?utf-8?B?M1I4YU9RVUJCZ3NVU1g0OUxvaDdrSzRBbHZ6WHNoeUZWMzdQcHRndklIUGRw?=
 =?utf-8?B?a0VuakQ4bVlQdFZ4VDVPVzV4SlFoci9XcGN0WU1kY1ErOWZJQUs3d2dSNUl6?=
 =?utf-8?B?UlR4V2xPK2wwNHROYkw2aGpTbmc5ZVZ0UnRjWFJ5ZnBPRDRma0FnWCs3UjRQ?=
 =?utf-8?B?TFZTMmJMSzVkYitHeFZjZ28xMzRtS2hYeU83d2szemZLc2pXQW4wQUs0bWNZ?=
 =?utf-8?B?c2tmb0g1ZitUWWRtYnJzRFZUMU00amZDZ1BQVUFSMnY3dVhBY3FaTXJuWTMw?=
 =?utf-8?B?V2tKRHEyMEtxVFpVczZrbG9hY0Y5ZkJmemdJVGFBZ3d4NUREa1MyN1BabzlI?=
 =?utf-8?B?YTV6VDMrYjRKUE5nQmFOY0p4UWxOLzZ5S1VQbUJBS3BUNGFFR3JwRkhvN2tp?=
 =?utf-8?B?dlduUkdGOWFiWDQ3QlJ6S282aFBOZTl2OUtUK3BhNnFZcXhPeERTOUd6SmVy?=
 =?utf-8?B?MEpNVXJvWUxUWUtjbVliN1FKak5LNFdNZEpabzcvM3cvL1VRMGxZd0hPZHN4?=
 =?utf-8?B?K1Q4bTZWTWdOSjZzOG5zYUJUQ3ZFSzViTERxNGFPSDhWSG9DSTRBc3RTL0hp?=
 =?utf-8?B?aWlSbEFEMW1NTTJka3RQQ3lQZ1FHTTR5S3pzMmg1T2wweC9jZTBDUDZBTlF3?=
 =?utf-8?B?cUZFbDdYWnp5OW9qQzRZZXJhdE9QeDRuNHFoUlphVkpVUmNPOG4rUT09?=
X-Exchange-RoutingPolicyChecked: pJr+f2B3JG+BNHU69blTBZUb4uj+MCbwoNiJrHZAVBqNuFa8/eDzzBMnveY8qr+bQSPeUhwv1OTMSTDkMM6J5FEbHHQQ2CrHXyl4vs7hGoaAM5tzui/n4uwPcYIs/0s8f+RKxbedXCrv4ni0eMf2DOkZQeMgwpR/72UXL+AGgOuxhBcb/eeBXW++OvuTfig/XQfYhNTkfbdkLoSsO4KNrHJJvkpl8U+pmi80sw3yewtl5P/V4HM4cxBVgk0v4Ca09M1ADj5/IovdkeeA3o3d5I3z4ZwnPXUroEn27CyBfaIgUecWG1SzQ2T31vM/RkbT1Ks6SbfhlSudeooKhhG7bw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 58034649-4082-4aae-6629-08dec641e19a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:12:19.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3SzB0fTzFpV5DIm4SSvIHCOfV4OvHsH4Y9cAqcJm6qSj1Q378oP9nfnCr7HbZ5s+1qKIs5o0yuUQNIlq0x3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2026 at 12:05:12PM -0400, Rodrigo Vivi wrote:
> On Tue, Jun 09, 2026 at 08:34:15AM -0700, Matthew Brost wrote:
> > On Tue, Jun 09, 2026 at 10:44:13AM -0400, Rodrigo Vivi wrote:
> > > Jobs that GuC never scheduled were silently errored out instead of
> > > triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> > > should wedge the device rather than silently fail, and userspace VM bind
> > > queues should stay permanently banned rather than being reset and retried.
> > > 
> > > The queue is banned early in the timeout handler to signal the G2H
> > > scheduling-done handler so it wakes the disable-scheduling waiter; without
> > > it the waiter sleeps the full 5s timeout. For not started works the ban is
> > > cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> > > after the GT reset — a banned queue would block resubmission and cause an
> > > infinite TDR loop.
> > > 
> > > v2: (Himal) Do it for any queue type, not just kernel/migration
> > > 
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> > > Assisted-by: GitHub-Copilot:claude-opus-4.8
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 41 ++++++++++++++++++++----------
> > >  1 file changed, 27 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 4b247a3019d2..5c40eee41103 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
> > >  	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > >  }
> > >  
> > > +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> > > +{
> > > +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > > +}
> > > +
> > >  static bool exec_queue_suspended(struct xe_exec_queue *q)
> > >  {
> > >  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> > > @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > >  			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > >  			   q->guc->id);
> > >  
> > > -		return xe_sched_invalidate_job(job, 2);
> > > +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> > > +		return true;
> > 
> > I think there are some edge cases in the VK conformance tests where,
> > with a large number of queues, 5 seconds isn’t enough time for queues to
> > start after submission. Based on a 1 ms timeslice, this would correspond
> > to more than 5,000 queues.
> > 
> > The current code allows a 10-second window, which is just as arbitrary
> > as 5s. This isn’t a blocker—just something to consider.
> 
> Indeed. The ambiguous 'reasonable time'. But better this then the loop I believe...
> 
> > 
> > >  	}
> > >  
> > >  	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> > > @@ -1460,6 +1466,12 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > >  			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > >  }
> > >  
> > > +/* Unstarted jobs (GuC scheduling failure) and kernel queues recover via GT reset */
> > > +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > +{
> > > +	return !xe_sched_job_started(job) || (q->flags & EXEC_QUEUE_FLAG_KERNEL);
> > > +}
> > > +
> > >  static enum drm_gpu_sched_stat
> > >  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  {
> > > @@ -1608,19 +1620,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > >  			       q->guc->id, q->flags);
> > >  
> > > -	/*
> > > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > > -	 * somethings has gone wrong and the GT needs a reset
> > > -	 */
> > > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > > -		   "Kernel-submitted job timed out\n");
> > > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > > -		   "VM job timed out on non-killed execqueue\n");
> > > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > > -		if (!xe_sched_invalidate_job(job, 2)) {
> > > -			xe_gt_reset_async(q->gt);
> > > -			goto rearm;
> > > +	if (!wedged) {
> > > +		if (timeout_needs_gt_reset(q, job)) {
> > > +			/* Retry after a GT reset; wedge a kernel queue once karma is exhausted */
> > > +			if (!xe_sched_invalidate_job(job, 2)) {
> > > +				clear_exec_queue_banned(q);
> > > +				xe_gt_reset_async(q->gt);
> > > +				goto rearm;
> > > +			}
> > > +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> > > +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> > > +				xe_device_declare_wedged(gt_to_xe(q->gt));
> > > +			}
> > 
> > This part LGTM. I have seen when a device gets in a bad state and kernel
> > jobs fail (typically a bug somewhere else in the driver) kernel jobs
> > just spun forever - I never spent the time trying to fix that. I think
> > this should fix this problem?
> 
> That's exactly my hope.
> 
> Issues like Linus was facing here:
> https://lore.kernel.org/intel-xe/CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com/
> 
> and some other issues that had similar signatures:
> 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7810
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7814
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7893
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8003
> 
> I don't believe that this patch here will solve any of these issues themselves.
> At least not the source of the initial GPU Hang.
> 
> But at least the machine won't be locked in the infinite TDR handling
> with never started jobs, what will allow us to debug the true bug when
> that happens...

Yes, will be a step in the right direction.

So with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Thanks,
> Rodrigo.
> 
> > 
> > Matt
> > 
> > > +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> > > +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
> > >  		}
> > >  	}
> > >  
> > > -- 
> > > 2.54.0
> > > 
