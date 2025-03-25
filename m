Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B780C36008
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 09:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C248810E1B2;
	Tue, 25 Mar 2025 09:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwLJIC6j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C6E10E1B2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742896132; x=1774432132;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/OZTV/wmT0DqpJMQE9rfIIfuIUO55BCc7HTvULNc2d4=;
 b=dwLJIC6jpFo4MWEoooZjkwQqfX+rWMGFeumskQj2A8sbZPidM6/GfKpe
 3/mPM1ZTm44KK1U0C05NvxNZzAx1m6Ic+FVNCWOUNXdrSKPb1k3tXQivK
 9+F8R9LoNCaw5Thi8jnsLzn1R+l6tDMi6Tlq8MM5+R6Q07WhQQDiu4RBW
 nPDFg+aFBaOdcBUqHX5ZtsdsVmKJDm+JOscA1t6Blp/HhL5jN1YFC4N3D
 i+a/B4O6lMg8hSGNSTL8BmefUg35OpkB/yr/RjP0Q7Vn6e3KIXoNMCrzV
 MoDtZ7sYe8lieieZ1IBrHVA7DNJ7OYgHzcxs74vWPT+Bqr1TzfrSEkSVx w==;
X-CSE-ConnectionGUID: gFNBhMgNScmEFDtJVeOS0Q==
X-CSE-MsgGUID: BkQb4JnyTsuS1B/WPIb3dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47915950"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47915950"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:48:49 -0700
X-CSE-ConnectionGUID: OT4asSVPSTWv/rlBqlxyAg==
X-CSE-MsgGUID: UrfgmhZoTXuO4sL6jmpdrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124040879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 02:48:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 02:48:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:48:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:48:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKTXA3ZxMGj4x2aelXosBgaTwXLNyyEJOUJI15D2FX6gh/qeMVBRDsMmul7a+DB3s+vFm0AcUz0sTNoX4xnARf48gQKSLf6C0Gzxvcyk5UdK/ECotcYxljSQPnE5BmeGujYKe19Bb5oT+yyKqeZUHvwLpPP1jDRzO7fzkltBFsutJkA/h0cePIKLRnBeA7fj9+FEtrCAGlwQqG8zr74IMLPpFybgiG9tq2kZvjzvII5H1XvphuoHhqm1OtkN/jY5DK0TBNnoY0L3EBDGtDo+QDwDpzwlFrU+/1z9WWtZeQxKZPbzEFV25z4O6AuYqYA1AfGA/dWwryuvYmJIUnSvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHqI1vYvMEy2tfzpIe9CvXoz/HgwXvbYd7BHzBvzAY4=;
 b=r8TlmlIyrMhJ1bz+sjbDcN1zR/GCSzkTOcxW0x/shsWi9FMRBRKG/b3fgZHBWGjefgsWB1VHILW9TP4inJr/L6Sog12uH71SEo95UFUydW2/PhwCUnYa7KwsGaSxC3sDJi79wHmf/baol8WYMM/wlP2vzVL9rMcvPVV2VC7Pr4iBMyVOYCL5Wj+nhv8QLox7woIcuJ13PnySI29Udq+mnBVSFP9A6qFyXo+4rRz+muhfvXfFtPGvs9CfavyK9Slm7L5h+QdEUxSvvd3plsm1Jo9enm04eYgrn3l+UsFpt/LOKI5vSm4l80qODWukWXjOVk/FrgJAtukV7jwSDJ+TNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:48:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:48:46 +0000
