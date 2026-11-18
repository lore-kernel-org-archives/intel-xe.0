Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8393606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FAj19hvR;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UWxyLTNP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1E110E1CD;
	Wed, 18 Nov 2026 12:36:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E00510FB6B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795005360; x=1826541360;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3QUpGxEj8h97r3jvhQZ/tKPfjscTK/eZ49DS7OUTHhE=;
 b=FAj19hvRIvVGus4G3ob1GcWryuTAdfXYkQKwHKEVnEHyjLg/Qum2+YaX
 ll7mXIxY3NvPX9usnUpWrr8sHd3SuVpugFU3lsbGWqLncQ+RKUyCg0BpM
 AiwSNtWV6rOeQqDJgVqHNhynUTXA64GaHLJQ1sfFMVCgu2X4NBuqzgOpC
 Uds5EybaAtum2WqI5Yf+brTwSQZCuQspG3IojZFuVWgIouqaeqHy1XTls
 RrN/E7Zdn193Ew1mpxzJIW/Q5AMOn2CHeslItEVhLSkiHH3DB1iitmoCM
 yGADtci+bcPZaWcVlx9p6BQ41SDLqktX+LKPGQyUy5tpiGq89XI5+D7H/ g==;
X-CSE-ConnectionGUID: 7pz+FT5AQ8Od1nSOk8jFZA==
X-CSE-MsgGUID: d7Z9jdHBQrCxJvLFp6dq2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3730101"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3730101"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:35:50 -0800
X-CSE-ConnectionGUID: M/x0sMIgQeiXcjd4e0PaFg==
X-CSE-MsgGUID: J9uuJPtpQsSxp6O7XaZvVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10150370"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:35:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 04:35:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 04:35:49 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 04:35:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNpIyOn8cryNOZgzp3VTPppCUzQaU2eGKw/CezJj6qwL3UUlcO0zdyTPTVtXI9Q22fKL5ii/QyEreRdnH7NXuKsC16cWK6BINkd00xBeKQDXWZl+H5oznQ8HW5sccpH/a3QW7N9qcAVXHw9QNl12ovixm7DQV8WmUjIN2tpUIpGgWreCeS0k8ZPpGW482040wvcIAlyG7rCF9LiCj1uMEk4ocGuV+EB5PzlSpuF6no65Iu2oc/v6umGjJWQkaPiZDXY8cuva1DB3ToNHnKMlU337e2DIBLnQ0zd2+u+2fVcGYk+kUUmJPENd27rVdOK8VA2kPVekxz/vxBd/Zbt4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBmI6SOL16AaC5Ddwh8qAW1JO8zqD/0utVPBEfRLPgU=;
 b=M7Psz/xeYVAAuDCg8lxPqCd0J6mHKNJUxY98+G8PYD/sz1QbTTvyZU70h9Yedk9qLu44MJYtCc4MD7OWks9zz1uNIHugasXpP+son24MdZqJ0xpakKUPnyOT028ZxTUYaOVFRgDndjo7EN0DuNLuwYOP5w6F+VTKXCpWG2VZPVbeUSFDji38VVt/b8rn3ldP/gV69cK618QbwFvXaZtRq0uDkh2Iira+IuQhr3c3osgEyLPanF5hLsSTSSwfa7buj6iSc2deQ6+WpMUdRH0J9R3erOO22YrLOz59z2jemLDRbuQdqEc52ao7UV/bVZav2S+YxEc3LDhd94jZfVzcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBmI6SOL16AaC5Ddwh8qAW1JO8zqD/0utVPBEfRLPgU=;
 b=UWxyLTNP+sCC5KIorfK0ZfTnrakb2o93Yu+1uMDALHqcGsUEldid1DC37t4UvNfzZ6JMcFWeQEVZkHyWHExiZhN6aqTxYkI06QFSUa9ZQWPCHyVN8s64aQoGwSJByln5zCcFI86j/9Lf9ucM066QC5HbRqUjNtV+7kTX7+xqt/8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 12:35:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 12:35:36 +0000
