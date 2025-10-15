Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00100CCD192
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 13:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A550710E7BD;
	Wed, 15 Oct 2025 13:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adlUhrul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEBA10E7BD
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760533259; x=1792069259;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QZz0TiBlciI6ts9Ha8HAQ7vK+H/seenF/j7vwMgQLAY=;
 b=adlUhrul4JuWJcPEV9tKdXyr8TKkMKHf6n71H9VE7TKwVzVd2ZVniq9n
 is8QmkrTQuCAnpoYQIK+6HwzCvTKpXF4T3rJNYkG4VKLt5mLcmiiIjFpZ
 sEcJraf0tEEKmTFAHBCOt4LyQmvliUa675mJeOCqOXA4YB31euSafBGbq
 JxLtS+a6rFaMX37wE5efnwheD1sVauIMwQqC5ONCmhJQeYWXq3lIygnou
 /dX4WMAaI/8vTfaV1DNwn5uoHi5nU/TCVQ5obwkrCcEXGitV3qnFXbocT
 dk4MWwXRlPbMOgWxeb6TF4O/UtlchGg35BX08oE4fn6Fj2HNIeM4YZX9j g==;
X-CSE-ConnectionGUID: VnrsAaXRS0ugbzjiZqYnzQ==
X-CSE-MsgGUID: nI4U1ErNTH2r9kb94DpHgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62802101"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62802101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 06:00:42 -0700
X-CSE-ConnectionGUID: w9DaMXtyR/q2E7lTaWJqfw==
X-CSE-MsgGUID: PNtymhi6TVGR3hipk/fIaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182124364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 06:00:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 06:00:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 06:00:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 06:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kl9yI7C7Le9IHd+koWVvt48Qotb3F5Fjb42mbnFFceHrMM9otkGxM19SRaFD9/WiyVtW66s+pYWBH10NXi/LBsPzQFwSMjmBxtzpz2MEOoD+Gq1ajW1FFiD9y14zxdXpYhrm+nZQiCB5m+wpYv6EcQ7xbGfFrC7/ph5hrAYajNAMW/6C6h5zXc4xZ4aK8YSDNFavobT7u+omofhvorSvmRT3rhmN+KRY/+/8uTX2howO1E5Tt0txhv3p8CXgw4KGxLcE7MRt8ZPD1PnSZY1ygE2R5PRMv6wJNpfcmxplcSSEkrGXvDtzsIiKU5+KFt4q+9//WE/Dgd6eeoi8eM5Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjlZw6Yj1l2IqycAbkQCDo8LfultdMsJItucBS7aDFQ=;
 b=kzCkKuIpGOb1c+NMpvhpYMAk6i3RnyCAHCWS69ubW8MkiJrJuUorRAmRcjTOiawTQQCawadSELbKJMy0fKg7wSw7GhsJPbiCHhJtie1DNsPZzfgIeGCZbkVwpPA3gx1flx5KDL02+n4HOBOMk+o6bxB+jCs0B5XZhC9yRP2EFdI9AGALoVKPwSa4pXwWqem8+tZuW20nJJUm4OURXYCu5vD58tItxkJomAO8UO9FSW4SJ8tExFYngxmupoTK6zr4CMhBhZ3IqSVNkOKz5bHHsLeVGlwvPPWcjUdzkX4ZFyS9wDIC5KhlNXZxw7BP7BTrrqNIY50XhA585fEo2SXsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:00:36 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:00:36 +0000
