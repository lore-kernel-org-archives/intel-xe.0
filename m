Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F30CEDD86
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 13:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383510E4AF;
	Tue, 18 Nov 2025 13:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6WwhRT0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09F10E4AF
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 13:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763473350; x=1795009350;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AZ7IeLrWw5tzm4kYgCuVgK5VefSoSij61mrtfbA8xgI=;
 b=D6WwhRT06H71jJ9mnk9xXQKfRzNtPG52GrZzZkBW39xvXqw9sU5Wkz1C
 LJlVPLgEIr+PPnzHIbkabFK72nXhcCNbS06iQ4Y4+zDszPc+OFyhJaW1h
 hz6sQUQIYoVXs9mUhmVZUya9eeDkdzXaJC9EDne9exLx2NjmkWj9jXlBb
 378XxHPG6qZpl0wpbfMDv6v8+StrB/PetJQUVfWUoj7nbWs/hUXGpO1z8
 EpoHoguM4YFOuTIutlBLLAD3BBSrSlikKbBIuIO5UL7lqolEd2a7hHlxA
 cCNBukIRJ8E1b4xagOwe/zEsy62om82QUW3hdV8mRb3tLzg3HyCj8qPxE g==;
X-CSE-ConnectionGUID: tsZsaBEERRyVVCXbdE4E9Q==
X-CSE-MsgGUID: +m2Xmv4bT46rCQUZiRollg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69346559"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69346559"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 05:42:30 -0800
X-CSE-ConnectionGUID: LWuRFDTOSeCPsKbP1PiOkA==
X-CSE-MsgGUID: liAfpM6gR3uTFSk99It6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214157465"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 05:42:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 05:42:29 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 05:42:29 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 05:42:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNe0S5ZGzQW4oHbLoMkkXD82MMV1Ln68Dr8cThUm9qfr2z2rooQJEinNDRexWisyI/X7OGXwu4BjDPJatLdGG6qBPvn1Li3i4mo8eWjEJvRJHBdh+ulk/3+noELSEy2C+LqqwpN8mFJXugBOOqSEFQTViQeD/Z8jQrKJPSnHp8/ILwBNlL246vip9YKbhHJ75KXtRgARIeD09k2Ttaw58/HOBwFYusuekbgbaryDaxFde1F637xij5qP8fqqyRVYpxD6kImNurhEUkK313+mawhhbFmo8DnGNUE/U/TxJpbAaAAq+Q7BFrf9nRfy4b47e2Mcnwi15b3VZ6zWopRW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAayJAt2Vgxd4YaTW+pfS3UreqiQXTc6gC9CxluGFkE=;
 b=sx7NWAZJQzpGssOD9l0dpdKOgMAE854b+FOnu/FPQ02zghtYqjNtxQX8I27UgLdTy/jIpUcIn3XUEo7dpH/05wrTEs80yMBoiVav+QAKGM1JS2pt2ceoIgubv0RDBI+LV1QAPMq//foL5n7XxF/nTs9K8cFoQyYSNdvnDStx2J1Cbe6Xe3atZMfwqO+ifByN2qgqYH5YlOszLGiypmbJgyGOVC1cBb4PZz8qCdzvMe65iEHLKZsjvEnpELdrApWMu9bfBKRAkF/H2Lf4hH039inuZDyo24WfgBXq6m93m7V+c5rlaEvqZ7sEShYZDIGR0e5UlhqzFvguopBKxA5CTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV1PR11MB8842.namprd11.prod.outlook.com (2603:10b6:408:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 13:42:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 13:42:24 +0000
Date: Tue, 18 Nov 2025 08:42:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <jani.nikula@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <ville.syrjala@linux.intel.com>,
 <karthik.poosa@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
