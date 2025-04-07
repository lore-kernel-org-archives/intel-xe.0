Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16311C3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 05:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE9C10E1C2;
	Mon,  7 Apr 2025 05:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6MPeFyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444E410E1C2
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 05:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744003940; x=1775539940;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+50x6a+4hm/e9UrYrB32Ap0QvDmAW/ydJ/ZcHKo77o4=;
 b=V6MPeFywh1j4HaQc6ZVABewejiuODQbD1gnHCPcPBDZqcf8Mxax4CWx1
 239Atx/Seku3eaDVJHclkdJgSKj4wuqxxkL94ejzTU7Z/uoBCeM1jTMRA
 BVu0dF0KsHQqlrbNI0/KB89HsIj48JkPcceIAKeOvnslIEs02RWMLbONE
 Q9xo1bP+9Plx6NgNsL4QvyEaKkCfjiLyACCu/B6KwP7BLGxh1KYGTpBdj
 IB8hGSLQ/jcyvtoCJTimUMTU1zshWMTBowzpXYvufiH/sDZktTbMcsiS9
 JJ3ktsft4aznQ2TsNccgKaqSJDBkl0Ovm6d8B42VCF2RUC2l5Q68UlELL A==;
X-CSE-ConnectionGUID: 1+C6ABq5S+emCU5hc9EVUw==
X-CSE-MsgGUID: 7p8taKc7SHu9Gv+frXmzqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="48085038"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="48085038"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:32:19 -0700
X-CSE-ConnectionGUID: ow6q05oXQ9C9I3x0/7hSig==
X-CSE-MsgGUID: MxcicNcnQZuwgYb9IxayTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128709682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:31:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 22:31:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 22:31:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 22:31:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmTDgdXB1j2CIZgBwxDJCKpeClnhjelasAvP2KbNYmZEiWe4QzjqveVOt51p5asZsO3oKA95/IPYCqC2uzFjxqR0sYtme8jRdJnltCblgXtjPcN0LReKHJK24otrX1o1+jc/vi8Usm5kJFeVcFCfySfpMrn66oekI410AGO0sajInVegUKRymwYP3sVt4pFmDVEh2inq/+BVQs7fuYFqosgPqgJLIUodV5O2S0BCwRGTzLVFhoRyr+f3MJ1eVvZJH1974g9zeLm3c1JYySj6dA1+jKZ3kc+CQ3FMOocrLl9PqxX2uvfpISu7Am5hx93ZeDxDYNTFkz6Extw9jD7jOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLDm0iUCm9HwX9SBc6NeV2O5PxitUVKay9/QA7FrwaA=;
 b=k7mod24DveR6UnOXtS/8I9CXbTPodlejXulDFsGD2LlDZ2RRLa0X2xCy5AgxBijAXmILnN5jr55ujAYyiYsh60xlSQ4QmM6I8vNH/QgtZ9OMSEcuFe8LBaqeKQJEtxBMT4HdES3eH503Eb9Wpvtc8UPMBn2/VxT2Z/cV7mRGcCFGAwGeO8WXJi1nL8ehN9v2Yx5XSDO/BeHLwUzgGuBP2OqyXTQjcxMn5jwwkoc8DgycLTGHEeLvGseakzUUDeSU9HYe2M9DfUieDaZGRYHM6Q9ZjE0u+xo8+Gf0HhSet7OBUaVY4Myb/HABUoVOpFDIo85KCUGlJPm1xUo92Zj8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 05:31:23 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 05:31:23 +0000
