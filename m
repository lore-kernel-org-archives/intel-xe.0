Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3BF606A33A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X7JzqK0F;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d6KL6i6w
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12E310E0FE;
	Mon, 23 Nov 2026 08:17:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D37510E0FE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795421837; x=1826957837;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jf67iaFZwsY/L40DY6NnnQ7CGsbFGYgoIvk+49W/xk0=;
 b=X7JzqK0FS4UxMv/AQLAyr7wlHTb6VQHm0Sm+lnlzVCORfXGbq6xjeuXF
 NZEuBw5bX67kyKYE9aw8BDkO4NfvYsaAmDlekDT0G80xaN//1D02moKrj
 gKENWPGkOzY9eB8KiLPeqaCAdbpi/MFrmHRLB86FS5wZSMNpdOMQTj9LZ
 mYWpbj1iIl5zEpfEk+L9V2Vtzv5suvd3QtiTKIEmFaF8afgSc8SAWf7k0
 QLwmtLkqOVFH9DupLqOHwiYgs/C9MX0LKQ1FYtJhXbSyhLwSPX0CgL0FW
 5sa60EH5d6PcUqP1OOrHUQAUAB4HtheEd6R+301hW4RH8Rxp7QGLhbjBs A==;
X-CSE-ConnectionGUID: Qb3TztFaQ1m2wEOFvtKIUg==
X-CSE-MsgGUID: eBC5EXnESP6dIq8FqvEhow==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4208471"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4208471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:17:17 -0800
X-CSE-ConnectionGUID: 7X7tk6qdQtyhn1neu/J1hg==
X-CSE-MsgGUID: I4E6JY15QoCWycRgXJrSZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11324023"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:17:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 00:17:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 00:17:16 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 00:17:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZPwu7AOY4rPttSm/Xuxpn1DeGXn3bzVQu/nZ9F731dDzUvSrUFEgYxJ9fgixd/uR51FKtR7KkSwnZoM4aP5DoCcUoPaO6kkobosHuqrkKh+FIaKxLk3t/t7QWfuJX8mIOG1d0t8MZ0LnO3E4HHcksKBGVjixLfepHzYwtWzL+fewfXZq2ndIgFHlNCW7dEmMwK4ICpIKuG2N5rsBdffRQDmzDsiWX3y25jAad/yzqfNZQyGMawGFZtpiR7X3X5hDvXPygr7HSmSNi/+NYJEpmbYU54nVKTkgtk1BlgtebMKmWsOrWjSbCzpQmAbqtd367R1n9xfsLb5D+3ThCjRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCbwav1MyhZCqHKMu56znhqC6Hl2rQycWgxYe1yYUeE=;
 b=UcQnjzJeI7E0h6OLH7c3lrn6lpLE9nTRMOfyuXMMFDimkpWQI4HF9uqfFL/gLGZ3NbhuWwpHPe03i/QKGGobvjlpjWrYSxD9YSProqziGXKNbcb5ZKwhga21qjs5qe9bvjCZvZ4DTmL1YbkMXNKNkNQzjR/hs1R3V+PYTP2Ibh8GwJLo7cY40MG5sQ5htw9jIeiocmt/IR3WHh8SpfXYq5DPDcSyOcaUXyrUuTW00QIMose7lylokhczSvMir8sN3dVr6fsEcS/JGdYMlVEU35Sq0jBM8uBwy5pByLCIK6xBPX9/twVXMa/r5DBr7pNFSupr6Pj2P7e0kLZ7iBNjiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCbwav1MyhZCqHKMu56znhqC6Hl2rQycWgxYe1yYUeE=;
 b=d6KL6i6w8rAjRfzDG3NXBOeTvj3O73pIOXXAAz9njqrVT1ait0+kJJrkNTIL4C7x+jpBPjJglkV8OxqQJa9BJWCdJsM74U0Z4qP+dxlkX7q9w9kcQrB55yX0JFV6opdfGjT3ejKa93sK1tHJIzc03HDuexu5/VflhQvz7MNQqCI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Mon, 23 Nov 2026 08:17:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 08:17:13 +0000