Message-ID: <aRx3u9LuWvhGvMZj@intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118090012.608250-2-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV1PR11MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: cd587e0c-a6c0-462f-189d-08de26a84e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XdRXGMOgMxEisdTjl5E2B1Kd6ZNQijlI30FwCWA7eLbbHEZmD33tNIXXcW?=
 =?iso-8859-1?Q?kLUz9Gct7AEhCWFISrjSetrvPvCBe7BGAfAIDSlPkU6y8FNq9pOlPDKDTM?=
 =?iso-8859-1?Q?/MKdxmSW4/sDvucCz7iWX0wPEMWCpgnAWDrxp1wYjgoNoNJ3hcKcksWcfM?=
 =?iso-8859-1?Q?Tb9IO0fMOH2KDEe6FzRjrtXhmCCa8idSwFnxbgxLHIiL/JKCKLnIIAo9OY?=
 =?iso-8859-1?Q?DLDk8yVQRNpOlmty8sMF0mxexNHIAYphcMRxbV6qpeZYIJnzPCMUhKoVjC?=
 =?iso-8859-1?Q?L9WTFBvbDTFE7IYF7abLoTwyX2dLpZKsbsSvB99k553Plta5OfgjoIlRzf?=
 =?iso-8859-1?Q?37C/juEU0CKGgmR89STkGrpoAQzZnLyUMOa6PMjjIYH1gQRG6xWECIGTuA?=
 =?iso-8859-1?Q?oXvQ7gxNfQONJ2AytqPl0+Zz8Ojz/sMIK9NIFRti4CTeVW97r4x2dRIudJ?=
 =?iso-8859-1?Q?VCZ3C3Q7Pzs9jo1z654xQDyZhTXdO11PIYWRwtRWgGgxr4wz9Sn+mMDsFH?=
 =?iso-8859-1?Q?jPzL+oFGnIJDdVvDeeinz0lbE+yslUzbK7pPqoJnYIpkPxe4NcAL+L0DCR?=
 =?iso-8859-1?Q?97L5zlMXD1xYIK40Tlg+Uv3QGTc/eDBcJhdDtwbyohTPmJ9L0owZznpuwW?=
 =?iso-8859-1?Q?KEL9XPLVvVTV4lWCCWEMlQ75k4JlsemTGOpcpku6vgQ5krwhm4qGPpgrr9?=
 =?iso-8859-1?Q?jTQv6miupqaUKGO8ytnbzJT189o3kInvMQiyKGZeSohb4YPHKdJmJqIYqy?=
 =?iso-8859-1?Q?yF14Z2GKn5OlZbusMM4DDiy9iqO/gAnDkzCrQIbqi3MWxnqthSDaOiVjW5?=
 =?iso-8859-1?Q?/QP6Jlc3UIdbC55EmqsUNJxfBt9/+1fyJbvZ63uRNG3tj9+4IBx90H0vvr?=
 =?iso-8859-1?Q?6bs4FhvTOo/gob9+ExcFfnVMGXqhzupuQilglBYwFW8vB4998XWZoMSHIY?=
 =?iso-8859-1?Q?7cBq/iqdkgqUjV1V4e7UARnHeKBBhocC8zfEgScMcu9Oax4jCFDRjq9rzh?=
 =?iso-8859-1?Q?VTMcDq76xd1K7TX4/iwy4afYLyeE6J0g1iLiwQo0Dj0U3aCZiDQDQG7djg?=
 =?iso-8859-1?Q?F9hgFhBarE4HBDGc/3ZEEbAIvRf4GV2+7UwiSFF6qN56SNTfDu+F93ax9i?=
 =?iso-8859-1?Q?BrnvAK/gJ8ioVmo1hWL5yoDBIGGuRjjFpSMV0CCuyRAIfrQvcKrg87/992?=
 =?iso-8859-1?Q?ELYGZs7ZdfUxidV4saEKFyEaOpKJt7yqyKAFXEFPeFpK3QyKHHbKSqIg/0?=
 =?iso-8859-1?Q?AtNYxQnJfc/QoyZeyLs+22dNQIi/PrTwwrsu9uNiff3+1oZoFJ7A3VzQeO?=
 =?iso-8859-1?Q?+bA6lpgkZEUgi37emzQc5dJNiZn8hARQTwLdJu1WhXAzaiHq86cD6bxCHp?=
 =?iso-8859-1?Q?zA9348USz9TDOLmfZhgcQ7oe8hk7T32GhooRYjFB1/KptItIH9BPYoLC6E?=
 =?iso-8859-1?Q?IdlEMevTh2Pq3r65fGiCzvxakOZc2tumbOC3TRRy/1iVGLbSdYtmbUoC4c?=
 =?iso-8859-1?Q?fnRiu4lMLn2NxCKpLMjnzJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?M1ZiN1V9z/1iqXmpdxcy9uHzS45621za2yVvQ2rNNz2FkF/XWCHDbsVU01?=
 =?iso-8859-1?Q?7cX35aFyNwNVLNakY9TQTWmqT3+iO9lu7npk1/weG1YqNBjO+0z/1BrrR3?=
 =?iso-8859-1?Q?/VqAHNYomf/te26XhJHHdX0G2yiMDHvPRijNDSZy9ABJiE9Dh90hVkr7Hp?=
 =?iso-8859-1?Q?PLCXMKJ14o5PKkkAmOttIbbe8mUifx0DUy6eCa/ArlxwP5oUhv/mitd0Y4?=
 =?iso-8859-1?Q?wceJn7GyfGuPkunQecs5PXnVbG4iOXtvEv/q5nqvqTqjrOVAd9zOIxRJ8z?=
 =?iso-8859-1?Q?0ujdtsvoJoRTsxhGDr35+U9tJzhBoI/r8FtNsyp2lZxaKxENv09PRWkLcn?=
 =?iso-8859-1?Q?Rcps7HKfalluTlJ6oHSFjsPwLJVg5jXdgbJ9bzPHaFfbCmmgJpfz5+Fi6r?=
 =?iso-8859-1?Q?nWa62wAyKEsgMpWGdw9iPGjy/BjoLe1jqNZu7W9pcpkubtuRtiRKHqoQmZ?=
 =?iso-8859-1?Q?8+zSbWJ6H18r2q3pTghEXJCGhcgAtOtbGla1kdTnTyVqBuyHrKEBovvh7m?=
 =?iso-8859-1?Q?ukHjatXKcUt288r6+OStBn5FQ6Yfwdc5smF9ziYRgTUFgFUZT2fkvDD7lC?=
 =?iso-8859-1?Q?982gSyWjG1unYIcOI4zlzz6pBDiKh5NoU8yLMS7UFNn1LJO/Bufi2By3Kt?=
 =?iso-8859-1?Q?X+30hYpvPsRY7RwbWHKdQOzYs123FwTNgqT1aT1dZdZ36VYAW58+Svswzp?=
 =?iso-8859-1?Q?WSJrSu1hDPovqvhi4PEya1rBrkHK2/GU2rIg/V9pE0TXerA2BuWKixZXhb?=
 =?iso-8859-1?Q?boynzQUU034jUEjvnGomqklUQt/+XxBNkZWBVxrApzH7YMlRWn4O2X2Nlu?=
 =?iso-8859-1?Q?ZOVhVuH1NeCoVVjmPU9405cQp94z3K7p8XG8xOKDvuLy3BZly1gUyqJPga?=
 =?iso-8859-1?Q?XGSPYSwC3GzFHUbl0fFBy9dksFpBvBe3OOsk9n0+06NxNJasea+EmMP19m?=
 =?iso-8859-1?Q?qhspNQ5d0Sv71VhAoxLibbY0WlE8NY+cqsh31QqgO5KyEPCgwIrsjEmcm5?=
 =?iso-8859-1?Q?i3ideJmAT/baQAtn+TLx7gwlWp8tQKvnak0l82jMeXcjHQw0Y5USoLrwGB?=
 =?iso-8859-1?Q?L8kUPe5WHrLqgYqIMx4j9L+oix4MCwWqgnQWlI/zjFHll828AZo7n+IB3K?=
 =?iso-8859-1?Q?S3/SWV9Kt/4qGc/zwkW/wuekMNIqmxwX6pzqjWwSckMRXIefzk5k3+y5Tv?=
 =?iso-8859-1?Q?IxPH+0yaMC4PvjLF97cAfCaFWHYTfMecn+bapzpolvpdKWWfBjgF09K+Yl?=
 =?iso-8859-1?Q?sk86tyVf+6hlkfxJqr/719wtx1zq5kmcRdQ8O8+sRtkVPtGITjep+i+WQs?=
 =?iso-8859-1?Q?mx4UWl+eNixSDaCWKcC2bfNls54uQmya8xX76V8NmPGY/XHI5LQiDti0ko?=
 =?iso-8859-1?Q?4B6azIZJxWU4NQ+3RkykLc4qgjlaworsEPL9hXvgArPX+1EH9nAlkzedg6?=
 =?iso-8859-1?Q?3ODX6uXbGgWX2wYQMK7FiONWOrhDg4SPwyNPvmMDCPjIzX25lA58ru93Jx?=
 =?iso-8859-1?Q?8h0rig/hUJY53Ja7owARZw9oEHeEhFrhU8uTvEmIKQ3U70DZzt1nbWzFSk?=
 =?iso-8859-1?Q?RKkV6xQwKuAjOaOJ6s2ZMdoHVSna5/Du4LVFryrKL1Jt2QEimJx0fndFUS?=
 =?iso-8859-1?Q?M9uuZAZ02CkgwjKm9yiAhBN/7JGnOpPrZW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd587e0c-a6c0-462f-189d-08de26a84e36
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:42:24.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKB3RK9vqwv1gcrEAORcccVDuqecK5LX4eyEv4wyjdxWbwyfyx8F8XiYc9obt1KOfOk2LsnuZ/Hd3YWoU97+Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8842
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

