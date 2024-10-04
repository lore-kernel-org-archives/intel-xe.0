Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE8CFA740
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 03:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADF610E278;
	Fri,  4 Oct 2024 03:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVt7pFYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD0710E278
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 03:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728012130; x=1759548130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qWEzzSaxacALuLTQ274phijpEGgmJ6anzdaUh3Q+d9U=;
 b=aVt7pFYTVxRtVC8uMrrjrHZbj4Pk0mMzulyFDK8cObE6LXXT/4l0S3hK
 IpSyYp9kPMZ0viIJuWppiIgjvRB+wW2ZAM40ghF8T6ITYHNoeNlpE7V4f
 9lIzvnB2qgIG8/8DO5mRISq2kBbN3m+QayS15fAZwjOv1i8GydCt7MEOa
 dR2+msLEdJXNJzfsqcaMu035exTmkPBMfaRXsIxmJfYMTWBUZmYtVz5k2
 730EPnhjrnmu6oV/7A78x31w2feI8mlwEsShvwxfTUSQJ9ydSFxjwNCTf
 RSIJvEdcnj64lspvb9+EUgFYZHCasogPBzT5DegSEKTLf4vmYMnCksk5j Q==;
X-CSE-ConnectionGUID: 5yPmgE12RMmaaaoPHG5nIA==
X-CSE-MsgGUID: 3l8BiPz+Skuay7xdWCEkWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30105331"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="30105331"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 20:22:08 -0700
X-CSE-ConnectionGUID: 9BLGCHOKRKazBHaEWaixew==
X-CSE-MsgGUID: 07k1jNLuTCKpwjh9ilp7iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="74574267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 20:22:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 20:22:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 20:22:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 20:22:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML40qJcLHqP/CpZSP7MTe/qql8fM21lyLmglVSany/zKlvOWSDGIm5MAOD50TEIEnQJcVPqOSm29zTJ/grCOo9MJ2NJ0adxDiUE/ap1cqylEdxvIVS0x+rG+p1E9BmYbCQdAyvPrPLWKwZDYM/YIWUgpHqhEDTiT3oKucMGerW+mQXWpewPsw5Fhb8EqO1meQ4BH9C9x8I7oBJTARJxkKDeQuNEyBweKju5WLiZgp4KrPceKBQ1G+lewdZli2cTRfG5Ayjf2JXTu0e0Foo+qYpYYomyPoiJALp52zFOlvn9NP1wIvn4kqbA8IQw5ycw4t/tInv0mK4WwZ8Mn+/eBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRSVJuR3+SEOHUtFoN5HFBEZNQH+PCCdjuvuAO5pPas=;
 b=N4xdoWhBn0VZEoNP2byTPdvvGpqbOjXgJBr4Cjug0ETH4Hg8bOYW/M86Tz9J5PkLsdxT2IbtIhADETpNvXTcgQ0sqqK1CC4dJM/bNrUdZvi0ktejBRs8KQbevxy7ZED6lrTAaQZSP3E3eogXTkdtmkVK6xwIgvb+KzdnMvw7zAyKD4OtmOAyPBd72HSuL5Nr4UCVPSx8k+07pABJ0Eq4g1fpauAhky302HlL/quduL/zniTkvOadP4d1jdgbuV5EaeKhMOk0z1lvboN3d2qVyQGgBvTaWMdb1TnHdYQlq5OIiXNAl2OUK725lUyL9BVSE39dJPuvQQXQCsqKBj3Blg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 03:22:02 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 03:22:01 +0000
