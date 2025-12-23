Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A4E748FC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 22:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D0110E123;
	Tue, 23 Dec 2025 22:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5QzsGvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349610E123
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766530413; x=1798066413;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pgfDwbrIOBIAVpk59m1aXsNZwYa8+GRFvJpd9+Tx484=;
 b=k5QzsGvYjxQk/geRp7tDyLPBbW2vfSTQ6C2ly4HqYr5BxuH63bLac3gS
 PdiN8JshLxkj8FouYC0Uh8C5oLPt8TC3e1yEOWd4TfLyqZf0gZIPdWp+1
 OOIxfFpuJt9aBps9mr7gqxrfhHDP+zsM0oBes70LPuQjwj2T/MZXYVkP6
 54CqGorw1HuQf6+aGP5EmCk6JEDfhC6pCAJEzMv5AVnslFKFtj+SL4l3O
 kCYvnwlw8MiLL4hc/Tc6pK63Z3cnVduBWXeSh+gDDUT1EjZhkvgUcaFG5
 DjZF30lX4k8Plx9bOpwfM7omtYLlcYDBoQ5Oyi+PwTQvVMvTk4JmfLsYY w==;
X-CSE-ConnectionGUID: K6F8xZiVSk2q5gMd8x6ZDg==
X-CSE-MsgGUID: nLKEcouSRruHjITMRyPbAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="67374536"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="67374536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 14:53:33 -0800
X-CSE-ConnectionGUID: Cr/NWrJNRaeruWEM/L0c4A==
X-CSE-MsgGUID: wugbmNIMQWyI+XMvB+unGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="204808600"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 14:53:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 14:53:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 14:53:32 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 14:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQi6vs3E5e+k8DkH8g4cA2nzWl98TYH/DKAdLYMROUxhpuiykl1kJoPek/kmZbBOZ1D5nUu+/t7Z4DzjdlHzID2CBXJE641Jx0XzG1rERNLWbr2W1vKSqdM5ZTipfVK4SExpSFcBBRW9ZLX+PB0yF83iQow4xuEftAXf1R600Dv65V4Q+jZuPJplDn3Vb3LwTbs44paVW4urf4zYwuvVAMo3bx/GDy/OUXOwRZTDQCZdOgQkE/Kw/KPqMwmDBBDK8IVMji+RfnzmUIE4SWZei9tLD2YSl21KJM/GjAYAS1WKUfpGN4oOMp6epVf/Bda5lj/GoeQrZ3crgbpITy5rxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bfC1d5hjvmsc5Dn9V12LQirIrh6zmR2oN2ehfon76I=;
 b=nnUH8iWezv3sTuI0xnWlzk6/nYC9Hztg3QdoD2f031NVRkLPjMcSVRDF7WB/KzFj60FpZpYBaDwrHLw+8cmnhZRj+l5EZAcn+25/PVcY4KZnByKbmNw7yKWDFIPw3Gtc0WlCS+dXJlGQS7F9eqI2QbdqhgrcwyP+oh/t1mknawlCHyfyDt7LX7HhRFRb2nq2oU36Iuzz+nAa7G+V2MGDl8us7FSKI4rezEDlXlZ665eMwvqBy/qQ//jswe+gNbHHUc4cY+ZsJUE3ub9jQo+7QeKEf6XpTROen8bjQQCWWyiED8iwr3Jm3ABdylKaX+07MY4CWjoCL1jNWPUHGEhMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 22:53:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 22:53:29 +0000
Date: Tue, 23 Dec 2025 14:53:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v2] drm/xe/device: Convert wait for lmem init into an
 assert
