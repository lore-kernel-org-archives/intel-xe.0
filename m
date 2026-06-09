Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74353CD98C5
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 15:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3551110E41B;
	Tue,  9 Jun 2026 15:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khe91qgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C84E10E4A7
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781019261; x=1812555261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6nLhIoMhfFKCe3cgPYdGCmrAO/zYcrjbPWu0slHlrp8=;
 b=khe91qgD2NjGCQh5Ym+EWnCLBfSPJHagJR8s1tHodIXGlU4iV2eMNfD+
 o7qWdEL0+tx5Ie2Tt7vhI23mOsitnGF0RJKHSoL1zJQCAyHrLrHg6fZvu
 9ztrnQ8F4cwW3NP3Ucaj79lP3rxoJt+yL02A3JZcIZJbTjUTmp9QUZIP+
 305Pbnzc48FNDHzMxOGCbFfjacUb5zyG99mLph0kNariTLEI+vkkbA9fo
 OdgWIWiq5iWFAeWpjKBNT+PraEB2M94c6XNQaTOGi2oaCCUyf2qYcBWw+
 dFJXs07u1BHLybqhyVVayLqgfmG3/IqdDsWU54fOg65wZnm0N8KIxcX1S w==;
X-CSE-ConnectionGUID: hhM5VsO3S4iM9cO9iGsN4Q==
X-CSE-MsgGUID: Nvi8IzNrSVqJJdHMADpL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="69317085"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="69317085"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:34:21 -0700
X-CSE-ConnectionGUID: ETTiHmWDTIOMUKe3q/cnFw==
X-CSE-MsgGUID: gvrhl33dQUC9DJn5O9OFmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="242934569"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:34:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:34:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 08:34:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7yZr/aJ1/lJZiBXixV6Keop4wWpyYx3HjdRUin3Pic4u763y0Ma5ZK6oj6/sDx/xoxr0R5tkPyzub8FVrfc0VxukOnPOzTEof6uyN/BSBZNEkBJGM/4s6tfi29OwP3YzvhIOAsAKaTFLREcKFOR7FtULlS7RQqnqqQ1C+58B+98vRYevzVFX7ao03nZzyLIUZbi80UWRnmLL+E55Ewmt5pav+2mT3BbiHehTr2e1IPANdgH9Uv/LRG6p3bFnC8Devr42X+tUuKpp5X8xRbPjCBT9C8CVo6hETxJrCD6ki9qpsI/B4WVDMroSm0cyRkDjsoZ5QzUf4xsHti3gEZ1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1JKsdlJBN9s45Z1ubO4UXAkbwUttrnPixBr/UXyCMA=;
 b=bq+KL2ZQJYw2FhSsJZf2vqXZhPGz1KTFtHDWUi4Wp0n/74Msl+Tb8IJ//VZR4npqpK9O8RQE2Bc4Nvfu81oz4NZseduzLW/jKUn21CpsF0Igi/maskyv0awYis7UUsBuPQ7Dwk+da9Y0cLpGPNjddtGdhyqXtMCT7aD4/jFvaVncFjtgkjd0ht2ba83Qn+m4O1jWMxZaDR2CZjNK5DTgIFNDrYQOYu/ig3Xm+uHp+2JG28Z6crn5wApG46JAxLdPLb95oLmG1AlKgHExPng8GoyHb96Y3NE9ya2kFgtjQYMZtdBAS9OTRS01f74oOGm4DlNv//W362pgqUC7yQKh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:34:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:34:18 +0000
