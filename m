Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85624CCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 13:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FDA10E074;
	Fri, 31 Oct 2025 13:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzCpaeQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E2610E074
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761917093; x=1793453093;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/DVVyYVXAY/X712+8k7gO2xXPV7jYCec7mMPQzQFTjo=;
 b=jzCpaeQz+HVjfJCie0n2eV1i9ZscASfzvYu30aDP9rs8fyTvb52cYJuv
 qLBMWwLjsFbIxSq+OKfcnAhLr2HG97CWUQZu+8bkLX4UHeyHReO/UJKO+
 AVFcY3TI2wg7MZNijWNRk9TveAYQbWEwCCiOSk5HlAeEI7z/3LrA9GAJ+
 C+SzD/kBoM833lv5vd4EU31dLB0MOLNActYgrjoz1lfdfcQ7qtmUiiOGF
 HSCXgK+UXQtTZsDevdlaFAJyCJW8uYsBSw07lJJ3oMuIwOtvjl8q3zOcY
 KfvPRBNeq8fZg3c2NuqT/8H1Th/PzIpSDOuqdGGLdnPxm15yBFR/R1Ypk w==;
X-CSE-ConnectionGUID: 8qE9jwGNTiWUk1FNJr/XZw==
X-CSE-MsgGUID: JdiHjawwRHCC1QHdyDZ/TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63964435"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63964435"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:24:53 -0700
X-CSE-ConnectionGUID: R7m//11AQ6WUhvJMJENw+Q==
X-CSE-MsgGUID: YiyjReUHSju9BApGo3JMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="209801982"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:24:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:24:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 06:24:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:24:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZJHxLmrY1fM8eSzynz3gB0uba6mEQyleCepjYd1YqL+xyHbsAsKeRopyD5P8vtpO9FAImo9lF7Hu4tL1TymLrCZbUkMD9tO96243ztYO3ZxHwYewec+pn0WdLldP+0hLYqEqUkF1qYF6U5UJ8iQ3ALrAgB9IONz3aFa9dIqzfvuXJId+DxOKe/mNT0axSNO8HQlLaZSbYB4HvpoO1xW8HMHUtoacjsqIkMO2b6AzXiaFwJHxpgo9xE/gDyl34qe1V7tRqvXYqrRneTYD+zKHOOxabiA/baFvQHBRDuAb1Fafi+V0nNSoCZdy6qlgIkr48jrkqxTsYIhwwXGbdq1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZzLIYk4ztx2pm/5SlTaLtHL1LjyTQil2RgrQOLebwQ=;
 b=wO4VbgEdHOtiEkxf6ZQ/h/hVHzPto7YsMTUVcZuKHenZBZmABMzL6iUsr5wRpVOy9TmUx9zw0p7hk/MkTy74lNJgO7TciIH0pjD17GZrYxVUq3T5ZFkYnnAptjOMxrV2GlC44I14Jq2CuHKUScF0+DlhcfwnXHijV7vfN3jwp85Z2ZaC7vfH1/lbdulMT1Vqk8tQ54rzP/1r2Y3MWFNLvE8NZrPw7y36SiGhC817G6j387gKA02O2MQ9EpzstHURZzrR3JLbjm8ejlINm60K9y07d9DtdxIYNPWA8C4r3loCGBaUv8wCMhE4WQCZxDSZPS5DPhgt0hgYnJgp2ybTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:24:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 13:24:49 +0000