Message-ID: <a80c24b8-018c-48ea-8df3-9827d3f65b45@intel.com>
Date: Fri, 4 Oct 2024 08:51:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/25] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-5-himal.prasad.ghimiray@intel.com>
 <2cd313aa-264a-4e33-88e4-7b1093c1df36@intel.com>
 <b598cd52-fbbe-46cd-ae81-47519f5db77d@intel.com>
 <6dbbfd13-e579-46ff-8975-6d88516aa1c1@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <6dbbfd13-e579-46ff-8975-6d88516aa1c1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: c5676b97-50d8-4976-18d9-08dce423b63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVJCQ3k1VkhxNFNLZDVUb09LbWgzMlRDdlV6UUFvSXo0d2RxWFpwMGdhVlIw?=
 =?utf-8?B?VWdFUlZGMEhhZUpQa3o1b3RlTVV3biswa3Q2eXNFQ3RiaXQwbDRrOFh6QVBm?=
 =?utf-8?B?TStka081OGRreUptSzlsekVqWDlXUHIxTk5JWWgvSXNnZ2pYQ1R6dTlYY0gr?=
 =?utf-8?B?Q2llRHVDbzFaS1ZNaUdyZFFTQWJvZEhtOHI0N2w1cXcwdHZQZjZFbVBWb1RG?=
 =?utf-8?B?MkM0VTBaVlYvaXpScDMwZEJPQ09RbXpJU1ptb3FURkFBVkhoUkJvSTJkdFg4?=
 =?utf-8?B?NlB6OUlNc3JNdlZmZzNaTk9VbDM2ZHk4MEp2N0g4elZzNDZEQmtXeGc0SHYw?=
 =?utf-8?B?bDVvcGswbUg2MjRaNDcxTVMyWTFFbWNybCtwNkVVb0s0MnA4Q3d3MVZYYmZz?=
 =?utf-8?B?QkJtU2F5bENjOXhCTEZYWEhrQmJlRnFibW4wSmE1UHIwZjh5YndBS0h4bjRC?=
 =?utf-8?B?djVYNFUrYVQ2dlpnQlJjTFVKV3JYaGJVcEk1MncxYVhvSnp0SU41Q2YzMHMr?=
 =?utf-8?B?aW9EcTkwN1dEQnNTSFZLNVkvTGhPVkJxWHJHRHZrM29KdllJNHNLVnNGR3Z0?=
 =?utf-8?B?YnhLZ0lTNmc3RkZaWDViR2JpVGFaM0ZhdEFoZi92dm51bnhvdDRMZ25LOURQ?=
 =?utf-8?B?TnNEZnpCQmdUaVdXYUFKanZYYmVDWXJYN0JyTklKTHZVdEtFS2NxWXNhcnAv?=
 =?utf-8?B?WGl2QzBPOEFSS042dTBNNWdkRmE5NFY5eER1eHpDNG9GMXQzMHR6dHk0QTg1?=
 =?utf-8?B?c3YrRkc1THAvTTlud0d4N1FYVlVsUFFiVm1YV1hBdm1yVzgvd3RTUGxub3o4?=
 =?utf-8?B?VERld1dvejgyejlNaURnOVhtVW9JbVFhd1c4UXd5cDYvY0dBbS9vb1VxQm9P?=
 =?utf-8?B?blp0SzBQTXFqejJocm90Z0loZEdTYnUwaU5jWldpODduYkl4L0t2Tm5VUWZt?=
 =?utf-8?B?bnFTbHRKMCt1OVRDcjFaYXovMlNvYk1HNklqVUNHeXV3Wmp6Yi9ZcjBVN2dw?=
 =?utf-8?B?Y0xtdmUxQjV4THdPMHgwalBiUFQ5VERSU25NVG1RT3I4WUhNM0JaYzFlNStJ?=
 =?utf-8?B?OVNERTNHUnVDTTNFbHdyME1RQWVpMUJsZ05YdEdwczlaSm40eEdvaVZ1Wmdy?=
 =?utf-8?B?UTJzMk1PMmQ1dkJVb2J1eWk2aWRaWkU0UkpRLzdzSE9pOXNSMTRENHUrQVRY?=
 =?utf-8?B?QUFmb3dGQnBrWUk4MEx3S20yQjFnYlEwVUwybU5HK3grV0RQa3RKWUZrU0Jo?=
 =?utf-8?B?elI4Q01TVTB3QlAycUFiRG1qYnJqV0toSHJKelBwWHZ6cWphVU9LdElLT3ZG?=
 =?utf-8?B?Z045Wk12VlM1NjBERndIWGdnb0I2dDVLTkJuM3hLWUl4WHBNQWlrTCsvRWFs?=
 =?utf-8?B?L2dHbmY0eXNDNVpCR0YwdXhpQlp4UDhjTVVva0NQR1dDOW83S1hPU3F1SzRa?=
 =?utf-8?B?ZUtjbktXWWE3MUFBcENRalRscXpzYmFzZFVaYUdiMlpVUTZzaW90Z2lkNXRB?=
 =?utf-8?B?L0lCeW40WGhBV0JlTWozei9ES2ZXczZjeWNadm1vcld4NXN5RHFpYWZvSUxV?=
 =?utf-8?B?N0tKWGpnbXBYb0ZhZmdaclc0K1N6ZDhCY1B0MEMrbUFvNm0zT200clQ1UjJa?=
 =?utf-8?B?VURoQVpTVC9TREZONU5iUWdiWEpEU3Q2Q203bjhudzR4R05qcGdKbHNIcytP?=
 =?utf-8?B?b2dpLzh3cjNMTDBuMHpsWkhWeitBM3RFWTJwU0MzNHFtQVp4Q2lRVEh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmpiaHpXeGU3UEFZNVlTcFl0czdpUTN0MHNpY2RLODhMN3cwcUlkNk1Ubzcv?=
 =?utf-8?B?d1FxcHRzS2xRVnprdThTeXhUM3lMeXMyU0FBMlZGU05YT01TczA5aWlnNkhE?=
 =?utf-8?B?bXY3bDFJYXdTSWxVeStYSFE5T09UN20wMXhjL0M2YThaTWZrNCtMRWVCRG9a?=
 =?utf-8?B?aTdTQlJzR1RWd09KOFhMdUtiTW5LdjVEM3QxUkhuVEs3SCs2UDA1dlNKelBX?=
 =?utf-8?B?TzFjVzlZcXZZMFk3RkxaVmFhVTBIV0RvaVVnNWRVbDJKOGhYY1Z5QXVpcGlG?=
 =?utf-8?B?R2I3SG4zcklNSVJtZm01b0F6bDZDT1NvWVdURnRMZlJVbDYrc241TWxDK2Zz?=
 =?utf-8?B?akdrckRENFBvU2N2VkRzVk52R0R0Y1hKTUZiU3cvSTlmbGtsSDBmcFhSQzJW?=
 =?utf-8?B?and0VktubVAvaGg0OWk3U0RNY1FDYWFkREc5NU1aak1QazRDQVgreFpaVytZ?=
 =?utf-8?B?aG1RdURDN2NRY1lVSmRZTHUvK0hKdHlVZWlOdHZvQ09MTkM1U1hhZ2FRWmg0?=
 =?utf-8?B?aU5LcjFiVXZaQm96bXdsc0RLRVpQR0QwZmFKRzBlNlU5K1AwZmYzRjJnL2tM?=
 =?utf-8?B?WWtsdHJXWXFza2tmQktPYmZ2SVUxR3VIZUl1T1FrRHNubDZWTU9zTDRFRzJp?=
 =?utf-8?B?VWJLcnAzdkoySzBIbStSMG9nclpLNlM0UldDSGpmQXBxMWN2U2hZd0JidU1U?=
 =?utf-8?B?ZmlWbU5GMUJCd2dLcWJFdVdycjJEYXVrVUtQYnVrYnFzbURlN0NYWDAwOStZ?=
 =?utf-8?B?N1h1NVUzSUx2a09RbzZDN1ZSajV3RnY0aldUczNSc0xrRERPYWNMVjQxQjFQ?=
 =?utf-8?B?Z2NraFBCOHlTOXlGWmVaYlkxL2RWQkZqZzV6Mmt2N1lQdVlGaVMreGEwbWNB?=
 =?utf-8?B?NVZ3eUxCc3lSQ2orWm9JeTJGVEJTblNKL3AwV2xaYzRockhGZ3ZNZG8rZU5a?=
 =?utf-8?B?ME11TFVpNy85MVdGOE9FaHYrc3cvWG95c3c0TkhCQXlOOW9tRytLMkZBUDVG?=
 =?utf-8?B?SExwME1hdlo2QnJha1Rvam80U1F0ZTRZdjJCdjNQdEtzdHMvVWFLV1BtSEZs?=
 =?utf-8?B?VEtGTElCQ09sRCsvOGRISXRMQ0crSzlvZFl5eXdJVEdxSVpkTjNzRDdEVmtk?=
 =?utf-8?B?UnJmRk9HeWV3cG9QOUVxMGlGRm9JVVdWanZnWkpLOGZLZ083ZFpVZkpCb2VL?=
 =?utf-8?B?bzhqRW9VN2loWENNRDU3ZFRiQXpSbmxvNlpEK0hKQUxRbFYwR1BxTjI2TWJR?=
 =?utf-8?B?S2N5enN0VkFHOEhkdnNXNklMb0VxdmlmdHZMWTZDWVUxVkwrcmFDTng4b2Y3?=
 =?utf-8?B?cjEvb3hpMlU0NUJ5VDdob2p5RWt2R2hYa3pGVGwvb2ExUTJpQnVuc2pqS3J3?=
 =?utf-8?B?MHVENnZCVVdTMnVGbUxQc1pIWUlOSUs0UVBHbFdHN0V5d2d5cE1KeEtodmlB?=
 =?utf-8?B?cjd6elRyQkN0ZHdLeXV0YUtvckJUSG1jK0hhOE1rZ2pFdmR1UDNmU0hhejBw?=
 =?utf-8?B?QXBRSE5icm1CckNMcllYZE9CTkk2eEhPdmNnTXp2V29VSW4zdjgxemZudFBD?=
 =?utf-8?B?TmFJS05WcDBmYW1Cc04vWHRSRjlkRklNK25rL2Rzd1hkaDRMSFo2NUxGelQ4?=
 =?utf-8?B?RkdtRXV0OWdiOEx3WjlSQkVZR0RaZVZyTzhEclhCS3I4TVp6UFpxT0xlMk0x?=
 =?utf-8?B?b0RGYTQyR0hMN3g3dVhSVG9PaVM2SDhQYUdxWXVLZVV5eWhWKzJaSzlvRHls?=
 =?utf-8?B?YkQybkRaeFQ3ZkQ1K1NCSUdkVmlGSER4cUdiemtDNFBxbnlrSkZiWGpnMEpX?=
 =?utf-8?B?MExWVXg1eU9McnV6M2wvdzNHWTlabFkzUDdsSGx5YmJjdmlweVNqekpBc253?=
 =?utf-8?B?K0lRdnRjRDQraFd4S1ZHSzgwMTRaL2NyYWxkdENXOVVjV3FwQU9VK2FtREdy?=
 =?utf-8?B?QkFkZ1g0YUZ3SVNXL0J4TTNZQlBjYU1UT1B2dXFJazF2NmQ2UVRsY1ByTWdN?=
 =?utf-8?B?TVZwRDBFQ1ZtNTQ0ZDgrRjlYZ2R2U2U5cXAzYmxPRWN1OXFyTXBZMWFNdzNQ?=
 =?utf-8?B?ZjBxK3NqaUJLNGRhaXFGOWdNS2NuVlRtVTNyTW9rRGdqYmNmUmFFRnJUNzZU?=
 =?utf-8?B?ajI3MklHOUthR3paWmNYS1BsaEpLdzI3Q3d5aCtESTRWbnMzenlGL3NYR2t6?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5676b97-50d8-4976-18d9-08dce423b63a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 03:22:01.5041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFvyxkfxurIlgckh10/LK6170/jqPAfUr6UX3X2t6FJjJ1h9cnePztXBi2RQgaQ0VxC+eYbbdPB19SbCyFgyrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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



