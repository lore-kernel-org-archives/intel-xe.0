Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF600C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 05:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F6C89C69;
	Mon, 10 Feb 2025 05:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mun3f4Vu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBD589C69
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 05:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739165488; x=1770701488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b5wbkmzmJV4BJocXzJJ4xtQJtGXvKgIP0/HQQuu0XLE=;
 b=mun3f4VupJT3q9uuoqTW+EHcu5//hT+SFzscVKhOj7KuvrciT677fxEp
 /HUPqWbtiBF0tney79zd8cbfqz4/tFFvy2PE5QTX1aLc9Y3+4cyBie43M
 kAvhez96qqqxNOI3aRPNgNDSh3stFaNZftryRWG5z/NQ3E8kcQ3sV3X3q
 XXiVfzdHLRMA7UYYPCDrQAnP8py6RwWyABF2AWhLfMPXTsg6dJ5WH0TEV
 QzMKxHLlXCYtyQ6cS00KoYGJiUG5P/UrbBRXbzKWUenuPER8MXUp/oiTw
 M4kzU8fCxbDWjxYYQjEclOtDuo4mCl2dag1NMN+wdbDtljhcWycNILEV8 Q==;
X-CSE-ConnectionGUID: GMDSYLGVSki4kqDPFb0VFw==
X-CSE-MsgGUID: bjvOME3HSg+8EY1lkJ266g==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39619134"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="39619134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:31:28 -0800
X-CSE-ConnectionGUID: 0NM+OfRJSLS+J5xTyuV1sw==
X-CSE-MsgGUID: gK+z7fEiSECh+CCL7tJrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112521539"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 21:31:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 21:31:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 21:31:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 21:31:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCVp1feC0MynaPlVqb6KnxnjzxxRP4GKV6snJu0KlwsgVPrPZZtKNVs6GP6fptQKqoNiwKLk1FHAeBCP6S/sO6lf42pwufvJvamTLTuvQnpO4K4UZoQAfVhcb5KFyCir2U7AG1F+dF8pw0tmYVg+BCb4W84ttGfdwRuWE7P7nmUr2obb32hv4StnIo0+7WLtXdtAlwBqEK7xi3DZ8FovdVK6tjpnSZmsRVhtqExEvbrc2RbXYthWyo6XTCPyGTiitfyG6jhh4KetPLakbv3wBEz9K7of+jRzJI1gmYFlL8S5SmLbUMNFOkCYWeMc9Uui5EETOPt7Qv0PAZmeMOIg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uErRtv6xaChNRVPIqRI4k3/VK6R2uuz8awLhGbXDlmM=;
 b=xMBg31LEUhNxOYRoH0EJ8K+32pcMMyHW8asCDCoP3WuG7qPypb+iA344kkIAhnEDtjSU83Zx6KciEohS5SlImRQ3WEUqHPtdCNrESRD9K3WDZSGsZF+KDUyLjXgIVhGMyXHPZgmIpNPGlX3ntUyJGFk6WeZ+gK2jleF5TANYkB7nmGJiErX3A/SsrP300h7t6apUYoWL7hEs7IpDzhKJ38aEijb/XJuTXlfB4B40HbuGm5N73gCJggPza/YticcR/RsPwUjJbLdAiC02u/UZtxdyYqFBhvNE09puKN2YjcFdAE2XAkUR/zCk1KWrJhMb9h0C+DYQ/wJnL+IayOEXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Mon, 10 Feb
 2025 05:31:25 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 05:31:24 +0000