Message-ID: <3e08a072-51f4-43b4-acf1-6f5144bc9528@intel.com>
Date: Wed, 18 Nov 2026 18:05:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/drm_ras: Protect against unplugged or wedged
 device
To: Raag Jadav <raag.jadav@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261116085343.1972825-1-raag.jadav@intel.com>
 <85d0eb950789c3d413fb91dc02b9c53751207c57.camel@intel.com>
 <avwVcXpCWxo2xMgF@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avwVcXpCWxo2xMgF@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f192c6-7482-42c9-dfbc-08df457071c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261028144727099003|261022105027099003|261022113327099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|11063799006|261026121527099003|4143699003|56012099006|10067099003|18002099003|18092099006|22082099003|6133799003|261009223027099003|10086099003;
X-Microsoft-Antispam-Message-Info: z68uEHblG96eIFhgjupAddFHhVPHXXA+AEjeqpPubd26dxw+ZEyEM0fBKgSagmV/Essi0BOKw1naGoOvtKiP72Vqbn7p8iAnTGQwi5jYHnI2doaBNb5Xv8dFUaKwS+h5VIMWnq30SUMex9By0kMy4g3eZUE7/OkOR1cZeOBTZAG7ImzGBK7GKldXWvAzXn7nfXHsobhOQOEQBN/+UrA9LBt1m5V2Xc9YXMXFt8q8BatnD4d/Ag6oC37NmCmIsdVWJi+ByU0N+QY0Co8FYADOmlZTrN2wMrwP1Jg6glgpiz+OKGBpg7NUpLPcWRZkrLWh4uLfd2T/wY9OkTuNwzb8lgU5LxrzKvYaf4rGAhhy5KZ8cjoxjhuVFiWxI3bEU0N5Qd0qAOzNXrtDlot1BMtM5Uf7X7w3BPf+JWbtnaxtGAhzTh8gpJsDZtQLnoKzkKS4MPEhCP7TH5ekr2TVwsfyos5trZYVujJ09YpHeEIsWDOvR5G411tzSk4t/4Im/taoZ9YCr/qFKZY6c0zXhctzJM/PQVHYhWrmU6oX/TKIpKhuahIQJtY5QkCtJw/o8qbVyJMlkyF6CoASkuNHU3eFzMbhjBY1VjlC+BbeD2dB9BeTdT0/1Ce3GQ+Fr1KWitvr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261028144727099003)(261022105027099003)(261022113327099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(11063799006)(261026121527099003)(4143699003)(56012099006)(10067099003)(18002099003)(18092099006)(22082099003)(6133799003)(261009223027099003)(10086099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2Uva0cxSnRRL0ZwRDNSY0NnQzAvMUgxUUFhRXZaWUlJVVV4L2s4RXptUDZW?=
 =?utf-8?B?TXhQelZMak9xYlcwc0hUL2lPM3daSThxOWNVaC8wRDYyVEc5Z3h6UWp0RjJC?=
 =?utf-8?B?WkRESWY3dUtPdDdFSEdHZXlHS0h3Q1daSDAzRHhoOXB4NWpOaGY4V1VZZ2NR?=
 =?utf-8?B?SjYvak9iQ2JJYmlXMGR4SnRYNHRSWW5TcVdIMzFNR3VWdTZSZ0dGRmVMTW9z?=
 =?utf-8?B?NXFMZU1BbW1JTDZNRWZRdWpCaHhtZW5WdktEdE1kNjVWbldiQkpPQnlURXoz?=
 =?utf-8?B?WTluMkdOY20rSG44VDlDMG5oeWl3bnpkbFF6K21tNGVERy8xOTRaQzhhY1I5?=
 =?utf-8?B?SzBhOEgyTHh0Y1NXaFlTMHA0TDNyNEFTdHdKVDdmWmdQWS9MN3JBbktBdWY1?=
 =?utf-8?B?eHFiZmZSbXJoQTY0V0pxeUlmb05lWGlsd2ZQK0NyUlYrUHh5ZzYxdnRSbDBN?=
 =?utf-8?B?WXFGR3ptNTZERlVtdDJLYTB6MEcrN21PcDhYY0JxZkxHTFB4TUNCMHNuekEv?=
 =?utf-8?B?cU8yY083M0dSdDZuenJpdXRLZXRkNkpxeWh2ODN0S2tZOGlqT0JJV2xNVlFa?=
 =?utf-8?B?OCtKWURzTTc5eGNiczlWWGFoangzRFhxUVpuNHNva2VUNnFtaWp0aFVlMVRr?=
 =?utf-8?B?N1FrNlp1eUNqdithQk00N2hiYndhSm9Ba0svNzI0N1c4bkpMNDFHb2tFalBo?=
 =?utf-8?B?ODhiMDJLb28zaFkyTXVENSs5Y1RZa24wa1pEME9uRzNOdjZVSkJVTFd5MU1r?=
 =?utf-8?B?OFIrS0R5bC93ZUVEbk1ka2ltUEpvRDF3Tzh2UThzOE9lZUhzNUdhRUpiOGVB?=
 =?utf-8?B?OGlFOFFieCt3YnF4eS9Mc1RRS1RwWm1mbmY2d2Q0ejVEVHZBOFZ2dVpub3lw?=
 =?utf-8?B?eWQyVS9RSW1KdTA3K1duT3hrSmsxLytNb2dIbG5vZWJZWUZ6aEVQVDNLQW1m?=
 =?utf-8?B?K2xDTGRSbVl0enVQcVJSNk9DeUUxRHJvM0NyMkNoRGhTWlFzbWZRRDlzT2ZJ?=
 =?utf-8?B?cUdPejkrSWIrYjBSTThnTWRiL1VDeVZFalJrNFVaVUd5djhOSzN0bEt0NmZq?=
 =?utf-8?B?TUpIUVBsbzBzSnkwSlo5d3k3elJyZGVGT1daU1A1Tk9aNEZMSFlOQTJRQ3Nm?=
 =?utf-8?B?eWZRTEMwdWNvUUdPd1U3c2RsYzUvc2o0cXpZK0lBK3FnTWt1SldZOUtrVXVx?=
 =?utf-8?B?TFdWdXVwK1pIc3dkQ0s2SFRjWnFJbDR3RzRUYWZ4SzU3ZFAySFhHT2RwSW5y?=
 =?utf-8?B?amp4ZEVQQmZUaHdOZXBYKzludjJCZUt0SFREZGVYOHhjMld2RzQxUEt2elJT?=
 =?utf-8?B?RS8vNGtobCszZmE2bkNYakIxdTIwd0FNZGhJSnJOSlBaZjRKejRWK21iUWFR?=
 =?utf-8?B?QnZGVU9PSC9lREdaTW44SG5oQ2Y1b3JNUVFmUG9DZzkzQ0IrNnRrWVFCbk45?=
 =?utf-8?B?UytMc0RERkdHNDlEZnNjQUlsSkttNHFYWnU3RDF1Rllnd2ZrSi82am02Z0pY?=
 =?utf-8?B?MzJHNEczVnBmdGJoSjdzRzFTWVA5Zm8rQmNvRUsyUVZjN2Npb1g0dHlPWFFN?=
 =?utf-8?B?WTVZd2RTWTZFN0c3NXBxeFhJekZlZG9qK1dxTUJXTnEzWTkvS1JwRUZqMlNx?=
 =?utf-8?B?L0haUUFWVlJTTDV5RHRPeDlHUmVpbStOZk9yRTJJK3dxQ1dYbFIyNW0vaEEw?=
 =?utf-8?B?aTZHKzgzUmw5SWhRK3RQaE16OTRnZWNXZ2cyL1FMZG5UYkJDa3c1OExzM2ht?=
 =?utf-8?B?NTNRYms5K2lEMzIzdEx4NnJ1aDF1NzF2M3hDb0hrWHl2OFpRR3BLbUFxMWo3?=
 =?utf-8?B?TGVVMHlQaVJKcFN5ZXcxWnl4VFRIS0JGZ2MvaGRmbTJnTEQ3T3FvK2ZHR1F3?=
 =?utf-8?B?dkxhZ2YwMktXVHBjNEhqNjgrQ3lJTTdOenRTVlNXV2djejFaRmtvd0NsMlJV?=
 =?utf-8?B?OE1IaE9NcjMybDNLZFg5RTBaTno0UzJ1RTdiUjZ2dVBRNHFublR1bnFWZHM4?=
 =?utf-8?B?T2FFazVRdjlsSzhrdWVrZDZobG1IZExrL3hBeEhZSVYwb3J5Q3B3SXZCTDlH?=
 =?utf-8?B?WFJPcC96Z3dXVk8zNWlwdW9GN1pnWkRheVBEdnRhMXUzYUJQQXBHV3VTRFhR?=
 =?utf-8?B?aitGRnpYS1NhZXYzRGxvTk0xeVZkdnJNWElxSFFURDBMV01wZ1Bja3NadzJU?=
 =?utf-8?B?U3ljT2hFbnFBb085Rnh4aGluVGJWOXVUVkxaUXFLbFlaVnh0OEpDQjdkL01K?=
 =?utf-8?B?TCtZclprRkdzMTN0bGVBRFVCblpJeFQ5ekVSd25rOGRZODh5Q2ZCSXpBMno1?=
 =?utf-8?B?OXBuczg4MGhJUDRSOUlOODN3YlF4TXdRZUxWT3BRdEN2TGd0WUxIUT09?=
X-Exchange-RoutingPolicyChecked: 1DMGfAZOYzvzuhuEg5ou2sh19Wx9/qChbWGaVmCkfMUQ5Ja6cO0I/7SuODI+IN2HiSnseO0CaFotR6Ij3QAnxibPjNufHuIpC2Ugm1j1bWhnVxUDdNGW+MORm9qv6sDKwPE1EdiLhOV8ypJw1PkKk4z42GLEIag9hHp+KmnF+I0nhSlRPNJRv8eCSvdJqKliHoxJpJohQWVKCw1McDOqTKkn74KP8I5/WwZV3Rn9LcSgGGIddPsHb6suwQ96oArbKPGPOsw7jgLRtbvtYoicQwL2g12psa8ICE3ua/XLj+33v+a0nrd38lQcivpo9ebWF9fVUl3aen48XlBaW7uVqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f192c6-7482-42c9-dfbc-08df457071c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:35:36.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRgU0q4mxNbThSj9OsbTjYW8FPCJs7ANIkwbiaGi6TIDDf922hXZbeK90XqM9J+yIjghCgmW745ekaFlG4+oYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
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


On 17-11-2026 14:20, Raag Jadav wrote:
> On Tue, Nov 17, 2026 at 04:58:23AM +0530, Summers, Stuart wrote:
>> On Mon, 2026-11-16 at 14:23 +0530, Raag Jadav wrote:
>>> Xe driver exposes drm_ras counters to userspace through netlink
>>> interface,
>>> which the user can access during the device lifetime. But this should
>>> not
>>> be done in case of unplugged or wedged device. Protect against such
>>> cases.
>>>
>>> Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Hm.. I'm not fully convinced on the sashiko issue, particularly after
>> we have the get/put in this patch. I think we'll need some digging
>> there to see if that's really still a problem after this one gets
>> merged. Anyway as it called out, it's pre-existing.
>>
>> I agree with the changes here. Functionally looks correct and makes
>> sense to include the wedge here too.
>>
>> Should we have a test that injects an error after wedge with a netlink
>> hook enabled just to prove this works in CI?
> + Ravi and Riana for IGT, this sounds like good extension to our suite[1].
>
> [1] https://patchwork.freedesktop.org/series/171275/
>
>> Either way, for the kernel change:
>> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> Awesome.
>
> Raag
>
>>> ---
>>>   drivers/gpu/drm/xe/xe_drm_ras.c | 93 ++++++++++++++++++++++++-------
>>> --
>>>   1 file changed, 69 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c
>>> b/drivers/gpu/drm/xe/xe_drm_ras.c
>>> index 7554803aae11..c0c1acb84e89 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>>> @@ -5,6 +5,7 @@
>>>   
>>>   #include <linux/bitmap.h>
>>>   
>>> +#include <drm/drm_drv.h>
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/drm_print.h>
>>>   #include <drm/drm_ras.h>
>>> @@ -12,10 +13,33 @@
>>>   #include "xe_device_types.h"
>>>   #include "xe_drm_ras.h"
>>>   #include "xe_ras.h"
>>> +#include "xe_wedge.h"
>>>   
>>>   static const char * const error_components[] =
>>> DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>>>   static const char * const error_severity[] =
>>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>>   
>>> +static int drm_ras_counter_get(struct xe_device *xe, struct
>>> xe_drm_ras_counter *info,
>>> +                              u32 error_id, int *idx)
>>> +{
>>> +       if (xe_wedged(xe))
>>> +               return -ECANCELED;

Should we allow if wedged mode is set to 2 and it is in debug mode.
It would be useful to get counters in that mode.

Thanks
Riana

>>> +
>>> +       if (!info || !info[error_id].name)
>>> +               return -ENOENT;
>>> +
>>> +       /* Must be last */
>>> +       if (!drm_dev_enter(&xe->drm, idx))
>>> +               return -ENODEV;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void drm_ras_counter_put(int idx)
>>> +{
>>> +       /* Pair with drm_ras_counter_get() */
>>> +       drm_dev_exit(idx);
>>> +}
>>> +
>>>   static bool drm_ras_counter_is_valid(u32 severity, u32 component)
>>>   {
>>>          if (!in_range(severity, DRM_XE_RAS_ERR_SEV_CORRECTABLE,
>>> DRM_XE_RAS_ERR_SEV_MAX))
>>> @@ -33,19 +57,23 @@ static int query_error_counter(struct xe_device
>>> *xe,
>>>   {
>>>          struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>          struct xe_drm_ras_counter *info = ras->info[severity];
>>> +       int idx, ret;
>>>   
>>> -       if (!info || !info[error_id].name)
>>> -               return -ENOENT;
>>> -
>>> -       *name = info[error_id].name;
>>> +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
>>> +       if (ret)
>>> +               return ret;
>>>   
>>>          /* Fetch counter from system controller if supported */
>>>          if (xe->info.has_sysctrl)
>>> -               return xe_ras_get_counter(xe, severity, error_id,
>>> val);
>>> +               ret = xe_ras_get_counter(xe, severity, error_id,
>>> val);
>>> +       else
>>> +               *val = atomic_read(&info[error_id].counter);
>>>   
>>> -       *val = atomic_read(&info[error_id].counter);
>>> +       if (!ret)
>>> +               *name = info[error_id].name;
>>>   
>>> -       return 0;
>>> +       drm_ras_counter_put(idx);
>>> +       return ret;
>>>   }
>>>   
>>>   static int clear_error_counter(struct xe_device *xe,
>>> @@ -54,17 +82,20 @@ static int clear_error_counter(struct xe_device
>>> *xe,
>>>   {
>>>          struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>          struct xe_drm_ras_counter *info = ras->info[severity];
>>> +       int idx, ret;
>>>   
>>> -       if (!info || !info[error_id].name)
>>> -               return -ENOENT;
>>> +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
>>> +       if (ret)
>>> +               return ret;
>>>   
>>>          /* Clear counter from system controller if supported */
>>>          if (xe->info.has_sysctrl)
>>> -               return xe_ras_clear_counter(xe, severity, error_id);
>>> +               ret = xe_ras_clear_counter(xe, severity, error_id);
>>> +       else
>>> +               atomic_set(&info[error_id].counter, 0);
>>>   
>>> -       atomic_set(&info[error_id].counter, 0);
>>> -
>>> -       return 0;
>>> +       drm_ras_counter_put(idx);
>>> +       return ret;
>>>   }
>>>   
>>>   static int query_uncorrectable_error_counter(struct drm_ras_node
>>> *ep, u32 error_id,
>>> @@ -103,15 +134,21 @@ static int
>>> query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>>>          struct xe_device *xe = ep->priv;
>>>          struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>          struct xe_drm_ras_counter *info = ras-
>>>> info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>> -
>>> -       if (!info || !info[error_id].name)
>>> -               return -ENOENT;
>>> +       int idx, ret;
>>>   
>>>          if (!xe->info.has_sysctrl)
>>>                  return -EOPNOTSUPP;
>>>   
>>> -       *name = info[error_id].name;
>>> -       return xe_ras_get_threshold(xe,
>>> DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
>>> +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       ret = xe_ras_get_threshold(xe,
>>> DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
>>> +       if (!ret)
>>> +               *name = info[error_id].name;
>>> +
>>> +       drm_ras_counter_put(idx);
>>> +       return ret;
>>>   }
>>>   
>>>   static int set_correctable_error_threshold(struct drm_ras_node *ep,
>>> u32 error_id, u32 threshold)
>>> @@ -119,14 +156,19 @@ static int
>>> set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id
>>>          struct xe_device *xe = ep->priv;
>>>          struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>          struct xe_drm_ras_counter *info = ras-
>>>> info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>> -
>>> -       if (!info || !info[error_id].name)
>>> -               return -ENOENT;
>>> +       int idx, ret;
>>>   
>>>          if (!xe->info.has_sysctrl)
>>>                  return -EOPNOTSUPP;
>>>   
>>> -       return xe_ras_set_threshold(xe,
>>> DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
>>> +       ret = drm_ras_counter_get(xe, info, error_id, &idx);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       ret = xe_ras_set_threshold(xe,
>>> DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
>>> +
>>> +       drm_ras_counter_put(idx);
>>> +       return ret;
>>>   }
>>>   
>>>   static struct xe_drm_ras_counter *allocate_and_copy_counters(struct
>>> xe_device *xe)
>>> @@ -244,7 +286,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32
>>> component, u32 severity, u32 val
>>>          struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>          struct xe_drm_ras_counter *info;
>>>          struct drm_ras_node *node;
>>> -       int ret;
>>> +       int idx, ret;
>>>   
>>>          /* Event is supported only if drm-ras is enabled */
>>>          if (!xe->info.has_drm_ras)
>>> @@ -256,13 +298,16 @@ void xe_drm_ras_event(struct xe_device *xe, u32
>>> component, u32 severity, u32 val
>>>          node = &ras->node[severity];
>>>          info = ras->info[severity];
>>>   
>>> -       if (!info || !info[component].name)
>>> +       ret = drm_ras_counter_get(xe, info, component, &idx);
>>> +       if (ret)
>>>                  return;
>>>   
>>>          ret = drm_ras_nl_error_event(node, component,
>>> info[component].name, value);
>>>          if (ret)
>>>                  drm_err_ratelimited(&xe->drm, "drm-ras error-event
>>> failed: %d for %s %s\n", ret,
>>>                                      info[component].name,
>>> error_severity[severity]);
>>> +
>>> +       drm_ras_counter_put(idx);
>>>   }
>>>   
>>>   /**