On Tue, Nov 18, 2025 at 02:29:17PM +0530, Raag Jadav wrote:
> If the device is running older pcode firmware, it is possible that newer
> mailbox commands are not supported by it. The respective functionality
> isn't useful in that case but nor is error logging, as it doesn't
> particularly signify anything wrong with pcode firmware or device as a
> whole. Introduce xe_pcode_read_probe() which allows the caller to check
> for mailbox command support and determine if the respective functionality
> exists on the device without it being reported as an error. This is useful
> in cases where we want to make functionality decisions in the driver based
> on pcode return codes and a relatively simpler design choice compared to
> other solutions like checking pcode firmware version, which comes with
> additional complexity of binding every single command to a specific version
> and deems pcode commands useless in case the driver fails to obtain it for
> reasons unrelated to pcode.
> 
> This only silences command related failures and still reports other
> failures as errors, so we don't end up hiding the genuine ones.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 42 ++++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pcode.h |  1 +
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 0d33c14ea0cf..797b757f7a68 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -30,7 +30,7 @@
>   * - PCODE for display operations
>   */
>  
> -static int pcode_mailbox_status(struct xe_tile *tile)
> +static int pcode_mailbox_status(struct xe_tile *tile, bool probe)
>  {
>  	const char *err_str;
>  	int err_decode;
> @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>  	}
>  
>  	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> +		if (probe && err_decode == -ENXIO)
> +			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
> +				err_decode, err_str);
> +		else
> +			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> +				err_decode, err_str);
>  
>  		return err_decode;
>  	}
> @@ -69,7 +73,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>  
>  static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
>  			      unsigned int timeout_ms, bool return_data,
> -			      bool atomic)
> +			      bool atomic, bool probe)
>  {
>  	struct xe_mmio *mmio = &tile->mmio;
>  	int err;
> @@ -95,19 +99,20 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
>  			*data1 = xe_mmio_read32(mmio, PCODE_DATA1);
>  	}
>  
> -	return pcode_mailbox_status(tile);
> +	return pcode_mailbox_status(tile, probe);
>  }
>  
>  static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
>  			    unsigned int timeout_ms, bool return_data,
> -			    bool atomic)
> +			    bool atomic, bool probe)
>  {
>  	if (tile_to_xe(tile)->info.skip_pcode)
>  		return 0;
>  
>  	lockdep_assert_held(&tile->pcode.lock);
>  
> -	return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data, atomic);
> +	return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data,
> +				  atomic, probe);
>  }
>  
>  int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout)
> @@ -115,7 +120,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
>  	int err;
>  
>  	mutex_lock(&tile->pcode.lock);
> -	err = pcode_mailbox_rw(tile, mbox, &data, NULL, timeout, false, false);
> +	err = pcode_mailbox_rw(tile, mbox, &data, NULL, timeout, false, false, false);
>  	mutex_unlock(&tile->pcode.lock);
>  
>  	return err;
> @@ -126,7 +131,7 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
>  	int err;
>  
>  	mutex_lock(&tile->pcode.lock);
> -	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false);
> +	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false, false);
>  	mutex_unlock(&tile->pcode.lock);
>  
>  	return err;
> @@ -137,7 +142,18 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
>  	int err;
>  
>  	mutex_lock(&tile->pcode.lock);
> -	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
> +	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false, false);
> +	mutex_unlock(&tile->pcode.lock);
> +
> +	return err;
> +}
> +
> +int xe_pcode_read_probe(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
> +{
> +	int err;
> +
> +	mutex_lock(&tile->pcode.lock);
> +	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false, true);
>  	mutex_unlock(&tile->pcode.lock);
>  
>  	return err;
> @@ -154,10 +170,10 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>  	for (slept = 0; slept < timeout_us; slept += wait) {
>  		if (locked)
>  			*status = pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
> -						   atomic);
> +						   atomic, false);
>  		else
>  			*status = __pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
> -						     atomic);
> +						     atomic, false);
>  		if ((*status == 0) && ((request & reply_mask) == reply))
>  			return 0;
>  
> @@ -268,7 +284,7 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>  		u32 data = freq << PCODE_FREQ_RING_RATIO_SHIFT | freq;
>  
>  		ret = pcode_mailbox_rw(tile, PCODE_WRITE_MIN_FREQ_TABLE,
> -				       &data, NULL, 1, false, false);
> +				       &data, NULL, 1, false, false, false);
>  		if (ret)
>  			goto unlock;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index a5584c1c75f9..688eca8f24e6 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -18,6 +18,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked);
>  int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>  				 u32 max_gt_freq);
>  int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> +int xe_pcode_read_probe(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);

Is "probe" the right condition? I mean, the right name for the exported function?

The caller is deciding to downgrade the Illegal command from error to debug, but
is it because it is in the probe? Or because we know that most of FW out there
might not have this command yet and driver knows that and will handle the
lack of backward compatibility properly... in a way that this is not an error.

But is this 'probe' ?!

I'm bad with naming as well, so asking help from AI:

Alternative naming ideas:
xe_pcode_read_optional
(Indicates the command is optional and failure is acceptable.)
xe_pcode_read_safe
(Suggests a safe read that won't break if unsupported.)
xe_pcode_read_tolerant
(Highlights tolerance for missing command.)
xe_pcode_try_read
(Common pattern for non-fatal attempts.)
xe_pcode_read_if_supported
(Explicit about conditional support.)

>  int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>  			   int timeout_ms);
>  int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
> -- 
> 2.43.0
> 