Message-ID: <20251223225326.GF1180203@mdroper-desk1.amr.corp.intel.com>
References: <20251219145024.2955946-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219145024.2955946-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 62726087-54c3-4f9e-6661-08de427616e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q13V/9V/+HiHsR8eLwd0ivaugF/IOv6iHd7Ua+Brce4aX0fQhikBcgmVfUaK?=
 =?us-ascii?Q?xq36WwcNhBYiM0BeZo3kmkB8lgN4jeyHv/cybsE7tLA1wObasYtdGScF7efK?=
 =?us-ascii?Q?6Cd3TzoJLn6uo65bEotp835wMM1uA8oX+yg49U15eGY0wToZ6mnM1tlw5sw9?=
 =?us-ascii?Q?U7gnX0dQTBk0xhvpcwxDDEjex5u2b1tKLyCacANdHoklcr8DXg6AlJnWWHH5?=
 =?us-ascii?Q?PlNr+fbdwP3rA7XLaPxg2okT2vng+lb59w9yS5jwKhTCDfq7RRs9/X+Lescu?=
 =?us-ascii?Q?rGfoA8XLXpQI+QoUb5RXquS8thtbIbp9AYxtByySXV+o7K5bmAJ5+ec/bkEl?=
 =?us-ascii?Q?lv7YSqskX00ri4wxlc0QxF+Ckhdhehufi71hKpuvxcChvufn7ySB0MRRBfEI?=
 =?us-ascii?Q?YwbynwhA8qG25BKyXKmZAFJzodlkfjFXcv226gDRVGyuT8nt0/4kjYNm3qBX?=
 =?us-ascii?Q?eSdnSHq0vxzOrrtxp4JcdNaMAycdWcjloUCpyNKsIM2FmHHIZ/cU/+VJD6HO?=
 =?us-ascii?Q?VbKlLxhXmR0yDFv92CF50scf38BNYr1cQa/HdK70D+ncJeHiHF+4wbErPW7p?=
 =?us-ascii?Q?vLeOL4yUdHRmMuW4qrXYzgatCdohE9c/jv5gBaxuA1TGou/CddAn9ztpQwec?=
 =?us-ascii?Q?611uh+Wg7YfLb1PD6Lx3anSIzS9xj9TWhaiQBMmmf5jJkO7798+eZcep2bu/?=
 =?us-ascii?Q?wlwNtMpAfcYP1J49bBvTLrALaPbWDYo4CcZcOM8iRp4rm5AC9UlHesqKale5?=
 =?us-ascii?Q?6w5n3wRUjSYdM+HjcAGY9zwRV6gQwzxYna2xQDAdFubUx+cQ51KK4QpI/9Sq?=
 =?us-ascii?Q?tlueTmisNXzBf6K+YJOhi87GvjIY7epnhPzy+E715coD9zHK/1QDsCeE7iaE?=
 =?us-ascii?Q?dzswur5JSXC9S/iNSDZ8/nVIM+0Dv/09lM6EDoqemMMbM4rox4NW31wWRMuZ?=
 =?us-ascii?Q?xkkwJQtICsm8TohPLusrPle1taE1pMTV4ejXxUleQMff2r7Fm5jhHi/whnU7?=
 =?us-ascii?Q?1qT7nb/WE0c207/KIgpv6SRxgY4aW1fLx6haM39ZTHFPaFgWpKmtv+uK+3Z+?=
 =?us-ascii?Q?49NnX6yq+3qAiQN225aXbtkAAEo6pKGmNKLXdH6kCN3uT2rkDe3OLXSQ6x3Q?=
 =?us-ascii?Q?l73zWE2PAty1l74gI5U02LZa50uvzspm3ZSl67AqA+AUmJZg9Ujid+VhC7bg?=
 =?us-ascii?Q?6NJ0I+DQGUYnF9wVbNWNyNwCispl5sZJl0hnkVbKWASlOypgsJfNOsginiRD?=
 =?us-ascii?Q?2gsVF/ctgoBACFzoX2oTPWzRb7sDOb+G4yMNjaPHqPhmicrqcsprJuxAatvO?=
 =?us-ascii?Q?Z+hC2qEkUYDRp+nfHpI15a9JTUSircbLUWKRPDAiD3bL6yxBKpuc6ppUf0hJ?=
 =?us-ascii?Q?zNFE/UJ6WEpYFcnqRx64is6hEVqSzpc0a/5082SXhirSvz371PCJajFQKcyr?=
 =?us-ascii?Q?09S4Cu0zfhnH93I7VzQaEDXcoyQonIbm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+qH2Yy6QP+W0eQL1fUMNl5KFRoqyTSOgZvI18GT8+BkxhUrATXUSt8+MC2HD?=
 =?us-ascii?Q?rNZd9umsJvcIgBkMYcd+k4DR+ZcMZqYC19AxMnigE9FcssdwztF5tcznJLfN?=
 =?us-ascii?Q?zsKA/KgSPSzfc1oxKYgzzFWQsRK3HsVi2lgyiIwNKxylCAIubW/xM3yj5jXE?=
 =?us-ascii?Q?kuZqgfJYMDiqFt+pspte8q69PPRD8R8UwQWVtroO2Z4v9jA1aCCn3xvwWuoZ?=
 =?us-ascii?Q?1Pq77fV16UCV14T3whcwqxTBerQntTFLyN6xmgeI8NPbSp80fU+IdyZXhFr8?=
 =?us-ascii?Q?K7Zwfrz2N7eFTKtPrc+BjygCGjrmwd6cWpZVE0TGFzH3e+kWdYU569u4DUR3?=
 =?us-ascii?Q?scM7jbNRfTFSY5KJwpkRe6gCfQe9H4zz9HKY662yc2PfFNIAv3cYCfhxwmLF?=
 =?us-ascii?Q?RQLQJ9/5o0PdrcXk/7TFC373y331UblV8/KFmmbWEN6AfCvALl1XchSzeWcO?=
 =?us-ascii?Q?QdNZuvYNFvLKCmulxqvcwQLZ2n9lx1svpCahP02mnSXgxg8qxOVUByHOUthK?=
 =?us-ascii?Q?01T3bYcPOyhhYyywQ1R2XcHT8Kb7xv8O3+GL70OxnW3rYPr8FRViZsYLiEiS?=
 =?us-ascii?Q?JDJBqe1F0o7joQeNQREH+qvdx67cbb3yrsWvJ/HI82B6CehmFJbkjz0TSRt4?=
 =?us-ascii?Q?Jl7mQ6GOG7gCcclStC1lhbwQU9uKTBkAKTgGKG5qtBrRhiRmiZsSqX57CaSB?=
 =?us-ascii?Q?jQTZTjFcBYEN3l48QH5HZZqm5J8Hq27eMgMTQGLxoKR8pL7MY7lKXpP9Kybw?=
 =?us-ascii?Q?OvV+IsUMq8fWDEel4BdD01vmlXg/e/+BUXnlU02/g9y3AkPbq5Sm7hbNugfL?=
 =?us-ascii?Q?pG6kOmxPdwgnX7Wbm+QziVbPzgCsgAzN3bTHxY/2NXO28FqZsE4TlFJQCNFs?=
 =?us-ascii?Q?DA4dRvelJZV1QK2UXSzoJkRn8EiG4pEYMdnlTIliNJ1D5rGy7x//3FbxkC38?=
 =?us-ascii?Q?cNw30esrkpmEIL/xKQI+3rwZwKHjOl3j9DIg/LJK8vr2jb8Hm8hSt+E3dzz+?=
 =?us-ascii?Q?ymhF1uTLRz3qWCOa0LW74DXlDiB6R1vN+JAI0Qfp4fps9Z2y/txW2g+HeASG?=
 =?us-ascii?Q?AJ/U6YtWHa48FNNmKH1qpTyMbWueKFNBhzLXnd/NI4mQXkTB6f54PShNatRR?=
 =?us-ascii?Q?G9VPXvRxPvU3YGw7mAyAcyF3P/TWq2GBDHDGbmm//umdpUiFZnIwKEPbPWmw?=
 =?us-ascii?Q?3Lfxs2MpbGump4ghtWZo8ZCpU//2mBWW2eDfGsd4x9lj9UqY0Fd/EyRoV59M?=
 =?us-ascii?Q?c2OIJ8s87eSdT1vXf6jkdkTRnXph2owx+NDYGjn624PNC6ABCXkr69OzZsy/?=
 =?us-ascii?Q?6/jMdU2n25IKab+0P/A6dyDvmejJHqFfgjIrLrj8FzctDdWOshzDY5+Mgj74?=
 =?us-ascii?Q?LoSJKVrMzZkVC7sKixois2kkSApLLKxPgqXUlTsHy1a0R9FcaGddjlg25sTK?=
 =?us-ascii?Q?wZqny8uQI1CUIEWnSgBfZ7JSVKihh03ttSc/zFZr93qMI9TOd4Za6GAHYhej?=
 =?us-ascii?Q?6evLScgQDptjSuHUtTvxLDk7fP6JLCBcLOOFZyVBmF/hYBFJhRSfSAIxZDBX?=
 =?us-ascii?Q?mYNRK/eOWKgbiAGCfTbYSZvjLL59A64X9D3kUbcOFwb+RzKKmkRuMvYL3xOL?=
 =?us-ascii?Q?7yj9e4bVP96l571xtQsx9pLVvkREAr6ULRMh24qIrtzGNQGJ8GUMgp3ffW9K?=
 =?us-ascii?Q?ecngyD6Wanz2LgcwUBLUnLfLohNRKzjUKy83J4YbdL1s1E7fLNL9gx6YS1fk?=
 =?us-ascii?Q?Rv13TViEh6/REZOxoObWvC76e7gnvQU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62726087-54c3-4f9e-6661-08de427616e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 22:53:29.3539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEPpaUSfT44nLFraZ+c06Ga3HAYTSPfmBdjMuq0V3fn5wbIbRssO02wcKLZb0pWmoX0FNVJFqg5I/r1nf+BvAXbKipIwXnO3N/bf+5DaGTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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