Message-ID: <6547e178-312c-4d31-851a-1cf402cbbc8c@intel.com>
Date: Mon, 7 Apr 2025 11:01:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] drm/xe: Clear scratch page on vm_bind
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250403165328.2438690-1-oak.zeng@intel.com>
 <20250403165328.2438690-3-oak.zeng@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250403165328.2438690-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 355dccb6-b570-4f53-7e1b-08dd75956efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXhYOW9PQWFtRkRNVDRMNzBTbzFKRC85dm5FZGZhMGVldDVjbFdQajdZZnFl?=
 =?utf-8?B?RExKOThaQXYvNWhQUXd0UG9CY241Y1NkV1l6T0ovK1pNOExQZHFaR0hWT1VW?=
 =?utf-8?B?cjJ4b1YxOXpuanNDUUoxRE45b1RCSm1HR003MlVlODBpSmN5eUs4bFFER2NN?=
 =?utf-8?B?S0hMYUtpZnhpcGxDRDAxTGQzLzBSeHBYVVBYbUc1cmpmNklIcE8xQWhZdWpa?=
 =?utf-8?B?Q1ZvQThWSmRDRS9nZC80NzNjQktsbVF5UEI2MHNwMUNxcUh5YWIwVVp2VGpa?=
 =?utf-8?B?RHRWSEtFdEtDSndNVnpBYkk4VWNsNzN4WGEyNEF4c2RtcWcyem1sUkZ6NU5T?=
 =?utf-8?B?dzN0MVVJQ3psZjRrSmhXd3hvUEI5cVpwc3B5eHlPRTJWcVBDSFkvRHIyRUhL?=
 =?utf-8?B?dVdtNDBjWUZYbElDMmJqL1RncTdPOHpaRDVxRy85OWM0WnJrdFRPcFpXUFFr?=
 =?utf-8?B?Ynk2ME5LcEFZMkY2RllKVm1wb1NhN0xMeUJ5TlFQTHVjWUREOWxxRERiTEdy?=
 =?utf-8?B?WHEyNUQ0cUEvVEYvY3F6Nkgxank4L2ExVUhab0Vjc0ZIZE9VV1U2ZExKV2FK?=
 =?utf-8?B?SEpKVHEzdGw0N05IQUd6b2FMVmZlYm04V1lqMmhiY0tmOUVBWk5HOHFNRGRU?=
 =?utf-8?B?dFV0a0E0dnllWVFTdDhTMFgybTdyYVI3QllXLzVRRWptNmE0TVNJVHBtWG5n?=
 =?utf-8?B?WWg3N1NtR0hZVjJDblY3U1lHUFh4TkJFL2dyOUM0WDIzRXNBai9Ic3NQay9R?=
 =?utf-8?B?M3dNYkk1QW4vclZ3TGZ5dEczbkNnSzFjL2p6a3hiVHcyLzFWZnkvRmhQdDRD?=
 =?utf-8?B?ek5hNDdkNC9QeHNFYTdiK1hFekVSTzdwb2J1MkpOdVFBMmcxaUtOQ0hzSGRs?=
 =?utf-8?B?TndJdE9uYmlFVjFmekZqaDBaSDdSMlpJU0Rtelo3YkN2cjZuVFd3Rjg5SVZn?=
 =?utf-8?B?UW1PUGxUNmpHOFY3ZEdON3M1YlVrTkNnOENvQS9UMlF2dDNCU1lYeFBtaEc1?=
 =?utf-8?B?S0grakxCYTRmeFRJQ1NKbkFyRWcvWWFoZ243YXVLQ042RXpvVnlxNFNPQVpX?=
 =?utf-8?B?M3NXZmk4RTl4WXZvbFFUeGZEWHpnMFhiY2ZGZlB4ci9odFF1d3ExbmNiZzdM?=
 =?utf-8?B?ZHl0c3FEd0pkdlNDRjRIMEtFUG9TQy9GNnRSeVZRQXJOditNZENXdmttNURE?=
 =?utf-8?B?U3dLZXZRc3EyNTBJZFdrRFBYeFNVbFdFczdacTVVWWh0MG51MTllRkI1cm93?=
 =?utf-8?B?ZkEwY25PNXg1eFJnRnBNcjNnZFArRGErME1yYkN6MC91RkVnVUNTaVppWEt1?=
 =?utf-8?B?SWdJZ093YlFJWFlMUC94dUErVnh1cUdvS2xQRnlWOTl4Z2FSMXVteldBQ2J5?=
 =?utf-8?B?bll0b3ZLelBiUnhFYkkzZHNoNVpxTjBGL0NOVkR4bHFNaWg0REVqWXlpMzkv?=
 =?utf-8?B?TXduaGFtNU1HdG56MEZYVDlGblU2WmVUWDQzM1gyQUZYOXNzMkpDZkxMT2hu?=
 =?utf-8?B?WDdxaDczQnBmeC85Y0xqVS9jQlk1RXpSVnV0ek16ZEhkTUprQ0wvQVdOaGtt?=
 =?utf-8?B?M2tlMm1meHlPSFFrcnRWRFUvcGorNFdUNG50QVlBT1JOaDFXVW5ZVytvMTll?=
 =?utf-8?B?ZDhVSjhhWEh1Wnd2cDVVZHdLc2NDVzZsdWVMRll6c2c4ZjZnd1kvYkllemFp?=
 =?utf-8?B?QUVURFBDelpuYmFnT3FhU2lKQk1vMWlsQTdTZXBnTFlIZTJQVEVqN04yeWRq?=
 =?utf-8?B?UTJESmswbFJMNTUvS05nSUtubWNlR3FTS0k1ckpjeEljd1MvVS9YaGVHMFRC?=
 =?utf-8?B?MVd6Yk1nMlE3UGVCcUljejlaVXh5Qjg1b2dTc0F0OW5XMDZ3N3JaNFFSUURH?=
 =?utf-8?B?ZVEzbVpyeVJPcEFwdE96ZGEzdUhIQTFIeVVlbk8vZExLOXc2clo5dkxlM0tE?=
 =?utf-8?Q?XR8MKy8Ex10=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T243RkIySE11L2l5aDl0d0pkK2dxODhOZE95dHoxakxLN0I5cURwVTE5VmRj?=
 =?utf-8?B?dGVxRDFYUUpTUVVpMnRHendKdTdrR1dkVHZqTy94bm9RY3g5Ylp3OVR5Qjh5?=
 =?utf-8?B?SmRCM0Z6MXZUMUNUVDY3cTZrNXNtMmc3YitJa2JZaThEWmRsa0U2MmNnRmVC?=
 =?utf-8?B?K0ZzcXNWblpHSDhuUDVhMUpiUFBZRVRveHlNaXNpUk5pMngyRFRXL1RhZ0cv?=
 =?utf-8?B?VFJ2UVpnbkxJVWRESU9Pa05LMGpmbWVXbTlWRGJTNUdNMGh5Wk5zVEpTNkdY?=
 =?utf-8?B?aUNyaE92M0FPMzhCUlJwZXhCcG1LcWQ4UlZyQXMza05UQ3BmcFdPRUZVWVQx?=
 =?utf-8?B?L3VrN1FpTVUrVDhvbFFWbHNzcEpLL1lUYVkrZmZWWXF0ZTNBUEs2ait6VlQw?=
 =?utf-8?B?MUdodVZiOWt2QmRQMy8zK0lzR2Z3bWV4RU1pK3BjSXl3OUJ2Mmlzb0Vlbmxj?=
 =?utf-8?B?WXRYN0lGZFBOZzlNK3Z2aU1NSVNKWFRvMjJ5RWJra3JkWFNQaW5JRmNJUHht?=
 =?utf-8?B?Zm1KZjVoNDVQTW80R2xIek9STVcyQVBrN3FFR1NNeFpJbVphMy9yYk9TWGlv?=
 =?utf-8?B?NGkrY1RydmpRQXRRQWc2Q3ZvRk9veEoxQ1pWMloxcXBkM3FSREVpbVExYVpX?=
 =?utf-8?B?ZzRqY1lKZnJnaHM3dXVTZXFpVmYxNExXMm1VOEMwM05vMWM0MWxrbUpGa3ZV?=
 =?utf-8?B?YWZ0TlVrWW50b05jbWhHZFR4WkVkcTRta1c1VVNWTisxRkFYeDRNQlI5R0Yx?=
 =?utf-8?B?KzMyT24xUmhJeVlUMGpSdnBYT1dsaXp2ZWhSQVg4WlZvYWNCNHFTNWFQdVMz?=
 =?utf-8?B?Ym5NNXlhQWpCNWxoQnpQZWdlbjlXNjZybjZ1czJXNGIvRWpZaktwa0RqbW1M?=
 =?utf-8?B?a29QSmpHcU5PUWxER2tYV01zNGlMWnkvbS80WVFlVjFRS1N4YWE0NkEzb25n?=
 =?utf-8?B?SmZsOFVoQ0FFM1ZocENmazV5ZS9ydlhsQ0krRm9MVG11dGNXOWVuWXJ6b3dM?=
 =?utf-8?B?bnhGRlE4R3I0cXJRUUp2c25TMVlSNTBFclF3NEtzNDU3TmQ5c1VNODBLQWdE?=
 =?utf-8?B?MGYzUWd3WnV2c20xUmwwOGQxRmFuSmQvUFpvNHZjUG16UmtmR0I2KzdVVWt6?=
 =?utf-8?B?WitkTFh0dk05SkZjRnc2dkhoVXAxck9FUzM1ZkN1L0poSmV2ako1QUthMG9y?=
 =?utf-8?B?MG1aRXpHVkwxVmo0L3BvY20wcDZscDJIdUVFOXY1ak9sWmdacVlTQkM5ZjV4?=
 =?utf-8?B?VjQvbmxheGFMM0N4enhuVTNVb01pVkRYa0dFQXluQjRCcldPSE0wMnFxN3BV?=
 =?utf-8?B?d2xtR1dwUVp6alBoeXpMU3ZFVnY5MW14TW11cHRrR1JhR1Q3Q2llS0Z5VkFm?=
 =?utf-8?B?VkYrWVRESnQ2UXFUSVVLTzFLcVJISkFLWTlUa1duMlBnbTFLSS8wb1dVcU5F?=
 =?utf-8?B?aWtJcFdtc09XTEdITHBjYkFRekMraGM2U3pFL2JvNUZlNkJ4RTkyVDlGLzFE?=
 =?utf-8?B?cE5RL2NxZjZaTE9oYWJTNHNhSFplTWtQQVp6YUFJMUdCeVVoalhrR0p5Zy9E?=
 =?utf-8?B?c1l6cVpMbXdVM2c1U1hPOUdxWVNrUUFBUGZaMytJN1JWMmhMUDZ6eHpKQXRt?=
 =?utf-8?B?SzFvdzN6dHFsM1RrVzFTRGk5ZGVXMGM4T3hQb3ZVUlFZaUo4MzJLcC80N2xJ?=
 =?utf-8?B?ZGFnOXQ2b2VQZ3JrZU5zTGJZVHR3WmNvSTJTS1lHc1NtVHRTSGZWeXFHaERu?=
 =?utf-8?B?WXFOaDQ2d3RvUmt0YURKTElOczNQTTRaaEFtZlp1OSt2RlZyK2FuSTcxNmk0?=
 =?utf-8?B?ODlrZUpTaEw3ZmZQTFM5RTBmaVFXWUJCV3BqRVU4SkZwZHcrNy9JdEZVQld5?=
 =?utf-8?B?Y3N2YWZOcUYzeEVxTXp4cmYyUnpLUWVpNnhzVUZiajQxREp3RFVIa3N3R0VQ?=
 =?utf-8?B?bk5Bd3A1Z3BwamJUQUUwa20rUE1xcWJYV2RmNGs2dE5yRllDTjA4WjQvdXJ5?=
 =?utf-8?B?ZWFLTFNJUHNmT0FhbzlMS2JHVDV5enpFdUFsb3BPTzZWbm5CTm4wNCs0Z0Ro?=
 =?utf-8?B?OHVXdk15cmNYdGtkSTduamFDbnJaMTRqenFPa2k0alhwQmI4bWhvOFNLQ0U0?=
 =?utf-8?B?dmtWdHhuTFBvdHFBMUhFUWhheWVjOUhUaUpZbmRoZGplSHA4U1dNRWNYQTZ5?=
 =?utf-8?Q?qjZfrycmtn+o8cP65PfQTTg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 355dccb6-b570-4f53-7e1b-08dd75956efc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 05:31:23.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpwUNFtlwnMZ/uEctyHvin9IFMW8MUWqCAYYfWOp86AbnAxwgXkXyNLW7vlHRZoVadQv/QFB4/Ww00RcWw/kOcYSNdU3g1CAmMfWvfJEMwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
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