On 01-10-2024 10:41, Ghimiray, Himal Prasad wrote:
> 
> 
> On 01-10-2024 01:45, Michal Wajdeczko wrote:
>>
>>
>> On 30.09.2024 22:13, Michal Wajdeczko wrote:
>>>
>>>
>>> On 30.09.2024 07:31, Himal Prasad Ghimiray wrote:
>>>> Instead of calling xe_force_wake_put on all domains that were input to
>>>> xe_force_wake_get, call _put only on the domains whose reference counts
>>>> were successfully incremented by the _get call. Since the return value
>>>> of _get can be a mask that does not match any specific value in the 
>>>> enum
>>>> xe_force_wake_domains, change the input parameter of _put to 
>>>> unsigned int.
>>>
>>> at this point in the series xe_force_wake_get() still returns errno
>>
>> oops, scratch that, somehow missed patch 03/25
>>
>>>
>>> maybe rephrase this to something like:
>>>
>>> "Prepare xe_force_wake_put() to accept force_wake reference with
>>> refcounted domains"
>>>
>>> and also maybe it is a good time to change this function to void (or
>>> maybe even do it before this path?
> 
> Changing this to void here or before this patch will break the
> compilation, since the cleanup is in subsequent patches. Therefore,
> patch 25/25 addresses changing it to void after all the cleanups.
> 
>>>
>>>>
>>>> v3
>>>> - Move WARN to this patch (Badal)
>>>> - use xe_gt_WARN instead of XE_WARN (Michal)
>>>> - Stop using xe_force_wake_domains for non enum values.
>>>> - Remove kernel-doc from this patch (Badal)
>>>>
>>>> -v5
>>>> - Fix global awake_domain
>>>>
>>>> -v6
>>>> - put all initialized domains in case of FORCEWAKE_ALL.
>>>> - Modify ret variable name (Michal)
>>>> - Modify input var name (Michal)
>>>> - Modify commit message and warn (Badal)
>>>>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>>
>>> probably this applies to some earlier #rev, so please mark it as such
> 
> Sure. Miss at my end. Will do in this patch and others.

Changes in this patch looks good to me. Please maintain my RB.

Regards,
Badal

> 
>>>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_force_wake.c | 28 +++++++++++++++++++++-------
>>>>   drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>>>>   2 files changed, 22 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/ 
>>>> xe/xe_force_wake.c
>>>> index 7f358e42c5d4..372ea43b0d06 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>> @@ -211,26 +211,40 @@ unsigned int xe_force_wake_get(struct 
>>>> xe_force_wake *fw,
>>>>   }
>>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>>> -              enum xe_force_wake_domains domains)
>>>> +              unsigned int fw_ref)
>>>>   {
>>>>       struct xe_gt *gt = fw->gt;
>>>>       struct xe_force_wake_domain *domain;
>>>> -    enum xe_force_wake_domains tmp, sleep = 0;
>>>> +    unsigned int tmp, sleep = 0;
>>>>       unsigned long flags;
>>>> -    int ret = 0;
>>>> +    int ack_fail = 0;
>>>> +
>>>> +    /*
>>>> +     * Avoid unnecessary lock and unlock when the function is called
>>>> +     * in error path of individual domains.
>>>> +     */
>>>> +    if (!fw_ref)
>>>> +        return 0;
>>>> +
>>>> +    if (fw_ref == XE_FORCEWAKE_ALL)
>>>> +        fw_ref = fw->initialized_domains;
>>>>       spin_lock_irqsave(&fw->lock, flags);
>>>> -    for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>> +    for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>>>>           if (!--domain->ref) {
>>>>               sleep |= BIT(domain->id);
>>>>               domain_sleep(gt, domain);
>>>>           }
>>>>       }
>>>>       for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>>>> -        ret |= domain_sleep_wait(gt, domain);
>>>> +        if (domain_sleep_wait(gt, domain) == 0)
>>>> +            fw->awake_domains &= ~BIT(domain->id);
>>>> +        else
>>>> +            ack_fail |= BIT(domain->id);
>>>>       }
>>>> -    fw->awake_domains &= ~sleep;
>>>>       spin_unlock_irqrestore(&fw->lock, flags);
>>>> -    return ret;
>>>> +    xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to 
>>>> acknowledge sleep request\n",
>>>> +           str_plural(hweight_long(ack_fail)), ack_fail);
>>>> +    return ack_fail;
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/ 
>>>> xe/xe_force_wake.h
>>>> index eb638128952d..b5a75544d86a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>   unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>>                      enum xe_force_wake_domains domains);
>>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>>> -              enum xe_force_wake_domains domains);
>>>> +              unsigned int fw_ref);
>>>>   static inline int
>>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>>
>>
> 