Message-ID: <e46e469c-b6d1-4234-aacc-19da58d487e3@intel.com>
Date: Fri, 31 Oct 2025 14:24:46 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBQRjogQWRkIHNy?=
 =?UTF-8?Q?iov=5Fadmin_sysfs_tree_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
 <176191439312.5608.3546810232975922850@10055242dc62>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176191439312.5608.3546810232975922850@10055242dc62>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 41aa03bc-9786-473b-154b-08de1880de35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qmlqc3J3THVVWTFrZ2FBM1JabXJPTXNJSWtiRFFJQ1Vldi9kOG1DcXF2UXht?=
 =?utf-8?B?ckFZUFVvbEp4cENqYVJKcDF0QnA1YW9Yb2w1aC85QXFWOHdkZTArTGovYVo2?=
 =?utf-8?B?RjhMbVp3TkczWTQ0eVl2Ym5iM3hOazcvVnZRVXlJTUNrbldCUWd3Nm05eXJN?=
 =?utf-8?B?UjA1V2RrcUc0cDFobGloMFhnUmxiMDVHRXpmMkJ2MUNCS1o2aUtwcHU5ZHNM?=
 =?utf-8?B?STllRjlqZGU1bWdJU0FNMFFMUjdaUWhMSmtJYkticENrMThkNkF4ZDIwbnkr?=
 =?utf-8?B?N293dVNYVGVYdE50WWJROVJ6a1loMFhkZGR1Rm5wdkhQY2p6cHJXbnJaRDRu?=
 =?utf-8?B?Rm1BRm0xd2tQYkpuQnl2SVNOSDFrMHpsOTlSUXNWYkpjNEc5Y0V5NEIxNlFn?=
 =?utf-8?B?dkpmM2xRVm41RG82R3Y2S0IrT29qdEpueU9DcURBUGE5bTV6b0ZVbC94TlVu?=
 =?utf-8?B?RnB5Mkh4cWtuQXNETXZsbEpjeE5lclFkSkllWWsyVGNwUjRqSWN5TVp6MS9G?=
 =?utf-8?B?R2VWTHRydlJWcFltV0hQQ0lCZU5rU05uZDUxQzdRMmVWMUdmU1diR1R5d3RW?=
 =?utf-8?B?Ry94UHdsOVBBejFvVUtuVzNFNGoyU0FSakRlZUJodlRnMW9VMmFDaStpWThw?=
 =?utf-8?B?SlJsUXhYQVl0b0ZzUkxkRG94dGtKWTM0UHZRRW1Wd2xCVW50VDB1YVI4Qkh5?=
 =?utf-8?B?aEJkbThZMHBNOVBYTnpuVVN6NVFYNFRRSURCT1VubVBlbnRNQ3ZZM1BHU0hO?=
 =?utf-8?B?MjJ1TDBPQ1ZwY1MzY1VuR2ZYVHZjYWNrQ1RyVXVSZHRBWkxkakhRNDJOdk5U?=
 =?utf-8?B?NWVQRGVZc3lsS2pzSXNxRlZuU2dYOE04NWRHMVpFeTRBUWphUzJHMlJyM2Qr?=
 =?utf-8?B?RDkyNkdJalFzZzFEelFRZE8vTjIwNU51SCtkVmFXQU0xM2o3cnp2TUgycWVC?=
 =?utf-8?B?NjlWMnBEM2h5K2hHQk5yUi9PNUgyemhGOG93Y0swRmIyeFh2d01QbDFnYTZw?=
 =?utf-8?B?LzZGSzBzSGxJVnRhb2ltZnJPY1NBRm55TkdIY3QwZis3WWV4SXhzMlRKRzVL?=
 =?utf-8?B?aTdPeVJZOVl1bWd4YUdVM0ZoUEVHUDZ0TENXbkYxekIxT3B3ZzdKSHFxbWIv?=
 =?utf-8?B?U2xJMmZHNjlVek9jem5oYnBZUm1HcTBNMEljdXZ2aHdUcnRCNC90QzlqR3dB?=
 =?utf-8?B?OGdpaG51SEdzcHRtSGtpUVFwVVRMK2I1d0Jrdm4rdHc1eVpRY2YzWHNoa3Rp?=
 =?utf-8?B?THU1WFp3a0hrRS9Vaml0aGw5S24yYnJPMjZkRlN1Q0pXdm95NnBuL1BkbmJB?=
 =?utf-8?B?QW9KVmRCbkEyVUdRM2wwRDFBTFA2TnoyRng3aDRrQ3dSdlVCbW1lL2NTVmtQ?=
 =?utf-8?B?TFZ6SXkvY3RxRkxVREg4Qlh5a3VMVDlucFV1NkhhSnlla082TVJBTFg3OXY4?=
 =?utf-8?B?dnEzT2Q0Z1JXcWl6RUpmTlh1UEI1TGlRN0tnVVF4WGhHYm9aUmRUTFNib2Uv?=
 =?utf-8?B?K3dHTW9tWUV6eUhsNG5LRVk1V3VKc1RoK3UxZ1BqcFBkRGJsNEZuZVJxMmRF?=
 =?utf-8?B?MmFTN3l1Ri85aHVtNWttSFB3dTBidGc2b0lkV1RITkNTRWg1dlA0T2ZkRVgw?=
 =?utf-8?B?djg0aWUybEhERy9xdytmc2hKK0pGUDRHMk9GbUxUQzhJaDh2TkFRNXZIVGpN?=
 =?utf-8?B?MTRDeFJYNnlrWWNLREdZdnZtUUF0RTVNd2ZVa1BnckZPQ1laekh0QWJLbHI1?=
 =?utf-8?B?RDdEak5wVUFXMkVSeDdIR1dNMmZJOTI0dFB6NmpVT25VaVo2QUh0dkM5Y2lW?=
 =?utf-8?B?NG5qaHJZR2RiRkkySlQ0NWcvVGE4MW55K0FBSzdzaUd6ZkZZd3RNUjRHUXR2?=
 =?utf-8?B?aUxlKzM5cDk4NlVrMU9iRC9PUlc3cG1VL2FoV3dRay9EcXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWI4YUJzeUpwblBaYWZRYWNJQUtxczVhY3hvRW5lQnppRU1yTCtyVUZOVSt2?=
 =?utf-8?B?Vm5VRDBVTm9zVGtMeE91Y2hoSWJVREVSY3NCZjIxU0hrUHVBd0JQbml6RTFx?=
 =?utf-8?B?aCsxWlBkVnRYS3FJMnM0SERhNWx5V1QwOFVaUkVmSEdjaEZ4QUgwL2phdnZZ?=
 =?utf-8?B?VjV4TGpaclBwRGxSaXJkYmJldXZ5dldUK0tVdWFMTHllS3lLWE9YczZoM3dl?=
 =?utf-8?B?NUlkRnBoaFM1eGV0aVZubTVkMkFVMi9weXgveER5Sm5PdERmSXg1RmExN2Rp?=
 =?utf-8?B?MUZ1dUlJRFUrTjl0ZmpaQ3RIMzk1U0hHS214NmhVNjU5Unk5RnZrZ2JZT2lr?=
 =?utf-8?B?a1Jaem5xRk1oaFl3N0x2UE1aOTJHZUlNSkJkRlVwSWZaT044ckw0V3dIZlpy?=
 =?utf-8?B?THN6Q01paHFqVkhYcVRPZ2VzY2JRUFBNU3hqNzZiUDN3NUtPUDQvT1NNRE00?=
 =?utf-8?B?TGtHdmhRZElHdGdPNDVoejV3c1VsNUdEZ3Vsd2xreEFtNmhWZWhYWWttV3Zh?=
 =?utf-8?B?TUl0dXhEaG14UVV2WWVvNjE1WXZFS1B2SHNXL2cvL0pqMDRCYlZKVDZWZmxH?=
 =?utf-8?B?RVMvZDdlcnhGQ0pwQWlzVm8xd2dGNWtENFVDb2o0ZTV5QytJcDJsOVVreU4v?=
 =?utf-8?B?THFwWWJoR01pYVdlQkxMS3ZxclJ4Ykp3U2ErR3NGNVRoYTRjRGowU2x5Vis1?=
 =?utf-8?B?NHFlMUhZeUhBYm5GY1lZN3Z0d0JTcENFRUVobER5TlNmUWp3VTZ2Nk9HS3VP?=
 =?utf-8?B?L3JKL0NSV2EzSnZuVWJuZjc3Z3pKSStvcm82NFordE11ZXNvcjAwRkpRSnZK?=
 =?utf-8?B?Z0lSN1VKc0o2SXJ2dkh1cSt4U2NQdWRkcmU2WXpMNmp3bVJGZTZRWlFjTmI4?=
 =?utf-8?B?THpxdnpQYVpFeTZIdnprbzd0R2lUU3hIblozTUI5Ylp5UHQyU042K0dBNlpw?=
 =?utf-8?B?L1Q5OEh0SXpXWno2akp4SWw5TlFSZW1lRDYzOUxKTC9BaW1PQnArMFpQZW9h?=
 =?utf-8?B?NnM0Qyt1VFhFZk5EQUJqcXNzem5PZG5HSnphWXRxVUNhMkJ0Vm04bXpLUU9k?=
 =?utf-8?B?VXVvTzJNdEhPUGVaSEFTalcyN1hsbVNYNmRER0k0V3BreFNHc1l2dS9RSzh0?=
 =?utf-8?B?aldKbWpNaDAzamUwa2M2bWVsLzVhNUhWb2NpTU40cmRJU2NuWFNRbGRiTlR3?=
 =?utf-8?B?ckpkT3hTN09IR3J0ZDZadVJ4UERoa1QyZGpmMUg3bStsdFB4Nm1PcVp2UHZm?=
 =?utf-8?B?eCs5b0E3UmdFTE5Gb0VMd1ltZWpYb0svT3JDcTZzTGRuME5ZRzhrQkFEaTVZ?=
 =?utf-8?B?L29UMU8zT1hGWldiVnBLb25lL3BCU3ZWZUNYNkMwY01qdHFVWS8zNVFocTky?=
 =?utf-8?B?UjhuS09rZk5mY1haS0FmUEJ0NFcyUFF6T3dNc29iQnhVY25BcjNXSTl2dm5s?=
 =?utf-8?B?dzhKa0Z3djEwY3MrSHRjdmQ2OWNrekhZNE9pcUNXREtmb2s3VUluK2duVmNJ?=
 =?utf-8?B?QW9hcTZzbHQ2eFVKWElYS3J0SllxZ0lrSzFacnU4QUE3ZC9hcmlRMndKMkxD?=
 =?utf-8?B?Mks1MkxFSUhxTjU4eGVzZXNqblpXSUI0K1lMa1hpMnY5QUFpemRLQVBYSVFl?=
 =?utf-8?B?QUZKZ0owUmZqL0ZuMGtlMnUxUEt0NGRkU1RZeDhLUkg0TUR4di9vRCtNaklH?=
 =?utf-8?B?STU0bHhlSndsd0M5aFZ4Zi9zRkR6NlFaMTBEUHJndVJCdUhpSTBrRVlyY0JU?=
 =?utf-8?B?SzBmZnhSM0o5Y3BCTTB3L3RnMURWcmpQQ0VsYlVicisrZmhUWXVxYWozTFg2?=
 =?utf-8?B?TkFFZUhHNDE4dlo5Y3NLNkZFN3lRay9oOXI3dlQrbW9HQTFoa3hKeDB0SGpu?=
 =?utf-8?B?VmZLRjFidUtuaHJqK2J0cm9VMkVxR0lERUtsbi9CcWtNRVJBVDhudG9PVHhB?=
 =?utf-8?B?aEhETHo0blhOQVEvL1crdGlZODQxcXJuZjRKeHB4SUo3Zk1iU1pxTzE5MVJh?=
 =?utf-8?B?NDhqSWVkTjdLZGE3VmdISVRkVE5vNmZVajZhRXVXRmtwS0l1cjhpTVVCSzAv?=
 =?utf-8?B?SDJ6cEJJUjBSclJ3NVRSYzEvdS95Slg4MmJoanVRKzZDWTBEM0tsWENpOUs5?=
 =?utf-8?B?Qm5md2p6N2UwVVF2d3Njc1UzaHF4M25JU3lzVGIweS9lMFRKL2JvR2NxN05m?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aa03bc-9786-473b-154b-08de1880de35
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 13:24:49.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgb7RyElLWv7r2ydo1tUNDhZulXPn8gpet+CrfIhfblnyoErH+NJwGk9QFAp526UNp9gech1idHiypIAb/mhGQtHq2B8kaxOMb2BVwc+CvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
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