Message-ID: <e91f93d2-a4e2-4304-b026-eea2f1fae13d@intel.com>
Date: Tue, 25 Mar 2025 15:18:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250319121349.288844-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250319121349.288844-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db87ec2-ea10-49db-2ef1-08dd6b823c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlkvekVBR2dVMk8ydmdBYmRSZDcycmNPWlBwWnM2eWFvQzhBakxzamdEVmxo?=
 =?utf-8?B?ZmNuelI3ZndYUnRXbGhDczJ6Qjh6Y09nV1ppZWFpUkQ1MzhHSjhxK0hVUXE4?=
 =?utf-8?B?cGhjdUhvTWU4RTQ4YkZOQnRPOTA2L1NmYXZlYzl2dklQQ0Z3bFdEdEhvV1VN?=
 =?utf-8?B?bzRFYzQ0N0RmNGpPVXdQdjAzdnFPek4zZTRZeFhPNG04ZmVQT0I2SFIxTzJj?=
 =?utf-8?B?eEUwTTJod3NPaE52NTc5NUExSnNUY0FKdWUxZFRnNzR3OVgrS0x4KzZNTmFk?=
 =?utf-8?B?OTM5dG1ncWZSWjZwRHNPT3RPc0FQSHQ5MmFsTy9qYW9VUTg5b2tMT05jVXVm?=
 =?utf-8?B?U0tTcmlRRitvOHU4WElvN1ZFbDJDK0p5NlF3a0dRMHNnSldvWEpjdTJUNHNK?=
 =?utf-8?B?R2QvOWhsSkVWWHp5TG1ibmI5aE9JQ1lzTVVDSytjOEloOWpJUlBORjBOSm9z?=
 =?utf-8?B?Q016Skl0M3c4MUIwa2JqcjAwcnFRWGlCRUlqaGxLc2Y3N09MNCs5UEpMcHNY?=
 =?utf-8?B?dEVwRUQwNm90UzQwZzJsV2FOdHBYaFllbHBibUpRYjhiY0d2VUdiRFhRdzRB?=
 =?utf-8?B?TVJiZ1lXdGJsR0d2OFp5UTRFZFZ2OHJGZVRnYzB2UGEwSE9aeU85LzdSUW9w?=
 =?utf-8?B?bUxQcHo5cGk1eXZ1dmx2M3o3MWhmK0FsYzJSRGJhU3M3b1NqeWNsbVUvcEVj?=
 =?utf-8?B?ZEVkYmNCMlNrUVVCcjhrL3grUG5yY29DdjRiSiswSWRsbmhJRzg0RDhRTFVp?=
 =?utf-8?B?Ky9aWVZwUmZhR2ZlWno4SlBXYnZrc0dUQWFDMGNROUp3MG5vcUREMmt6NkFV?=
 =?utf-8?B?ZnB5RWliTHRWT2NGR3BDeGlIZ1RCbytadDZuQ0wzSk1QVDlJazczOWR1eW1I?=
 =?utf-8?B?QWZWQzZEMTAyREVwSjY3U1FhMk90UFBpdi9qdGM3K0NBamlYa0VZWXB5MHll?=
 =?utf-8?B?R2hJWG1iYWFJdk0ybWFiTVV6enNGNzBYZGYvRUlob0R4YWdCc1Myd1NZK1ZR?=
 =?utf-8?B?QVM4TkxMYWdIeTN4QWR3L2lGRWx2TkZUeTdjMjVtZ1NnK0puY1doV0R2QUVI?=
 =?utf-8?B?eDhnZ3ZpK21sU1hhOFVkbzFNWnBJOHBPNlFXRWNHdllIS3lteU9IRUZveU1v?=
 =?utf-8?B?ZnEwbkVMek1GalVBNE03b1QrYTdaRm1iYm5XUisvUHlaVmNaSXFoK0o1T25E?=
 =?utf-8?B?WmRvSFl1RStsUW1mS1ZFemJqd0ZYV3NDNGJoWUVJWHNCUGRNWU5JOVJPRVVx?=
 =?utf-8?B?OGZKTG5RUGdsangrVWQ0ajVLTktGR1hjTi9lUFhUdmJLTFNTelh4TU84T3lk?=
 =?utf-8?B?dTN3TlJlV20vRUdVL3loL1BIdVo1UUhNMDNmSG4rV0lhSTV0dVlNNlhDaUs3?=
 =?utf-8?B?bWpMYzdtWE5CNFpTT1FRaktMTm1TZlpEUkYva29GWUdVYWUyU3Jiay9tWW8v?=
 =?utf-8?B?em9EMUtXU3ZkUkw2Q1FwbGQ5ZFYwbzhWSG81UzdKRzQ1NXJuVUQ5d2FLYnJl?=
 =?utf-8?B?ZlNoWENqNGRqZ1hQcWFmbCthZG1Tak5JUnQrU1ZXUVJtT0ovdnIvbGM4Q240?=
 =?utf-8?B?eFNpTi9yNVlJNWdFRlhuQi9WOU9RaGdmTkZBai9MZ1ZQMVkrYS9aekI5Y3g3?=
 =?utf-8?B?bHE4VzZrS0hqSXpQZ2RLb1BiY2pUR1J5QTBIUk8vU093N3kzMTJuNXZ2S1h6?=
 =?utf-8?B?SWt3TExTOUwvMmdKcUlLNkRXcitXWUEreHdzZ2M5ZGdvSzVWWXl0R1dnVHla?=
 =?utf-8?B?dzdpVlFoay9OYWo2U3lpdW1iOEl2VWp3UGYyd2lnLzVKMkdVcXJKS1hZOFU5?=
 =?utf-8?B?MVpEVDI5SW9NeGgxQlhvVit5bXRCYU9Tak96dmZmdy8yR2FEMmFJWlYzSWE4?=
 =?utf-8?B?UEdhYmJYTldCZGp3T1NJendzQmhmVmpGenBTSTJ1UWhuNGhDaVlLdFNyNHlu?=
 =?utf-8?Q?BsM5moQUj3g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3V5OCtFRTYvNVV5TTZXenhQMVBoMGxtazc4aHQxMWhLOUpDeHVEb1VPbXkw?=
 =?utf-8?B?dXAzeGJRcEZXdDJyVUxSd1MxdVkzT2FrQ3lUemlUOXR4ZWtDTzBBR01vN3BP?=
 =?utf-8?B?bXRDSVllU09NTU16YTdNQlBYcHRoZWhXLy9EY0VxajZ1WDlvdXVDWnlIVzla?=
 =?utf-8?B?YVYwSmZpUUlUSi80MXhzVHoySExWS05kTzk3dHdZd211bUdDTUxRUkhma1Q4?=
 =?utf-8?B?L0lpQVZnK1A3ZWltQkFCM2ZSenBlaWw4WDQwN2hnTk9tNWViYTRNMG83TkY5?=
 =?utf-8?B?Z1FxZXJwWXVia243QlJKcUZ3OFRZem9CclUzS09idzlUYyt6Z1UvZ0RIMmhC?=
 =?utf-8?B?a1doY29HSTUrKzFUL29jVE00TWU0VDFaRTdORUpFTXp2R25CV1lSNkE1Unl0?=
 =?utf-8?B?bk5qTWNQL1YzUFVPT1hxaWpsNW5NUjFkVDJ2VUNKYkVENStBdEE2cEZiUGoy?=
 =?utf-8?B?ell6ZFlEdW16b0NhYlcvcmZNMldCb09YWHIvbWlOVXRwS1R5aVNqdThBb1VI?=
 =?utf-8?B?NzZLUk5JWWE0RHptaVorM0N6MmpMVFBDRS8yYzlVMnYvdmpnOUpLaW1DTjdF?=
 =?utf-8?B?V0N5bE1MUFcvaENHeW0rbnd3Sm1iQXpzcVBsaE9MS0M2K2xRS21hdGUvc2VB?=
 =?utf-8?B?SThQaXFFMTRRVm94d25JdzIzcmliWVJKdnI2N2l3cHRKQXk1R3NPUHJNYnJ4?=
 =?utf-8?B?Zk80RmVVNkZCcE80WkFVbzVQdXpnQjZyNW5PRWlXWUFSY0R0SDJ6cHVmNFVz?=
 =?utf-8?B?SWtGazh4SkJxZUZFV2c3TnBFTjZaMWpHbHhsVEs2WUJvMTIzMzdNNzZGVVRU?=
 =?utf-8?B?RDN3UzZBMmxNVWozSUpDQnlXZlVRMmhmb2laRGFpdVVSU2QvL2NZZEhNdTlj?=
 =?utf-8?B?NXVERVMxWU1XakEzSDZER1ZxZW5NZWpQR0NEdmJ5aTVjbGFHT1plNG03YXhV?=
 =?utf-8?B?RmNjbHJDN0ZUNUR4WEFBblV1VGFPVHBhdlBkakRYVHFPbGU2OFJoaU5NRmpO?=
 =?utf-8?B?TnBGbXdndXYvWVFROFJ5QnVGWUhxcTR5dzNYTHhTeStodXB4OC9mNlp1V3Vr?=
 =?utf-8?B?WlFmVDRrZklwazB0NjNCK1dLTnZxcXhNVFpqWkFHenNqOG9NbmV2ZVRON2ZE?=
 =?utf-8?B?cjFFZ2l5bGpOMGdCcktEMllvRy9lWXFhc25HaUtpUTlYREhCSFZKSmtPZUg4?=
 =?utf-8?B?c1FTY3o3WHJqdGU1cWpWbG9mdXFCZE1WcXZ1MHZtdGxKdGFYcDdvN0UwUVFw?=
 =?utf-8?B?ZlByTkU0RldyRXVsazJCMURHNFlBYWZseWlaK2kyc21Ea2FmbjVvOXpGbTVP?=
 =?utf-8?B?Z0kzdkZTN0ZOak81NUphWEo0b2daSGFVVkE2cUo0enFsWHhaTCtPRmcycFRj?=
 =?utf-8?B?akRtZmFMaEI2RjRXb0hzM0dGT1QrSTZ2NUx4dGtlNVZYY1poeExCYkJadjJB?=
 =?utf-8?B?b0FYd3d3cDg3bHVKSFVFWk1zcnJlNElFb2NGbkJHSFJGSy9BdTVvdFhoQzRt?=
 =?utf-8?B?K2NnZFNvbHNUS1JFN2pEckZxTzlBSldlRlNzY0dQVkJZT0RTQ0QwaVV0THht?=
 =?utf-8?B?algybHNKQ3ZEeUNnSW02ekZHam9ITFYrMHNncWl1elhHcEozZzRIWmkrNFBR?=
 =?utf-8?B?Ym5wenB0RTVaNnozbVVvN2FQUTRPVXlJdUM4MzhrR3ZZSWs2eWpQYUtuVUJ0?=
 =?utf-8?B?VitrUU1oRGFUbGpXMEk3MmdobTNGME1Pd29aR1kzdWtNOVQzM1RmdWljT050?=
 =?utf-8?B?c3QzbzUyVkliRnExaG04MWFPWVZaWDhpa3V3RXNEdTBjcHMvVXpGOStmVjQ0?=
 =?utf-8?B?SDN2bytIdXE0WklZUnIwM2JaSWE1aUU2QWpFWGdMWkVMNFZqSmhEaXNIdStW?=
 =?utf-8?B?ODR0dlFINzdwd2FEK2Y2TWY4dE9IQUhFZFlNd3REQUZ5dDVrYm9NV3ZuMFMz?=
 =?utf-8?B?aHo4czF6M2NKeDMvcktZSXJraXlTTmhwQ0FJWWZORnVKU1VFcUY1cGJlTTlB?=
 =?utf-8?B?Wk9DZ0FKZzY5VGVoUk1ZUG42SkVTVUtYdnJsM0dDMm5kTFZES3dNdXlqTXEx?=
 =?utf-8?B?OHREWkdVTjFTZExYVUg5bzRjWDRVdFp4eVEzZG13R0VDRjBtWG9LSkNYcHFR?=
 =?utf-8?B?UFZqVE5hdjU3c2hSKzVpUWRsdWFxakRncURPZTlpUjUzeGFPQlFjRVZGdEIx?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db87ec2-ea10-49db-2ef1-08dd6b823c99
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 09:48:46.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAisMDF7ioNZ8vifo86e4bnKpmGd1apwBZ30XIaucLCCR48yeGw4/YNJ9XzFafCrFUhdVpmVHe6ZJFTpHMOGVTNSDlufF1Yt6eJnDVOnxuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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