On Fri, Dec 19, 2025 at 08:20:25PM +0530, Balasubramani Vivekanandan wrote:
> Prior to lmem init check, driver is waiting for the pcode uncore_init
> status. uncore_init status will be flagged after the complete boot and
> initialization of the SoC by the pcode. uncore_init confirms that lmem
> init and mmio unblock has been already completed.
> It makes no sense to check for lmem init after the pcode uncore_init
> check. So change the wait for lmem init check into an assert which
> confirms lmem init is set.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> 
> v2: Instead of discarding lmem init check, change it into an assert
>     (MattR)
> 
> ---
>  drivers/gpu/drm/xe/xe_device.c | 73 ++++++++--------------------------
>  1 file changed, 16 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 00afc84a8683..b5d00804f164 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -8,7 +8,6 @@
>  #include <linux/aperture.h>
>  #include <linux/delay.h>
>  #include <linux/fault-inject.h>
> -#include <linux/iopoll.h>
>  #include <linux/units.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -638,62 +637,14 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> -static int lmem_initializing(struct xe_device *xe)
> +static void assert_lmem_ready(struct xe_device *xe)
>  {
> -	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT)
> -		return 0;
> -
> -	if (signal_pending(current))
> -		return -EINTR;
> -
> -	return 1;
> -}
> -
> -static int wait_for_lmem_ready(struct xe_device *xe)
> -{
> -	const unsigned long TIMEOUT_SEC = 60;
> -	unsigned long prev_jiffies;
> -	int initializing;
> -
> -	if (!IS_DGFX(xe))
> -		return 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return 0;
> -
> -	if (!lmem_initializing(xe))
> -		return 0;
> -
> -	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> -	prev_jiffies = jiffies;
> -
> -	/*
> -	 * The boot firmware initializes local memory and
> -	 * assesses its health. If memory training fails,
> -	 * the punit will have been instructed to keep the GT powered
> -	 * down.we won't be able to communicate with it
> -	 *
> -	 * If the status check is done before punit updates the register,
> -	 * it can lead to the system being unusable.
> -	 * use a timeout and defer the probe to prevent this.
> -	 */
> -	poll_timeout_us(initializing = lmem_initializing(xe),
> -			initializing <= 0,
> -			20 * USEC_PER_MSEC, TIMEOUT_SEC * USEC_PER_SEC, true);
> -	if (initializing < 0)
> -		return initializing;
> -
> -	if (initializing) {
> -		drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
> -		return -EPROBE_DEFER;
> -	}
> -
> -	drm_dbg(&xe->drm, "lmem ready after %ums",
> -		jiffies_to_msecs(jiffies - prev_jiffies));
> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> +		return;
>  
> -	return 0;
> +	xe_assert(xe, xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) &
> +		  LMEM_INIT);
>  }
> -ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
>  
>  static void vf_update_device_info(struct xe_device *xe)
>  {
> @@ -748,6 +699,11 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
>  
> +	/*
> +	 * Check for pcode uncore_init status to confirm if the SoC
> +	 * initialization is complete. Until done, any MMIO or lmem access from
> +	 * the driver will be blocked
> +	 */
>  	err = xe_pcode_probe_early(xe);
>  	if (err || xe_survivability_mode_is_requested(xe)) {
>  		int save_err = err;
> @@ -764,9 +720,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  		return save_err;
>  	}
>  
> -	err = wait_for_lmem_ready(xe);
> -	if (err)
> -		return err;
> +	/*
> +	 * Make sure the lmem is initialized and ready to use. xe_pcode_ready()
> +	 * is flagged after full initialization is complete. Assert if lmem is
> +	 * not initialized.
> +	 */
> +	assert_lmem_ready(xe);
>  
>  	xe->wedged.mode = xe_modparam.wedged_mode;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