On 03-04-2025 22:23, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping on vm_bind for the vm_bind address
> range. Under fault mode, we depend on recoverable page fault to
> establish mapping in page table. If scratch page is not cleared, GPU
> access of address won't cause page fault because it always hits the
> existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
> to a map operation, with the exception that PTEs are cleared instead of
> pointing to valid physical pages. (Matt, Thomas)
> 
> TLB invalidation is needed after clear scratch page mapping as larger
> scratch page mapping could be backed by physical page and cached in
> TLB. (Matt, Thomas)
> 
> v3: Fix the case of clearing huge pte (Thomas)
> 
> Improve commit message (Thomas)
> 
> v4: TLB invalidation on all LR cases, not only the clear on bind
> cases (Thomas)
> 
> v5: Misc cosmetic changes (Matt)
>      Drop pt_update_ops.invalidate_on_bind. Directly wire
>      xe_vma_op.map.invalidata_on_bind to bind_op_prepare/commit (Matt)
> 
> v6: checkpatch fix (Matt)
> 
> v7: No need to check platform needs_scratch deciding invalidate_on_bind
>      (Matt)
> 
> v8: rebase
> v9: rebase
> v10: fix an error in xe_pt_stage_bind_entry, introduced in v9 rebase
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c       | 99 ++++++++++++++++++++------------
>   drivers/gpu/drm/xe/xe_vm.c       | 28 +++++++--
>   drivers/gpu/drm/xe/xe_vm_types.h |  2 +
>   3 files changed, 88 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 33839b25d708..20d33dcd800a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -292,6 +292,8 @@ struct xe_pt_stage_bind_walk {
>   	 * granularity on VRAM.
>   	 */
>   	bool needs_64K;
> +	/* @clear_pt: clear page table entries during the bind walk */

Needs to be kernel doc.

> +	bool clear_pt;
>   	/**
>   	 * @vma: VMA being mapped
>   	 */
> @@ -442,6 +444,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>   	if (xe_vma_is_null(xe_walk->vma))
>   		return true;
>   
> +	/* if we are clearing page table, no dma addresses*/
> +	if (xe_walk->clear_pt)
> +		return true;
> +
>   	/* Is the DMA address huge PTE size aligned? */
>   	size = next - addr;
>   	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -525,23 +531,31 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   
>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>   
> -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> -						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, pat_index, level);
> -		if (!is_null)
> -			pte |= is_vram ? xe_walk->default_vram_pte :
> -				xe_walk->default_system_pte;
> +		if (xe_walk->clear_pt) {
> +			pte = 0;
> +		} else {
> +			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +							 xe_res_dma(curs) +
> +							 xe_walk->dma_offset,
> +							 xe_walk->vma,
> +							 pat_index, level);
> +			if (!is_null)
> +				pte |= is_vram ? xe_walk->default_vram_pte :
> +					xe_walk->default_system_pte;
>   
> -		/*
> -		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> -		 * this device *requires* 64K PTE size for VRAM, fail.
> -		 */
> -		if (level == 0 && !xe_parent->is_compact) {
> -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> -				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> -				pte |= XE_PTE_PS64;
> -			} else if (XE_WARN_ON(xe_walk->needs_64K && is_vram)) {
> -				return -EINVAL;
> +			/*
> +			 * Set the XE_PTE_PS64 hint if possible, otherwise if
> +			 * this device *requires* 64K PTE size for VRAM, fail.
> +			 */
> +			if (level == 0 && !xe_parent->is_compact) {
> +				if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> +					xe_walk->vma->gpuva.flags |=
> +							XE_VMA_PTE_64K;
> +					pte |= XE_PTE_PS64;
> +				} else if (XE_WARN_ON(xe_walk->needs_64K &&
> +					   is_vram)) {
> +					return -EINVAL;
> +				}
>   			}
>   		}
>   
> @@ -549,7 +563,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   		if (unlikely(ret))
>   			return ret;
>   
> -		if (!is_null)
> +		if (!is_null && !xe_walk->clear_pt)
>   			xe_res_next(curs, next - addr);
>   		xe_walk->va_curs_start = next;
>   		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -659,6 +673,7 @@ static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
>    * @entries: Storage for the update entries used for connecting the tree to
>    * the main tree at commit time.
>    * @num_entries: On output contains the number of @entries used.
> + * @clear_pt: Clear the page table entries.
>    *
>    * This function builds a disconnected page-table tree for a given address
>    * range. The tree is connected to the main vm tree for the gpu using
> @@ -672,7 +687,8 @@ static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
>   static int
>   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		 struct xe_svm_range *range,
> -		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		 struct xe_vm_pgtable_update *entries,
> +		 u32 *num_entries, bool clear_pt)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
>   	struct xe_bo *bo = xe_vma_bo(vma);
> @@ -692,6 +708,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   			xe_vma_start(vma),
>   		.vma = vma,
>   		.wupd.entries = entries,
> +		.clear_pt = clear_pt,
>   	};
>   	struct xe_pt *pt = vm->pt_root[tile->id];
>   	int ret;
> @@ -720,6 +737,9 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   	}
>   
>   	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
> +	if (clear_pt)
> +		goto walk_pt;
> +
>   	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>   		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
>   		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> @@ -745,6 +765,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		curs.size = xe_vma_size(vma);
>   	}
>   
> +walk_pt:
>   	ret = xe_pt_walk_range(&pt->base, pt->level,
>   			       range ? range->base.itree.start : xe_vma_start(vma),
>   			       range ? range->base.itree.last + 1 : xe_vma_end(vma),
> @@ -1109,12 +1130,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
>   static int
>   xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		   struct xe_svm_range *range,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		   struct xe_vm_pgtable_update *entries,
> +		   u32 *num_entries, bool invalidate_on_bind)
>   {
>   	int err;
>   
>   	*num_entries = 0;
> -	err = xe_pt_stage_bind(tile, vma, range, entries, num_entries);
> +	err = xe_pt_stage_bind(tile, vma, range, entries, num_entries,
> +			       invalidate_on_bind);
>   	if (!err)
>   		xe_tile_assert(tile, *num_entries);
>   
> @@ -1799,7 +1822,7 @@ static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
>   
>   static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>   			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			   struct xe_vma *vma)
> +			   struct xe_vma *vma, bool invalidate_on_bind)
>   {
>   	u32 current_op = pt_update_ops->current_op;
>   	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> @@ -1821,7 +1844,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>   		return err;
>   
>   	err = xe_pt_prepare_bind(tile, vma, NULL, pt_op->entries,
> -				 &pt_op->num_entries);
> +				 &pt_op->num_entries, invalidate_on_bind);
>   	if (!err) {
>   		xe_tile_assert(tile, pt_op->num_entries <=
>   			       ARRAY_SIZE(pt_op->entries));
> @@ -1843,11 +1866,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>   		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
>   		 * PTE is already cached in the TLB so it needs to be invalidated.
>   		 * On !LR VMs this is done in the ring ops preceding a batch, but on
> -		 * non-faulting LR, in particular on user-space batch buffer chaining,
> -		 * it needs to be done here.
> +		 * LR, in particular on user-space batch buffer chaining, it needs to
> +		 * be done here.
>   		 */
>   		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> -		     xe_vm_in_preempt_fence_mode(vm)))
> +		     xe_vm_in_lr_mode(vm)))
>   			pt_update_ops->needs_invalidation = true;
>   		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
>   			/* We bump also if batch_invalidate_tlb is true */
> @@ -1883,7 +1906,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
>   	pt_op->rebind = BIT(tile->id) & range->tile_present;
>   
>   	err = xe_pt_prepare_bind(tile, vma, range, pt_op->entries,
> -				 &pt_op->num_entries);
> +				 &pt_op->num_entries, false);
>   	if (!err) {
>   		xe_tile_assert(tile, pt_op->num_entries <=
>   			       ARRAY_SIZE(pt_op->entries));
> @@ -1995,11 +2018,13 @@ static int op_prepare(struct xe_vm *vm,
>   
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
> -		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
> +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm) &&
> +		    !op->map.invalidate_on_bind) ||
>   		    op->map.is_cpu_addr_mirror)