On 19-03-2025 17:43, Tejas Upadhyay wrote:
> Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops
> on wrong directory. Sysfs_ops needs to be defined on immediate
> parent directory to be able to called on each attribute set/get.
> 
> Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 67 +++++++++----------
>   1 file changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index b53e8d2accdb..25592f178482 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -492,39 +492,6 @@ static const struct attribute * const files[] = {
>   	NULL
>   };
>   
> -static void kobj_xe_hw_engine_class_fini(void *arg)
> -{
> -	struct kobject *kobj = arg;
> -
> -	sysfs_remove_files(kobj, files);
> -	kobject_put(kobj);
> -}
> -
> -static struct kobj_eclass *
> -kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
> -{
> -	struct kobj_eclass *keclass;
> -	int err = 0;
> -
> -	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> -	if (!keclass)
> -		return NULL;
> -
> -	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> -	if (kobject_add(&keclass->base, parent, "%s", name)) {
> -		kobject_put(&keclass->base);
> -		return NULL;
> -	}
> -	keclass->xe = xe;
> -
> -	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
> -				       &keclass->base);
> -	if (err)
> -		return NULL;
> -
> -	return keclass;
> -}
> -
>   static void hw_engine_class_defaults_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
> @@ -611,6 +578,38 @@ static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
>   	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
>   };
>   
> +static void kobj_xe_hw_engine_class_fini(void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, files);
> +	kobject_put(kobj);
> +}
> +
> +static struct kobj_eclass *
> +kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
> +{
> +	struct kobj_eclass *keclass;
> +	int err = 0;
> +
> +	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> +	if (!keclass)
> +		return NULL;
> +
> +	kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
> +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> +		kobject_put(&keclass->base);
> +		return NULL;
> +	}
> +	keclass->xe = xe;
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
> +				       &keclass->base);
> +	if (err)
> +		return NULL;
> +
> +	return keclass;
> +}
>   static void hw_engine_class_sysfs_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
> @@ -640,7 +639,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>   	if (!kobj)
>   		return -ENOMEM;
>   
> -	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> +	kobject_init(kobj, &kobj_xe_hw_engine_type);


The patch makes sense if we need to use xe_pm_runtime_get and 
xe_pm_runtime_put to show and store the attributes. Are there any 
hardware read/writes associated with these attribute store/show 
operations? If not, why do we need pm_runtime just for software states?

+Rodrigo, for his views here.

>   
>   	err = kobject_add(kobj, gt->sysfs, "engines");
>   	if (err)