On 10/31/2025 1:39 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	PF: Add sriov_admin sysfs tree (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/156220/ <https://patchwork.freedesktop.org/series/156220/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v3/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v3/index.html>
> 
> 
>   CI Bug Log - changes from xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340_FULL -> xe-pw-156220v3_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-156220v3_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-156220v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-156220v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-dp-4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v3/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-dp-4.html> +1 other test incomplete

no logs, but must be unrelated, since series is about sysfs not kms

>   *
> 
>     igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340/shard-adlp-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v3/shard-adlp-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>

looks that the previous test left a dirty environment

Test requirement not met in function enable_and_provision_vfs, file ../tests/intel/xe_pmu.c:980:
Test requirement: igt_sriov_get_enabled_vfs(fd) == 0
Last errno: 19, No such device

> 
> 
>         Warnings
> 
>   * igt@xe_query@multigpu-query-gt-list:
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340/shard-adlp-2/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156220v3/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html>

ditto

(xe_query:3610) <g:1> CRITICAL: Test assertion failure function __igt_unique____real_main1124, file ../tests/intel/xe_query.c:1172:
(xe_query:3610) <g:1> CRITICAL: Failed assertion: is_xe_device(xe)
(xe_query:3610) <g:1> CRITICAL: Last errno: 125, Operation canceled