Date: Wed, 15 Oct 2025 15:00:33 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe/pf: Promote VFs provisioning helpers
Message-ID: <20251015130033.fsiaela2k64kicm6@intel.com>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
 <20251015091211.592-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015091211.592-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c6c846-8998-4c20-6804-08de0bead54c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXI1ejRvVUMraHVTV2hybXplZHdJUUtmd25IVFptc01hMHJvQThpTkJsS0FO?=
 =?utf-8?B?R1hNMGZpTWlXWmF6TkVQazY5bVVGVmhGYXIxQkF4NXVWODB0U05iNmVtblBQ?=
 =?utf-8?B?WGR1K2RmalNyQWl3LytIblUvZ3Rwd0RjWnk2ZXZxQXpQcWRWK0xpRDhtUkY1?=
 =?utf-8?B?QWNpeWJTUVo0UHlWZmJHSlRPMjVOVDBOcFFzYk1VZStMcC8vVE1KT21rYXNn?=
 =?utf-8?B?SHdvNFU4aHVkWVVMcFZGUE1TKy9FSDV4SEV2TlVXRzJJeDE4ZGlkbjc5Q1By?=
 =?utf-8?B?bmIvVUt6bzUvTVViZVd5QVAxamsxYVFGZ1AwSnEzQ2REaG9CMHptMWJGWVVy?=
 =?utf-8?B?TTZYT0N2MmlpaTVzWlp1MmZQdU0zZTBLdzQ4djFqQjV6SFpQcVo1ZUplL0R2?=
 =?utf-8?B?QjYrYjQxSjdtNEhmd2tDWUZCZ1FWZUtUZmxVME0xNzZQZnpyNDF6blo4TjVr?=
 =?utf-8?B?TGxWV3lUUTBpWDBkRjc1dkNpNUdBWXlEeXhqKzJSNmxxK2JFTnBLQ2t3a1lu?=
 =?utf-8?B?bjdrRm5VN3ZkL0trNXVyR2ZPTTVia3AwWmthd20rSTNZVFZGYndPcERkYURh?=
 =?utf-8?B?UE1ka1R4VFdvVksrV0ZtVjBuS3l6d1ljbjFCTzFCYjRVc0p2cnJQaU03Skt0?=
 =?utf-8?B?cUpBUnpjeUtUNSt0M2M0UUp0dmNwNVlqdGVUTmFGZysyTko0RGdJVkt3aWNO?=
 =?utf-8?B?aXVQcGtVSTFhRGVnMm5ISURWQ1R2QzBLYkJ4MTVQekprSEUvdCtFVFFPVkxk?=
 =?utf-8?B?RGJ1UHhCbW0vWDdMSWFyK3FONXRKbHhPUEYvQmpzTFp3TWdyV0NKL2FpanlB?=
 =?utf-8?B?WVFyNUhxMWRqMHdRdGRlaXdIVUVwanRKcTQycGREUWNTR08yakRMUGM4bVBa?=
 =?utf-8?B?L1lNakpnT3MrbzNXT1U0Vk9UVi9WWFZWalpTTk1zd1FBeWpSMHphb1lheDlL?=
 =?utf-8?B?bkxORFhEQm1kTGs4SEs5VjJaM251b3BiM1NOMldSN0s1WDgwcFg5d2tPUGNh?=
 =?utf-8?B?cEw2RDlwOG5rbUJOMGt6R2V2MjQ4SlFuZUpvUlE3NmF4VmVIVnZiZjAvb2wy?=
 =?utf-8?B?NWRMZXZUeFJoOG9JOXl5aXhyQXNnalBTOW9kc3Y1ekNuRCszaVloZkNhMzdr?=
 =?utf-8?B?Y2xFVkgzNk1yQXQxNy9vd0h5UzVPOCtqcFUxQml1VGVNQ1BJY3hnc1ZNNk5l?=
 =?utf-8?B?SDRRekZTOHc1anF4cXR6NmxTU1BucEhJVEVvbGVEeDBWQWsrNGlSSHYwQWZS?=
 =?utf-8?B?WTZZQTVVbHZMd0NITU4zTXYwYTVvTExCelJ3SnYyUzVqNkNTUm5KbzlIZENR?=
 =?utf-8?B?S21UZEVpZ0hXTG56bGxvR3RnUXRtdFFuS3NOa1c3bmltTisyUkRqalpFdWR5?=
 =?utf-8?B?aWZreUhVUXRLYm9yK1QzRWVYTXowSEcvVTVUYlJGV2hGNFc1Z2hhVjc4MXlL?=
 =?utf-8?B?c05MVjlpMkZkaE9SRFRtQW5WOGo1N29hT3QwNWp0QlNaOEdLN0JXSnloL3kv?=
 =?utf-8?B?b0pQVUhXTVBWVlNKVVR4djg2NldTdnhWSVFrOUhQd3ZGRDM0Z3NVWkp0bTlV?=
 =?utf-8?B?aVhHaFZ0SzVXSW9tSFp1WEtPMWVHTEVvWlN6OVpxNkY1bjB1RFdXbTI3U1N1?=
 =?utf-8?B?VHI2RTh4QVhjWjBmdWlVZ0NPV0hxV3luUXAwcFlnaXFGT05ONmdIL0FwVjhx?=
 =?utf-8?B?T1dNN1d2bU8yMEFjdkQxek5aMSt3RHhOUHdsRVNPeVRUeUpTSjJkSEc0cE9L?=
 =?utf-8?B?QmVaYWdrUTFpQnRoMWN0UUpGaU9BNlhJK24vRzQxcXpBUk96emI5UnRlUUNn?=
 =?utf-8?B?Nm93ZVFtUFRibXpCZTdYQk9INERFM2twVlU0NnFlaW54NmpVdVRpbXE4MDVn?=
 =?utf-8?B?NG11d2ZkSXRFZEVwTFRnVFI2bEVsdGdiY1NhOGM0VGlEdEI0UjhHSjVYNits?=
 =?utf-8?Q?qhWWVDhRBLEhAl0XNj5pUTQfqJc9Eo3F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk5KNXVFclRxNHpqdWZZVGtNenBOdzZUa3E1YWl3Ty9uL1BFNWhnV1Y5Z2Jl?=
 =?utf-8?B?ZDlPS0Qvdm1iQVhhbXAvdkZWYXVsZEg5NnI1UFlnYlQ5UVdrYUxrNUNWQWYw?=
 =?utf-8?B?OTR2RTZsaFlxM3VhUFREUWkrbStGUlhmRWFwV3BSN3E2dTJxZUs0U3lDQnBK?=
 =?utf-8?B?Rkd0aTR0SWpoSHNhZXZMZElYSGtvUVZXQnc0WEUxZEFQenZEbnJ4bGJpN21r?=
 =?utf-8?B?NVkvanB6Y2dlZFBwNGQxT0lWeUxnMW1SMEdyVFlGR2ViSmc1RVNKeGJXeXV6?=
 =?utf-8?B?SDBWVnM0UDA2SkhhbHAraWs1bEtKN0p0RnU5OFR5RU13amlkeFcwNnBuMVZZ?=
 =?utf-8?B?Z3RlSkd0a09HUmtkaVlTekNYOHZuRVZBVTczczRHRHFCcUU1RSt4V2E1MnNE?=
 =?utf-8?B?NDdEZUZvaCsyWHpYWmM3Z1FNMjAreHU1RS9FZTJHOFJZT010MkZmNm40bm1t?=
 =?utf-8?B?Zmd5VmdjVTNjOFlSMlNLQSt1NXhzeTIzVFNaemZLNFhwT0ZMZWFFRWVyS29K?=
 =?utf-8?B?NGV3YzJROTNieTlrLzYySU9wN0gvV0o5SWxUeG10QUVhVEZjUFpjSDZHaVV1?=
 =?utf-8?B?OEpIcXMwZWJHK0NxL3ZtSSt6dG5FOVJ6UUc1YlB3ckxGTFBWeHcyWGZBVGNW?=
 =?utf-8?B?eG1YeEIrdFJrU09iQTU5N29CTHVNb0M5VzMyLzdyU0hMdXZ3bjFmcjZsWkxx?=
 =?utf-8?B?QmsvVVdjYTdUV1A5TEc4VE5lK0dwMUtTM3dTdERxVmtvempJNGZub1AyYytv?=
 =?utf-8?B?UmxINDdWdDdVc09rcTd4TGExVmRoRzd0dGMyMEplTG9aWGxhWHpUeVQrMjJY?=
 =?utf-8?B?MWx1YTBsYS8yMDMxRmc1RW5OZWN2QWh0djBBWUEwdlBJNVdqT2JVODh2NEdX?=
 =?utf-8?B?Vnl2aHlNZXBTSXF2RkRVSVFlazBaZTNqMnY5WXB5UE5SVWh0Nnc4NDBJS1JR?=
 =?utf-8?B?MGhiY292YkhnQXhZQVhtbXZtWGI3bzdIRm5BTkhkMlNhYzA0aDQ1akkvT2RY?=
 =?utf-8?B?K0xaY0Rpd1M1b1JpTXk5aW1wTW1LOHMvb09CNnBqQm1CSm1ZK3N1ak9PeHNC?=
 =?utf-8?B?QXYwNXV3VEFFVzRacmszejM5bXdpK2ZHQ2p2ZHBUMDE2cmlEbnd3MEtBL1lI?=
 =?utf-8?B?Wnk2cDlBSlpVd09MeEhEWENaQTNrYXp0Z3g2d0FFbnBXMUhqYW05UE1SMGFL?=
 =?utf-8?B?RlhMME9sUnJEVnFyTnkvK1N6blVUbUtYVkFhZ2RBYnpXWEpSRXBKRjlYRW5y?=
 =?utf-8?B?SVA1dy9pVjY0NjdQNUNKMnVYYzYwOVhsamkrUTRuZCt1eXVNQytDREVGNVlR?=
 =?utf-8?B?TURQRTViNlc2TUV5NmxiZzlGMGgybm1WZ3htOUFuOWswNGIySG43cjZXT09O?=
 =?utf-8?B?Z3FSaEtyZ3BnbXRLZkloQ3d4VUhOR1p6RlJuQ1B6cU01N01BRDVYKzVwM3BO?=
 =?utf-8?B?akNFRXROc0ZQWEQrU1J5WklUQTN2M2QxUENFS2tySE9NejhZSmRIK1lES3B5?=
 =?utf-8?B?cTJuNjhlZ3Z1bFkxSW9PL2lTdFQvMS9vbzY1VTl6NkFuNjFoa2hLMXhjNEdx?=
 =?utf-8?B?aHZVeGNVNUtpaWRZQ1NDeDBMQUFVSEFXaUZZQjM2Yy93Q0tNQXdWOGtDUXBr?=
 =?utf-8?B?ejgyWjUvWXhWc25ud3ZZZ1dodEN5N1UwS2VXd0VUWmxoN05yLzIzSDlmd2tK?=
 =?utf-8?B?L3owRmFDSGtTYkRiSVU3c3JTd3hjdk02VkJMcTNXSUdraXljUk1JNFp2VG9p?=
 =?utf-8?B?dHp6R1l6RlROay9ZbmcrN1Y3NktPM2RlWHhlZjBDMjNtV0I3UWhVWjduYUsx?=
 =?utf-8?B?ZTd4bkYrNVNBdDlYUXBSM0RUQmwzdjBuY2JkeXpLWHhjRHpWSDJFeE1zOEVT?=
 =?utf-8?B?a0xxQWh0Y0wybVNxWW5EendJSld2VnVrblJKczRPUzVKZXd1S0svYnpGRmRM?=
 =?utf-8?B?Yk85WnJuQ3BtcXZhMk1MV2xVSTI1M0ZQVmlWKzhsNGNFNUI5c3ZoWGw1czMx?=
 =?utf-8?B?NHRvYWt0eUVKL2RwTSt6QlA4eW1XbXFDVFBpWVBGNnJ6UW9zblFoNE9nNVly?=
 =?utf-8?B?RFNYOTlJOUVvOGZ0TnlTeE84ZFBna0Rvbkw1WFFaV2M0bnBBS2IvTHBIM1ZZ?=
 =?utf-8?B?Y3o1VXlkNjhRN3A3bURHMnNXTWdocHQ5VTlCOGNGQ2g1enNmcTQ1QmpJVlRY?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c6c846-8998-4c20-6804-08de0bead54c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:00:36.4464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E6ZGCb12hSFNJ/0IjtMI6bZesiOZsIA0FZ31/b2D/bXGTQHmNJC6M2T1trsdLqRYbDxxviamAhV0ZXRXDvnt30rrzxkJqnc+gA/SX5Z4+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-paź-15 11:12:06 +0200]:
> As we plan to add more VFs provisioning methods, start moving
> related code into single place.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                |  1 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c          | 45 ++----------
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 83 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h | 14 ++++
>  4 files changed, 102 insertions(+), 41 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 84321fad3265..edae0c2a6e2f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -176,6 +176,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_control.o \
>  	xe_sriov_pf_debugfs.o \
> +	xe_sriov_pf_provision.o \
>  	xe_sriov_pf_service.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 9c1c9e669b04..735f51effc7a 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -19,46 +19,9 @@
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_printk.h"
>  
> -static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
> -{
> -	unsigned int n;
> -
> -	for (n = 1; n <= num_vfs; n++)
> -		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
> -			return false;
> -
> -	return true;
> -}
> -
> -static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -	int result = 0, err;
> -
> -	for_each_gt(gt, xe, id) {
> -		if (!pf_needs_provisioning(gt, num_vfs))
> -			continue;
> -		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
> -		result = result ?: err;
> -	}
> -
> -	return result;
> -}
> -
> -static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -	unsigned int n;
> -
> -	for_each_gt(gt, xe, id)
> -		for (n = 1; n <= num_vfs; n++)
> -			xe_gt_sriov_pf_config_release(gt, n, true);
> -}
> -
>  static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>  {
>  	unsigned int n;
> @@ -168,7 +131,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	 */
>  	xe_pm_runtime_get_noresume(xe);
>  
> -	err = pf_provision_vfs(xe, num_vfs);
> +	err = xe_sriov_pf_provision_vfs(xe, num_vfs);
>  	if (err < 0)
>  		goto failed;
>  
> @@ -192,7 +155,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	return num_vfs;
>  
>  failed:
> -	pf_unprovision_vfs(xe, num_vfs);
> +	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
>  out:
>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> @@ -218,7 +181,7 @@ static int pf_disable_vfs(struct xe_device *xe)
>  
>  	pf_reset_vfs(xe, num_vfs);
>  
> -	pf_unprovision_vfs(xe, num_vfs);
> +	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>  
>  	/* not needed anymore - see pf_enable_vfs() */
>  	xe_pm_runtime_put(xe);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> new file mode 100644
> index 000000000000..c24803312231
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_config.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_provision.h"
> +
> +static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)