Date: Tue, 9 Jun 2026 08:34:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
Message-ID: <aigyd1rBHQHc8FKl@gsse-cloud1.jf.intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609144412.244678-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:303:6b::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f80541-060f-4d50-72c3-08dec63c91d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 0UATXab9TRLt7aGm7EF+aDTTbstlxOGnty2mGKudjClLE7a1bufondBAnl9M/gglcpBOzA5P1ohUJizQBl99SfFJwjyVQ1oAVFv47y6kq9iX3/1uOoK9mCX06E2lvFWQ8LiK3WThSK1iwzHuaHjiS0of3uGeTe0ODhwKjgVDt9IcUE1YAKTMv0Ikg7YveIl719IIBq4qIi25AfM2OrrQsUuzVdyn/jLCZjlPqNbTjnJSzyjfNaoxW6O2Gmcr+cHvTaehVQrDPAgQChd3d+lkVYpsEruIxWpJAiGaYZOiPC/pAoVs7226qJqvZ49l4q8eGMPXdoJDwH+Ix6elJBBUkNwG/89NjrT9Ky1Kcp4vL+EjXAwaogFvSgCsj8dSJhThVKfn7xO9lIJj89H8hHhbtZp8QOWTso0QNa5Sb/InJsdEgJPFUnEVBZzwAJCCpnw4dUQw4QCL/gsovUash8Js+zwJzpgNt/JcXUWfPxrqQ7QJipARDg8ppH8S8EQS15jxoDl9FpJTBm21qeGd+o14s+CvyzYEPu76RYseqBcP3IBavUbeFm64oBrvRGj5EDSlT/qTp+3/F7DodVpR86hB2eo3To7zZXuOxE1Y3zy3Lrt5tu4P2JLGn0iWr8yhOhMHfJTbDeQ4L7DA1AKc71/kmd+WDP9iken/ye7thOEodqspYx+3MdRp0LcW+unjAJyT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpEbkVlbVJqNGlDa2xGcGNyMENIL3BkVzVtYmF0TWNwbnY0S2Ftd3hXSmow?=
 =?utf-8?B?NEozRDFjdXUwTGNMcy9mY0ZYUENxSTArbmJrT3Jldm96T0haWXFQSWVMQm90?=
 =?utf-8?B?S2lrbW9kamZuMkZkYUFwWVpqNHdHelUzbmxjMjd5Yk01ZUlrNFBSQWhoOXE2?=
 =?utf-8?B?Z1RtMy93a2s3dkcwdjBBdTBFTExmTEdNeklnOGh3OVMyZUI4azIrRFJTYXls?=
 =?utf-8?B?bHdiaVpGNVVpNE5tbkV0c25LRGFkYU5la0NqS2RUeG0yaHovRm13dlZnNENO?=
 =?utf-8?B?SGpsUG5sNzN4eGoyampHM0RoU0I1K0I5SDE4dENhczRiZ0pibkkwYWp3Mk52?=
 =?utf-8?B?L3ZaT1FlYkFVTGFPZ2JQbnU1NktlVnNxbmRKR0thTlhJWTUybnNiRjVPOTI5?=
 =?utf-8?B?WmtmYjgwNDhiZ0pDUytZOUVtaGhkZ2RiSHBTWDJ2UmRNY0lYc1Y1Tnh2ZVhy?=
 =?utf-8?B?YW1INDNBN01DTDl1OVlPbjdpZms3aFo5TlAwVnIzRVVZTmxhbHVLakJaMy9G?=
 =?utf-8?B?NTBqczd0VDlZTnRRSEp2VU4yMXFERkhBNmZSeWxWTldOcU1PUnNoV1VIRVhN?=
 =?utf-8?B?dGxGNEs1U2puNXdCRlFjZVV1U0NoalJINlJuOUhHUFJQMEpLWjRYd0JVT3pr?=
 =?utf-8?B?RkNTZTRHVk1lSFNjN0VQZnU5QVJscVpMamF1akJGRTlKU0IzR044aHJnU2ZG?=
 =?utf-8?B?UGM2NW9BTUtOR1hqYUkySzd3Q0xGZmRtc0JON0I5YzZYRmlyNUR5NnVNSmRj?=
 =?utf-8?B?Tkwya29vUmpSN085enFqVEhwMUN2UXRNOHArV0ord3lpaEZETzhUZG03Z25G?=
 =?utf-8?B?RkdkMVFoNStIdXBIU0VDTCt4SWkzY3lma2JlZmU4UGJxZGV5a2ZWNGEvQ3JS?=
 =?utf-8?B?L3NWZGdnMmxnNHQ1cm9VUm1WSmZ1MStsejZJNDYvZUJaa28ybzdVeTBsQnFD?=
 =?utf-8?B?YTRqOTd6NVpENW1hb0VhRFl6REU1RFdnMi9vbFAwR29vNUZFRFZCTXFZNUR2?=
 =?utf-8?B?M3VMNXNibWFseXdqSmEyT1NrU0lKV2hiZE9HbEhMeFVWK2dZNW90Snp0akhC?=
 =?utf-8?B?NkpNZEdLZkJEZWZkZXFHVHFFS1lmTWVDcjlGblZMeUd0WDJ3alh1akZmdEx3?=
 =?utf-8?B?YkV0N3ZKRm4yeURyemlLQ0M5OXo3QStMR2tqdG4yZGNOSyszU0ZCcHRTZU9z?=
 =?utf-8?B?VlZPNWlNK3poQ3ZsMWF6b0F6M3g1RmYxT0dpQXZWeTBGZVRqWDdocHRtZEdM?=
 =?utf-8?B?dFZlaUc1Q3E5bjhKRm80bEREY1Vzd2xBVWJEbWp0UTNQZjIwSmRwbXNJMUgz?=
 =?utf-8?B?T2c3TmJxeWY3d1VwZ3RxUTJWWHJnNkY2ZW9LVlpnbVFoZWlQYXEyN0FTeXpy?=
 =?utf-8?B?UUhuTUJoMU1veHM5RUtUVmYzWmZ6Mzlvc3hRaHRCU0g1WC9vSE9QTjh2N0pa?=
 =?utf-8?B?NHBCaWJlc2lnOFlBZ1hLUU5TNUYzQjZZUkloNkdxd29mdFp4eVhkTHBPZnlS?=
 =?utf-8?B?MXdqd256aEl4d3Z2TmNiR1R2czdBMUtDYW5Pd0pwa29QK0RkVmhzdzExbGd3?=
 =?utf-8?B?Und3elF2WEpTQ3BYMytlNUh4OHg0cTJoQWxVcWFqdFYwakxjN0tWQWNIZEFT?=
 =?utf-8?B?WGhZRTVFS3crSkR3SVhtdEdQS2dwWGkxTjAxS0VFSVM2aHQzWURLaVIzQkFu?=
 =?utf-8?B?R3J0ejEvc2hKdkRPcGl0aFFCRDF1VUxMTWJJN2I4TUpMWEMxMXA5cXo0R3RH?=
 =?utf-8?B?Z2ZZL1VKRUpaWHZoYnJETnpYWU93NzBCVVFHMVdqdGlEK3JMMVBiaHhQMDZK?=
 =?utf-8?B?Yk5hd0FJNUF4ZnYyREtYUFRlQXRpKzBmZEsyR2gyZ0w2MklLall6MHY2NHlw?=
 =?utf-8?B?MXVrV0Z0QngxVEhDR3NtbGY1Y3hvdUtWM2VWclk5NmhnOEovOUZTNWh2TUJz?=
 =?utf-8?B?RHowUUpDUHFIeGVMOVhRZ2ZUYXptem5MNEpjd2UzVzVKMXA4YWIrU2FvbnE3?=
 =?utf-8?B?dktsUGtZYzB3b2ZFWk1oWklDU2ZFbkV0dnc0RWZRbHM2RndjcUxrbWNQclJD?=
 =?utf-8?B?QUVCa0JTT0x5QzlVa2JWdGNoT3RkVGZZcUxXYUxTTkFFUkI2aXJJRlJoU25P?=
 =?utf-8?B?TUJaNUozSGc4dTN3dWRHektUelZpR0NhSlZyL0gzdHI2cmNOcGlvUml5eXpJ?=
 =?utf-8?B?RENhelpOQ2VnWXNrZ0Q3ZGRKb0Vlc3R3OVFLOVJheDlTSngyWXR6Q0FKNUhE?=
 =?utf-8?B?ZGMwTE40cjdmSWxCRDNXbGQwWk5lcUt1c2JKOW5WQWZXdnF5SFZZOW1yTU1Z?=
 =?utf-8?B?RkFMd1VGK29MOEZ3dC94UTJ6MExleEJ0bkc5eWMyb1gxTUdZVGpRUT09?=