Message-ID: <7ff7a5d5-a29f-4e9c-bdad-64023cbac3a4@intel.com>
Date: Mon, 23 Nov 2026 13:47:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Distinguish between detailed and aggregate
 counters
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261102090424.987843-1-raag.jadav@intel.com>
 <b49b7767-155c-4f85-9680-0e9500f3e8ee@intel.com>
 <awPzSlWM4ZiZtGBN@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <awPzSlWM4ZiZtGBN@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0311.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: a97a79b4-7fbc-4cca-9e4a-08df493a2d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|261009221227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1CV8xPv1lRj7jGJDfxKwrjUXQjRQjm5YSLULEOUQUXwCFjFFL9ZKJKiNOKAqZbDWsxoaFsmt63tbGhLRFjNVjO+Gem+nw2Y/j0KOT850NrFVbr6AHKwYZ13Ij3vZvdTmzZNz82P6QGTETTVCeDaKZzEKFU1v6BkVtF75xB/zlvkO3imZ47F+fF/N36Av6fSGA9B3AYmfpkVP874aUrulKNq8C3aAekHpwe1yUgnNJCcDlCxHJppe2uet8Kfh013w4QPTEMIGrgomgdBrEy+ONQ5cMoVNSuEkaUpUPiScQPujIH6aan0qSw2/HFgjzWBg72cSGyTHqnhV+U+4d27OzDOUev8cb4pRqfM6dsiaQaj7ecxhhuY/M8ymYYL464kXjanSlC+dwHtqtDs9JuR7AsPPgD52jiBtNJk5lL07xIaAGB6h91AVnR5tgXC6KyYO7689klJOAdqXt16CCFA9odHTrzMYj4hk5fxxpSqof1Jd+zHDRSHhUep6G9UrZgM+pkZ8dqIgbQJwaLBICklvcFQW9kl7r/DDk1Tg3CDEetWuxhil3fTGvQ6xJYl/+8tNeL1wqy5gYqFqah3FfMVIOOjSZnb0lQoqulQFWZDJsnOYGuW/6FVI+0NlEnJC+js3OHbBSrQb6Z+hENR5YqNacmORVEKWgW5Wq8n7S16IxCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(261009221227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K28vWnF1aC82VUhjRjZ6Uk1TUGpDRUh1ZGlrRGNkQ3B0RTIyTjhTZGc0NzAy?=
 =?utf-8?B?bFhZMk5weGpxL1VpYkU2Um41QXl4VVQ2UFo1dE12REdzSC84ZTFjaDh0NTRx?=
 =?utf-8?B?WG45NDlNTUVYdk5ZN3hFTXJpOHJQeXZoVy9IZjhiZTAxRnI4dG9WT3N5WjRh?=
 =?utf-8?B?N0hpdjBQbE5yQ24wRTBVa1cxMWt3aktpc1lBZlNWL1Z5eG5XSHVWdkJmWk5L?=
 =?utf-8?B?aEtpZmVoZmpHUDVVbUQ5SlR6dFplbEVXOVlEdFNnbzZzeGdzT213THJhVXBR?=
 =?utf-8?B?MGhQc0pIMnhVL1ZwMzJ3L3krN0JwSFowbzFSV2FFMjhVSzR6R2JsRkZxeU1n?=
 =?utf-8?B?WWdOdGM3UXVISk9BM3RmbS9YMm1La2srRVRPWXJGY2NXZmhGbUNZSlIyMGVz?=
 =?utf-8?B?VHRaOVppWUEyYmN3REoxdUtVbGdoYzNWSXpVTjJOQUl4dWFQbHlVOTFWNVVj?=
 =?utf-8?B?a2FsSjZZeXY1eW1BTURaVHNWQnVodk1PV0VCRmROMk9mR2Y1MFBXZ25keHVD?=
 =?utf-8?B?cUJBbjFQNm0zY29JWE5ZQmQzbnJhQWVpenlRa1RhZ0tWNUR6a0ZXU1BHVFNp?=
 =?utf-8?B?ckN6ZzJVc0IvWnE1RkcxZitJOHdyejRpN2xZT3BBOGxpQkwyQnNYT1hBK3RB?=
 =?utf-8?B?VjEwSy91TDBkeTBxalNJREJ4RWp2ZWVLUkwyZDRBRXhYTkQzeVVpa1IzcmJk?=
 =?utf-8?B?Y3ppaXJoM0tBemFEY0tFTzRUc05VRGlMNVZrQmxTVUdleWlzbGNDMy9FQzc5?=
 =?utf-8?B?cmh5amZyNUo2MWsxYWx5eTN4UGc4SW11ZnI5VXZ4bG9qT2ZjckxCY1NOWFBQ?=
 =?utf-8?B?eWxiSE9vVWQrd1FLd2ZSa2NjNHR2UWhya1lrUGxGVlg1NHNBQ2djeEQzUHpa?=
 =?utf-8?B?NDB0MlN1L1FXaEVsb3JFM3RCbGNWZEMyNktuT08zOWNtUEthT2tHOXZqbDZG?=
 =?utf-8?B?QVBKaXJ0V1FPMHc0Y2QrYVFPd3lVZGRPcWI4alZ4V0tCVG5PWU9XZXE4Q05M?=
 =?utf-8?B?Z2ExcG92YTJTV2hEc09YWnZLeG81N0dqajMvK2FITEcreWROczVWNDV6N0V5?=
 =?utf-8?B?eEZMbmw5dG1sVWNYRzNvQ2tIUDF4dGxta3F0d3l2ZDcyRkprYTFxT1pyZmNv?=
 =?utf-8?B?R0Y3OTRIL3pzT0tYdko1bUovQ0hLa2ZCeVh0T2ZhemJPUXdmeUJhbjUxR2R3?=
 =?utf-8?B?cENLYzhaSzhXMXV4WGllaHpzV3ZFMjlieVFaMWViUGQxNDdtbDhORk9QTTcv?=
 =?utf-8?B?NDYvZkw0Y3VwSjB3UmFHdkZFNGQ3aUJLZXJiaWZGT2tpMGcxSFBWK0lFeVBV?=
 =?utf-8?B?QmJ5S1Y1cTlJUVVrdjZrenNKbXRPWnFuRm92c2o2TllOZVdRVDlYMkNqNmRt?=
 =?utf-8?B?YjI0MStPVEFYYUNpbU1XMW1rWW9pNkRBUlBveTdhcEQ2S0E4ZTg1alRJZ01v?=
 =?utf-8?B?dkVQdjJzeit3d01PQ3hzMVI3M3dDUmRHdzN5WEV4YW5Wc1dkMk83ckNibWdI?=
 =?utf-8?B?cFVOQ3o3Mkl5UGYzeThGdUs5S1MzTGUzUzNIdFRkT1RhTzVVdytQQTFKQUFG?=
 =?utf-8?B?bjBuUlcyOFRLNUthT2ExVlNUYkJZSU5VbXNFTUk0eUMyTnlMbEp5VXNOMldN?=
 =?utf-8?B?VUJQS3lHNVVab2lpa0RDRjNsK1NZbDdxckkvOXhVbXF3bHV6bVJLMGxMb2tD?=
 =?utf-8?B?QXJ5SWhoK2pza01DNERRRW1EZ3RzVi9HT2NyWFhXQ0pJMTA1bWhNZUptSlRU?=
 =?utf-8?B?aXh6NmZFRDRoQi9ZMm5GQkY0T01IZFZBd1ZXRVlOb0RLdUxOZEsvRVFWTTE3?=
 =?utf-8?B?czl1UWxDN0FUY3BPWlhQQ2Vaa2tvcDE5MWtWb1V0elJ5UFBST3lvUjY5T1hT?=
 =?utf-8?B?ajdTU3FPaVpMQkxDc21ubmlhSXM4eTgyRU13NWY4ZzlKSUVpdkFWQUtqUFJu?=
 =?utf-8?B?TExnUGIvWGQ4ZzdOZ2k3Y051ekpNL2k4VUZkUm5WTHVGVUwrNllyZDkxSXVY?=
 =?utf-8?B?MzNrZWllK01SU3ZyU0hVempHQ2JkakRQWjlGNEwwclpFSFVEUFFZVGxKRlQ1?=
 =?utf-8?B?cXdZQUJEV01jTjhmWG1DYVNqdVhHRDRZU2dqbmhsZ3F3L1E2b1BadE93R3ZR?=
 =?utf-8?B?OTFBL1dxNjArMWtLd1ZFSG84dGlaeXB1WTJMNFVwK3FjS2VkLzdRWHN5VFM2?=
 =?utf-8?B?Mk9FQ0J2NnFtdURIRkt1ZFNPci9rckg1NWwxTWVRd2JRR2ZleEFZMkxMRTdq?=
 =?utf-8?B?cHRHYmtleVg2bVN3UjZ5L2w0RHZ6YTlMU1dFUTdzNlpGNTNlcFdmWWVuN1Mx?=
 =?utf-8?B?VEZwaHVxcENUYUtEaUkwdjF5T3ZiVmljaDFHVjdLTU0wcTJKQXN5Zz09?=
X-Exchange-RoutingPolicyChecked: IBWw8gK/siOHueBwZkE9A0rpzoamlYBalYsZ0gO94HS+j939jH5nW9JZ+GBpIVBhu7gUM03NOvu81UzmY7PI7tpyEwE98OKA0v7229BDDg6CoPHP4GG41V3PfC/ggc8IBje2s4iVxX0xYJlgI4zK0rTgjQSnbImmiRbsBbw3fVEB5Je6V5I1xp7SR1fBh6EsEdyPPO6xwf47vBP8EaPx+RBoWdEw7NT51c6hc9v9bL8DC+W5xVoTDuREQJ50unAPRrS4UxHvfFx5oTUEqjzr7w8tkM21Dfk5BPjdtsyvPriuX5i+V2IPM5Cr1Omj4/FFRX2iQub0e3Y0vUNMWE+m7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a97a79b4-7fbc-4cca-9e4a-08df493a2d79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:17:13.5466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzN5GPJR87PEGzt3FzcUVIXZKYSfFdRUl2M21atM1HSA0McZqG0i5vd9lkHDrk4MkGFzoQ6riLhWd3+86TodQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-11-2026 13:33, Raag Jadav wrote:
> On Mon, Nov 23, 2026 at 12:16:24PM +0530, Tauro, Riana wrote:
>> On 02-11-2026 14:34, Raag Jadav wrote:
>>> xe_ras_get_counter_response() only logs counter value, severity and
>>> component. Also log the type of counter for easier debugging.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_ras.c | 9 +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 2c01c183d02b..381ea19a8b4a 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -772,7 +772,9 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
>>>    {
>>>    	struct xe_ras_get_counter_request request = {0};
>>>    	struct xe_sysctrl_mailbox_command command = {0};
>>> +	const struct xe_ras_error_product product = {0};
>>>    	struct xe_ras_error_common *common;
>>> +	bool detailed;
>>>    	size_t rlen;
>>>    	int ret;
>>> @@ -798,8 +800,11 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
>>>    	common = &response->counter.common;
>>> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
>>> -	       comp_to_str(common->component), sev_to_str(common->severity));
>>> +	BUILD_BUG_ON(sizeof(*counter) != sizeof(counter->common) + sizeof(counter->product));
>> Why do we need this? This is already common+product and passed by caller.
> Can you guarantee that counter layout will remain unchanged forever?

That would be applicable for all structs and fields.  This is not 
checking response. Seems unnecessary.

Thanks
Riana

>
> Raag
>
>>> +	detailed = memcmp(&response->counter.product, &product, sizeof(product));
>>> +
>>> +	xe_dbg(xe, "[RAS]: get %s counter %u for %s %s\n", detailed ? "detailed" : "aggregate",
>>> +	       response->value, comp_to_str(common->component), sev_to_str(common->severity));
>>>    	return 0;
>>>    }