seems to be alignment issue here.

>   			break;
>   
> -		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
> +		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
> +				      op->map.invalidate_on_bind);
>   		pt_update_ops->wait_vm_kernel = true;
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
> @@ -2013,12 +2038,12 @@ static int op_prepare(struct xe_vm *vm,
>   
>   		if (!err && op->remap.prev) {
>   			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.prev);
> +					      op->remap.prev, false);
>   			pt_update_ops->wait_vm_bookkeep = true;
>   		}
>   		if (!err && op->remap.next) {
>   			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.next);
> +					      op->remap.next, false);
>   			pt_update_ops->wait_vm_bookkeep = true;
>   		}
>   		break;
> @@ -2040,7 +2065,7 @@ static int op_prepare(struct xe_vm *vm,
>   		if (xe_vma_is_cpu_addr_mirror(vma))
>   			break;
>   
> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
> +		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>   		pt_update_ops->wait_vm_kernel = true;
>   		break;
>   	}
> @@ -2123,7 +2148,7 @@ ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
>   static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			   struct xe_vm_pgtable_update_ops *pt_update_ops,
>   			   struct xe_vma *vma, struct dma_fence *fence,
> -			   struct dma_fence *fence2)
> +			   struct dma_fence *fence2, bool invalidate_on_bind)
>   {
>   	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
>   
> @@ -2140,6 +2165,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   	}
>   	vma->tile_present |= BIT(tile->id);
>   	vma->tile_staged &= ~BIT(tile->id);
> +	if (invalidate_on_bind)
> +		vma->tile_invalidated |= BIT(tile->id);
>   	if (xe_vma_is_userptr(vma)) {
>   		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>   		to_userptr_vma(vma)->userptr.initial_bind = true;
> @@ -2201,7 +2228,7 @@ static void op_commit(struct xe_vm *vm,
>   			break;
>   
>   		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> -			       fence2);
> +			       fence2, op->map.invalidate_on_bind);
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
>   	{
> @@ -2214,10 +2241,10 @@ static void op_commit(struct xe_vm *vm,
>   
>   		if (op->remap.prev)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> -				       fence, fence2);
> +				       fence, fence2, false);
>   		if (op->remap.next)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> -				       fence, fence2);
> +				       fence, fence2, false);
>   		break;
>   	}
>   	case DRM_GPUVA_OP_UNMAP:
> @@ -2235,7 +2262,7 @@ static void op_commit(struct xe_vm *vm,
>   
>   		if (!xe_vma_is_cpu_addr_mirror(vma))
>   			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
> -				       fence2);
> +				       fence2, false);
>   		break;
>   	}
>   	case DRM_GPUVA_OP_DRIVER:
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 864266e38aa7..aa70076e9218 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2201,6 +2201,20 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>   }
>   #endif
>   
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	return true;
> +}
> +
>   /*
>    * Create operations list from IOCTL arguments, setup operations fields so parse
>    * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -2273,6 +2287,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>   			op->map.pat_index = pat_index;
> +			op->map.invalidate_on_bind =
> +				__xe_vm_needs_clear_scratch_pages(vm, flags);
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>   			op->prefetch.region = prefetch_region;
>   		}
> @@ -2472,8 +2488,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   				return PTR_ERR(vma);
>   
>   			op->map.vma = vma;
> -			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
> -			    !op->map.is_cpu_addr_mirror)
> +			if (((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
> +			    !op->map.is_cpu_addr_mirror) ||
> +			    op->map.invalidate_on_bind)
>   				xe_vma_ops_incr_pt_update_ops(vops,
>   							      op->tile_mask);
>   			break;
> @@ -2726,9 +2743,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>   
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
> -		err = vma_lock_and_validate(exec, op->map.vma,
> -					    !xe_vm_in_fault_mode(vm) ||
> -					    op->map.immediate);
> +		if (!op->map.invalidate_on_bind)
> +			err = vma_lock_and_validate(exec, op->map.vma,
> +						    !xe_vm_in_fault_mode(vm) ||
> +						    op->map.immediate);
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
>   		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 84fa41b9fa20..1662604c4486 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -330,6 +330,8 @@ struct xe_vma_op_map {
>   	bool is_cpu_addr_mirror;
>   	/** @dumpable: whether BO is dumped on GPU hang */
>   	bool dumpable;
> +	/** @invalidate: invalidate the VMA before bind */
> +	bool invalidate_on_bind;

Patch in itself looks good to me with above nits. Will fix while pushing.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	/** @pat_index: The pat index to use for this operation. */
>   	u16 pat_index;
>   };