Message-ID: <44030d2e-2921-407a-a32a-1c52e2b13062@intel.com>
Date: Mon, 10 Feb 2025 11:01:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] drm/xe/hwmon: Stop ignoring errors on probe
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-14-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250207221945.2878241-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 333aabb5-554c-4f4b-3311-08dd4994285e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NExzUGJXSEl1ZkNER215TjR3RG12Sm01RnJyNmx3akg2MXlQa21rY0RZcklS?=
 =?utf-8?B?cU5IOFo0U08rQzI3c0EvRHBLRFBqT3krdWk3eWR3QnhXNjMxajZ0a2tkYzBY?=
 =?utf-8?B?YVYvL2FxT3FBN0NkYitveHpPZTRTdlI5VzJqRVI1aGlOL0ozeko5a2I3cUgy?=
 =?utf-8?B?c05FNGhKbVJ3YzA1QlRVUExkd3RwUDVoSVRVSXZlMUdaaXdMaDVKTnByenNW?=
 =?utf-8?B?clJWbVZRNmJBN0hsOXNXbTlVUFpQVmM2YlFqQzdGbHFINjEwWWpxYmFZMUQ0?=
 =?utf-8?B?YVlDMCsrTVZ6aUtWSFVDUlk4MkdqcGY4UTdIclYrR2JaUnpEUFJickdrbTdj?=
 =?utf-8?B?MWVsZ3FDakF3YzJKWGFGb0tOTlNvaHZUK1owVWJpYU9ub3pJR04rMWlNOXZM?=
 =?utf-8?B?NjFQaS9Ca3RoQVNUWTI3Ry8vQk5QY3dZU2JIOGlvcmRRdm1QL0wvSjVZOTMr?=
 =?utf-8?B?cnV6cW4rVUxldUVFZ3BzQ3NYcHh5bDNPNEwzMGVJS1ZaTnRNNTN3eGJWcEZI?=
 =?utf-8?B?RExrQ3dwTis5MkFwWVgrV2hLRlZCdGM3RGF2Tk05LzM3M2FOdzlpR2I4YnM0?=
 =?utf-8?B?N3NVbFZQTE9QdnVaZEZHZ2k3YmQrS0hHZXByc1NueHZiSjFyd0xCaGU1YkVi?=
 =?utf-8?B?N2IwcXNHeHpyK1JWWkZESUdMM1FZZ29aV29JZTRKOFdmUStNNnYvNUYwN0pu?=
 =?utf-8?B?N1VybUhJVkRBNWl3UC9xOWxvOTdjRERIM1Y1Zi9oY3plM0hreGZ3QytVS3Fn?=
 =?utf-8?B?bjRJbExsZnZHM1dsODhSYjRzYW5VUHloMXd3RnI3TWtqa1c2azI0ZzZaZGYx?=
 =?utf-8?B?L2s1cnIyNXYxNlM0MDlPcld0MkMyWjZndnFld2NqZkczQ0U1MlRsZFVPemow?=
 =?utf-8?B?Y3k3K1hKNXE4SWJ2NXlHNFRCWGlHYUw1bXNiNU02TFYrTnhoZ0RwYUlTaUly?=
 =?utf-8?B?a2xjVDJ6YjVqaUd0ajI4ZWpUcG1TYnZRWU5vUm5xZHFIS2FTRWk4ZFRiZm5F?=
 =?utf-8?B?bjZDcWRzUXltUVREOWs0RXEybFE0R3hmWHVwMlZFbEZtd2ZUVEhGVVdLRlIz?=
 =?utf-8?B?d3YrUWF3cmFqbkNmNTRXT2dTank5Y2tiSGtPNGtkRkpsMzhtMUlDLzR0Y2s5?=
 =?utf-8?B?UlJUSzlTVnpWUXZMNytJTXM2c29HR0xMQUp1dCsyRmdRSFNOR2ZSNTh5K2Nz?=
 =?utf-8?B?c0NibGk2SmFjYnZTVTk2VnJpVDMxazE5cjJFTVI1SThDTE50TXBFbXI3cTcr?=
 =?utf-8?B?bytONm5RdmlZYlpsSHBJQkNYN05NWkdtd0N6UG5rRjFFRlpoTVNuSHNaVkFX?=
 =?utf-8?B?WGlHTDhmSCtMUHVaMU9xcWhIT1pWb1dwMjkwVnlDMHFpZllGdVdqRjFRTmxF?=
 =?utf-8?B?S0xkek5NcXc1ODB2bk1tWHFycWk5UDFDL0NCaGUvWXRhWmVSS2JzSFA3WTBw?=
 =?utf-8?B?RDlzVFlucDNsU20yalFDSVdjZG1FQWkrK29lNHFhbUNoM05VMHZjcVVIK0FG?=
 =?utf-8?B?a3J3dURUaENZcnZuZW0wUTZnd2dlYmlvMEMyOFFKSHVkWFp0WDhrV0VPam1o?=
 =?utf-8?B?VU5Kb1J4ZXFJMm5HNnpLTHEvZVFSNEpEUWFweHVncmtPdGJEMm9KdHlBY2tk?=
 =?utf-8?B?N1NFTUJZT3N3RGNsZDZhSHZtZ3JmU2w1M1R1SHZZR2JRL3hJckZWaVBBeGw2?=
 =?utf-8?B?QitLNVgwcWRpeU1FNmU1THFiRUpuWStKd3dVeTFIT3ZxYmNpeUIvbWs1Z3Vr?=
 =?utf-8?B?V3Y5N2NBVkRySnJGNkpKNUhNQ21MME9uaHdwOWpZQWxTVld2cFZRckljc0ov?=
 =?utf-8?B?WHprV3pNZ042Q3dBeDB2SS9NM2h5bFBDSWlwaFJ2ek1vMWUwd3pkY0NoMWNy?=
 =?utf-8?Q?R1pWSZKP90fMi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkZ6emZzN2J2dWM5a3JLSGk5RXFQdjBjN2s4K0tqTkxiUmszcENWL0phK3N2?=
 =?utf-8?B?ZjBXL2FqdXVRMkpzajdQT05GakxxeU5zVm5TVDUrR29wVWZyVThwaks5Z1ZV?=
 =?utf-8?B?VFIwY0hWTERnVkZYMVd1T2hsbGw0bzZ1QnBDakwvWHNmZEJuN255eTRzejRw?=
 =?utf-8?B?am9HaEJySnlzQkliTGg5WEJEajVna21wZHhkODEvNGJOTW5GMHBFL3JSN2ls?=
 =?utf-8?B?MnRVVVh1MFpQTTArWWRobURseE93T0N5Z25HWVhoT1IyM09JWS9hVlk5RGdp?=
 =?utf-8?B?VXVMZ2dwa0k0Rk5heTd3cTdvR3VhTllnRnpCMzJvOWFNcXUxbDJTVER4NWtC?=
 =?utf-8?B?WHZ5ZWJza2ZiS2N3VGk1ZjEvNVRuY3kyK1RpT1A3SllMSERuZkp5cXBTNHNr?=
 =?utf-8?B?OVJFdTdjYlVvU092Um94YTBxNDJoeW1aYmlZZUFGdkY3bVpVKzU0WElhc2w2?=
 =?utf-8?B?bnQ1aXRMUHgxVGxFNUhzY2szWlJBQlE4ODFmQmdrdHJ3bklxZ25zRlNhUXdC?=
 =?utf-8?B?RFVydXJteWY1U0REMG43aGZGTVNOcFllNDFxQVJvQVlPc2dFaEV5RU9xTG9Z?=
 =?utf-8?B?NjBmZDI4T2hrc2F6UlNMKzdTSHBCSnA0aHFrRnRBRDR6a2pTL0N6MFpDc1BE?=
 =?utf-8?B?K0pWRXBzZ3J0aktRb0VaVEJkS1JFcU1WQkllQUZIVXZacGx4NDBjM2FsZ21h?=
 =?utf-8?B?S3BHVmpsU2cvSy9JK3pOa25GbEh0a0s2SFFrcS9kWEhpWWIra2JpWjkwSzhV?=
 =?utf-8?B?MXI0cE5OL25sZk1mVy8zRElTdStYUU1aOTQ2WVRodmx4SHowbFBTdXlYYnQ0?=
 =?utf-8?B?VHROK2xXQ0k2d3Bwdno5TFVaODBuMHBhRnlRdmJSeUJVKzlnaVZNWCs1SVR3?=
 =?utf-8?B?blFwOHpDL0RnTHNOQ2JtOVBBQW14RUJYcGxMY0NwbUR1MktJWEd1TmRucndS?=
 =?utf-8?B?NVIrZXJTVEtGUk1icXN0U0EzaUdvV0R5eWl3V0VBUXQ2blB3aHN0L1ZBOUc3?=
 =?utf-8?B?V2FUVlFBUG5DM0Y5M3c4ZTNRYXpRcEhxYjlwN1FFclh2K0pIb1ZEUWVUYkhJ?=
 =?utf-8?B?SGNHZDRBK0ZFWlhIS0toVnJRa0picVRSc0FSUEQyM3BlVytMeE1KU241WHRC?=
 =?utf-8?B?NW04c2d1MjhrelUvWE1IVThjajNUOWYzSjBlZTAwK2lnNzBrUUVKczcvL3NK?=
 =?utf-8?B?MU1GM2RWbnN3WW1XOHZGczhUV0FXQmp4Ly9UcGFEYWZ3NlI2cUYvazBJWmk0?=
 =?utf-8?B?bHA3T2ZWRXlJdkd5T3habSs2WjZacU9palBldUlzb0MvKytZcnNGQlN1c3oz?=
 =?utf-8?B?dE9zYlRLdTRvd05QcTFsM1Yvcy9sYTA2dWhhRnJvOE9najQ1ZkdTNUFscXJT?=
 =?utf-8?B?TmE5NVdLWGkwOXBTMG45bUhpTHRjZ1hTRFNaTFZTU2t0bFRiRFdhWExHcHlk?=
 =?utf-8?B?RFFkWG5BclBkZ3JBSW85WHFjNDQ2aWUxUHhlTmh2WkJzV1VrV05PVHh3RU5S?=
 =?utf-8?B?UTByK2VKODZtWUh3NVhaaDlKT1hoeGs2Yyt4ZGVFNjJJWTZzZzI4RENwM1lk?=
 =?utf-8?B?WnhWNnkySWRORjBiZHE4bnVVcXlmN3pBWjZJNkJnWkgzR3BTVXZxTlI3aUZR?=
 =?utf-8?B?M0drbWZvb1JNT3dMMHdSTEM1dVR4VFR2bndia254d2wxMklwaGhTQXF1SjlS?=
 =?utf-8?B?UnZ4am9Ma0oyVkg1RTBDSUtUbGdXWEVtNVNMYjRLYk1jN0svakdPZ2NYTEpt?=
 =?utf-8?B?VXE5eHk3Z29TaTVnOTF4ZWExOWZ4ZGc0NUhORURKbitZd2pvdlNLMGNPOWNi?=
 =?utf-8?B?aWlJRWt0c1JCd3p3d1hSL1NTN1N1cENvaDRrOU12ejZBSkh6cm4zNW9FYjJ4?=
 =?utf-8?B?T01BMVppVWdPS24yS0FsU1NxdjN6TFV1aFNPT0d0VURGaUxZTFZkc0ZPSXI5?=
 =?utf-8?B?NitBRWtSV3BrVG0wQWFFbFQwRCtVTkNBSEUvRHJyQzdoUzZDMTZsLzkxTXZl?=
 =?utf-8?B?MkNwbTdqNnMyenE1czhKbDRhRitwTHY1RDFEalV1RHVPZnZ3S29tR1ZwNzMw?=
 =?utf-8?B?ZXhxOVFGa1VNdEhDeVVxY0ZrdTJ0Zm5nS21CeWR3dGY2TXoxZEJxcjhQV1VG?=
 =?utf-8?Q?54Ga4ZMSi8iC+oEukRAnpAqNp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333aabb5-554c-4f4b-3311-08dd4994285e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 05:31:23.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4gK4Bg01KVQs7Gx50LypIW46NnMKjVHWKys/zCZvE1xYD32G1vQKA0PVBMbHOHsNP1hCyfCGfZsWQrjTrwQxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
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