NIT: Why don't you use bool here?


> +{
> +	unsigned int n;
> +
> +	for (n = 1; n <= num_vfs; n++)
> +		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
> +			return false;
> +
> +	return true;
> +}
> +
> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		if (!pf_needs_provisioning(gt, num_vfs))
> +			continue;
> +		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	unsigned int n;
> +
> +	for_each_gt(gt, xe, id)
> +		for (n = 1; n <= num_vfs; n++)
> +			xe_gt_sriov_pf_config_release(gt, n, true);
> +}
> +
> +/**
> + * xe_sriov_pf_provision_vfs() - Provision VFs in auto-mode.
> + * @xe: the PF &xe_device
> + * @num_vfs: the number of VFs to auto-provision
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	return pf_provision_vfs(xe, num_vfs);
> +}
> +
> +/**
> + * xe_sriov_pf_unprovision_vfs() - Unprovision VFs in auto-mode.
> + * @xe: the PF &xe_device
> + * @num_vfs: the number of VFs to unprovision
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	pf_unprovision_vfs(xe, num_vfs);
> +	return 0;
> +}

NIT: Perhaps it would be worth adding the assertion num_vfs > 0 here.

> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> new file mode 100644
> index 000000000000..f6a902190ad7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_PROVISION_H_
> +#define _XE_SRIOV_PF_PROVISION_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
> +int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
> +
> +#endif

Minor comments, but the code looks okay:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