X-Exchange-RoutingPolicyChecked: KO6F0pFTcTqe2U6ypg62zAgW0PJpI7XPfmQKXm8ZQhj64mnMkrD7boPO5014+iTdIwyIF+wWPjBSejyu1v3LqMvEKr30arQ9efp2yP2JMoikLE6i3/VNusOaEr8JWj5EUJnXBX9qGH8N3VpuGd2EEsf1XmEDoIFS87KQ2j8HgiaWKmDEcn4gTWqdI6XsnhLSLy6G4ARDtdCFGH2U3pEy0czmu3m0hRojSCJX2sG/UTaI3UuzwoAwqOB9RH6w8qkFaTACP/qMEAk9LZRDsrjWX6s6lfNB3J97chlU3cMhtvaIwbjiPoZcUta/NXmZmD95ZGJtILxgX13x8dHAKO/Tfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f80541-060f-4d50-72c3-08dec63c91d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:34:18.2072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOd4xNh8HYpBRAc3isGKzK2ZfMuY0ALIsttWK8gFdIV0/F1boBoGB6FFkaXxNln7kv5u6OHK17yUN1pgveTjgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
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

On Tue, Jun 09, 2026 at 10:44:13AM -0400, Rodrigo Vivi wrote:
> Jobs that GuC never scheduled were silently errored out instead of
> triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> should wedge the device rather than silently fail, and userspace VM bind
> queues should stay permanently banned rather than being reset and retried.
> 
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter; without
> it the waiter sleeps the full 5s timeout. For not started works the ban is
> cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> after the GT reset — a banned queue would block resubmission and cause an
> infinite TDR loop.
> 
> v2: (Himal) Do it for any queue type, not just kernel/migration
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 41 ++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4b247a3019d2..5c40eee41103 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>  	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>  }
>  
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>  static bool exec_queue_suspended(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>  			   q->guc->id);
>  
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;