Hi Lucas,

On 08-02-2025 03:49, Lucas De Marchi wrote:
> Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
> different from failing the initialization. Handle the errors
> appropriately.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c |  4 +++-
>   drivers/gpu/drm/xe/xe_hwmon.c  | 31 ++++++++++++++++---------------
>   drivers/gpu/drm/xe/xe_hwmon.h  |  4 ++--
>   3 files changed, 21 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 002e066f5f288..2e6f42d1b1d01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -889,7 +889,9 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_debugfs_register(xe);
>   
> -	xe_hwmon_register(xe);
> +	err = xe_hwmon_register(xe);
> +	if (err)
> +		goto err_unregister_display;
>   
>   	for_each_gt(gt, xe, id)
>   		xe_gt_sanitize_freq(gt);
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 7f327e3342123..48d80ffdf7bb9 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -839,10 +839,9 @@ static const struct hwmon_chip_info hwmon_chip_info = {
>   };
>   
>   static void
> -xe_hwmon_get_preregistration_info(struct xe_device *xe)
> +xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   {
> -	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> -	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	long energy;
>   	u64 val_sku_unit = 0;
>   	int channel;
> @@ -876,33 +875,34 @@ static void xe_hwmon_mutex_destroy(void *arg)
>   	mutex_destroy(&hwmon->hwmon_lock);
>   }
>   
> -void xe_hwmon_register(struct xe_device *xe)
> +int xe_hwmon_register(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
>   	struct xe_hwmon *hwmon;
> +	int ret;
>   
>   	/* hwmon is available only for dGfx */
>   	if (!IS_DGFX(xe))
> -		return;
> +		return 0;
>   
>   	/* hwmon is not available on VFs */
>   	if (IS_SRIOV_VF(xe))
> -		return;
> +		return 0;
>   
>   	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>   	if (!hwmon)
> -		return;
> -
> -	xe->hwmon = hwmon;
> +		return -ENOMEM;
>   
>   	mutex_init(&hwmon->hwmon_lock);
> -	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
> -		return;
> +	ret = devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon);
> +	if (ret)
> +		return ret;
>   
>   	/* There's only one instance of hwmon per device */
>   	hwmon->xe = xe;
> +	xe->hwmon = hwmon;
>   
> -	xe_hwmon_get_preregistration_info(xe);
> +	xe_hwmon_get_preregistration_info(hwmon);
>   
>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>   
> @@ -910,11 +910,12 @@ void xe_hwmon_register(struct xe_device *xe)
>   	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, "xe", hwmon,
>   								&hwmon_chip_info,
>   								hwmon_groups);
> -
>   	if (IS_ERR(hwmon->hwmon_dev)) {
> -		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>   		xe->hwmon = NULL;
> -		return;
> +		return PTR_ERR(hwmon->hwmon_dev);

Hwmon is not part of drm subsystem so we didn't tie hwmon registration 
failure with xe probe.

Regards,
Badal

>   	}
> +
> +	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index c42a1de2cd7a2..d02c1bfe8c0a0 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -11,9 +11,9 @@
>   struct xe_device;
>   
>   #if IS_REACHABLE(CONFIG_HWMON)
> -void xe_hwmon_register(struct xe_device *xe);
> +int xe_hwmon_register(struct xe_device *xe);
>   #else
> -static inline void xe_hwmon_register(struct xe_device *xe) { };
> +static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
>   #endif
>   
>   #endif /* _XE_HWMON_H_ */