I think there are some edge cases in the VK conformance tests where,
with a large number of queues, 5 seconds isn’t enough time for queues to
start after submission. Based on a 1 ms timeslice, this would correspond
to more than 5,000 queues.

The current code allows a 10-second window, which is just as arbitrary
as 5s. This isn’t a blocker—just something to consider.

>  	}
>  
>  	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1460,6 +1466,12 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>  			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  }
>  
> +/* Unstarted jobs (GuC scheduling failure) and kernel queues recover via GT reset */
> +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job)
> +{
> +	return !xe_sched_job_started(job) || (q->flags & EXEC_QUEUE_FLAG_KERNEL);
> +}
> +
>  static enum drm_gpu_sched_stat
>  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  {
> @@ -1608,19 +1620,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>  			       q->guc->id, q->flags);
>  
> -	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> -	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_gt_reset_async(q->gt);
> -			goto rearm;
> +	if (!wedged) {
> +		if (timeout_needs_gt_reset(q, job)) {
> +			/* Retry after a GT reset; wedge a kernel queue once karma is exhausted */
> +			if (!xe_sched_invalidate_job(job, 2)) {
> +				clear_exec_queue_banned(q);
> +				xe_gt_reset_async(q->gt);
> +				goto rearm;
> +			}
> +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +				xe_device_declare_wedged(gt_to_xe(q->gt));
> +			}

This part LGTM. I have seen when a device gets in a bad state and kernel
jobs fail (typically a bug somewhere else in the driver) kernel jobs
just spun forever - I never spent the time trying to fix that. I think
this should fix this problem?

Matt

> +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>  		}
>  	}
>  
> -- 
> 2.54.0
> 
