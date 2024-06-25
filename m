Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F03C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 15:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC9A10E075;
	Tue, 25 Jun 2024 15:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7Xh75aE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1BA10E075
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719329442; x=1750865442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PfktAoYjMbm0Z4hGJV3Fk5HLu70ngBr+PTb1cGFT7mk=;
 b=j7Xh75aEZyBgOi0JZ7/OU1HN/tKlgbLA+C96eMzrAUNTlEOYUVOhmCMh
 lIk+elkQ3x++rOjcLK3W8/o7BhF0k2/30mbGT7bYG5I+XeQUGke4EL8/E
 jWq5G8fVK6AvkO7U9VCFcjK38AVBZy1uXGEHqDlaQjvq7+HSKxAbUICfS
 iwFEtPNZRMdMNRpYs3tB5FzL8fdPQrF59SLwZEdLVeUp+8AYM3+MfcWWs
 0pnuthc5RP1/dwzA10xTvpeQKUo0rOLGK/3vi/8nLqO6lgd+F7TykOTnS
 C81EWXDlYTkBzVsjTl4Jb5IqX8oLm9Rj0kfGu/kblqAmbEUNEMsQKKTlg A==;
X-CSE-ConnectionGUID: OOalrXEURZa4F5solxNVnA==
X-CSE-MsgGUID: p1VwZpcvSo2KnLAxAthlyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20166337"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20166337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 08:30:41 -0700
X-CSE-ConnectionGUID: xITY4EMgQKe6iMKfUk+/sg==
X-CSE-MsgGUID: vf/ZsCfFQ/+tZ4361kaEyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48669723"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 08:30:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 08:30:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 08:30:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 08:30:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 08:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2BjXGbAmmOZUVhNoFIEzqznVA7GbP31VQSAJ1aMCNii5u6QZCew+AX2S4ga9jckBj53wfAbpX+bH0hUnHccCuQsN7y479ZDyoJk6Mw+LEP5tLclDOnEKWcnPqb4fWUMYsCaSPVcBfIK76a9xNUz3HOolokTT1MGVADLDxKqwXy+1J/n2kyO77zhKeBaup472F0CXP/61cVWQRpb/2vdzo9GS5kghcNzUAbDzqXfpxYIa4OA7LnvUn7k+nPehKc2fFl5kdErqSM/HDyZ9YeCNl5VHzsOLLF/6ABnS5lNELO4JclD5OexnOIQt9cZPe0sdix77Ijxh1XHG8DaGg6nYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrEQD8iac9NLu0EKcoR18DqAtGGw0/cZkcmtzlmI8AY=;
 b=NcdJ7yjLlEOuF0vSUJXD8mgtL7nL5WznlhvG69r0xYUAb3QRaRKpEwi067qw9AyHPfoo4b2l2nqUt9b0B37bYH5qZ+bPq9eOzycaa60C7Gc8juMRpxaPaZ6qy56TCrB0j812DrcQTHr96CVmVCKU629ojihEWf1i4OrMxrYaHJtVVM4zHh0+13OfsfYg4Dv+TFQrw2Tu+9pcOkI0X59cZqtK0Nbnvu+S7EUn73yA04q5bxeJ4gfTqOyi6wHqqKU9LZWDVPOQXoTackTBIAIrc28i9069OCeL66Lf7dTlq9qJUQ/MoLvGeY2GSgRusv/ewKbF/vUbJ1SkDLUNNuVsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8748.namprd11.prod.outlook.com (2603:10b6:408:200::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 15:30:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 15:30:30 +0000
Date: Tue, 25 Jun 2024 08:30:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
Message-ID: <Znrij4sKYmi8UiG3@orsosgc001>
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
 <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
 <20240624215612.GV2906448@mdroper-desk1.amr.corp.intel.com>
 <ZnoVOzQQ2NVVZzm+@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnoVOzQQ2NVVZzm+@orsosgc001>
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ded8df-2825-46d8-a58c-08dc952bbf13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHJaek9LY284WDV5c3loaHplaDVMUVF6UVpaeEtLckY0RlZuOFgraStKSUJy?=
 =?utf-8?B?ZXlaYlUvRG5zOUZJR3QrV0YxU1R5MGxQTkRNcGg2cHJYWWxaSGp3UjVGSWtB?=
 =?utf-8?B?bUxKRm9aYzE5b2F6bEozRTlPL3J4SGJaUGsvMDZWWHdWUzdsM00vWW50WjFC?=
 =?utf-8?B?bGFPaEdDOU5SL0QwWklYdjdJK2huOTVFalJGVXpFbGR2OHh3d1c0bWw3SE42?=
 =?utf-8?B?eVBVQWZIU2gxVUVNOUlWVndoT2Vac2F4NEZRNURZVWlQNytva2NJekVpZWhY?=
 =?utf-8?B?YWU4amJsekNUTytiSkJ0T1QzbyszaGcxa3lBTnNqS3lRRENPQVd0cDEyV1dS?=
 =?utf-8?B?dnJVTHJnUjVuKzdOb3VKbnlOMDVIbUNpTFBMYi9kaUd4OU5vc0NzNTlmTHhH?=
 =?utf-8?B?YW5reUwzd1JZQWNxVi9MN0Y5OE1mMWtYeFc3blEveW9EbVhsczAvTEtCZEVQ?=
 =?utf-8?B?N1FNR3VKWm04YXRaOERLcjUrWTE1Y3JyQTViTVRkQ00vOVlhc0NuT081NTQx?=
 =?utf-8?B?V1JIbXdEL0ZUM21tOENCTG50UWJMZGNPbXpZOTZ6Z3lmOEhFRXczMmgxaFlv?=
 =?utf-8?B?RDlJMXNOUWtLb3R6aDVOQS90SUdmeHJqaHhjQ0JZUjQ5U2VmeHpXNEQrSzFE?=
 =?utf-8?B?RTZLVVVKMHROc1pJMkdlbjNKZFNsb1pEZDdWdGRnaGdKVWx2Rk1QMG4zc2N1?=
 =?utf-8?B?QmVXWUNtMjczNXNIdExlWTN1eDJVZERzeEZGTkIzdlloc0EyMm5yK2JHZW5M?=
 =?utf-8?B?S01MRk9LWUxLYlp2eWNrTlB2WXJsVDUxSXlwNVN1RUdpbitMSzhmaFVqOU11?=
 =?utf-8?B?UWV2bmlURWFwK3RnOEJFblUwak1TcUYrV0FPNG5NY3k5cnZtWEkzRTFMeE9L?=
 =?utf-8?B?azMyOUdDUFRuY2d6ZWE4OXVxZXpqS0UyTG1lS08zWituS25xMS9Bb20vNzdD?=
 =?utf-8?B?OGl6V2hEQ0FBc2lzV2NuSlcyNDFLT29XOGdLY2IzMFlOdVh2RHQ0dm5qMzhZ?=
 =?utf-8?B?b1Fpb1piRUxQd1hDb01iRXNVSWd2WmxRVGVmY3FBL3hQRzJSQ01WbktLM2h1?=
 =?utf-8?B?Tk1SSHZ0QU5tL0xhQ2NFNHpqTmRNbFA5V09uQkJ4bUZYRG4yZGQxOUd0Zmph?=
 =?utf-8?B?VGt3VjVBQnA4VzJhSHRFc00rU1U3UGpCejc5RnRjNWpyS1VrUTdIQUsxdDgw?=
 =?utf-8?B?MkdDOHh5djZNTGhRU0JUVHFmbVhtUmtoaFJnZWZVUTNwd0xST0NDNkgrdktp?=
 =?utf-8?B?NzBNaFVld0pXc3RZTmtpOVRvQkx1eTNIcVR0K2l6aGRleFJ2RHRmb0VvVjV1?=
 =?utf-8?B?WmgyQ0hlUDMvZStnVUhXZGFyaHJKR0o3Z3lxeklDeW9adW4rTkl3K1JEUVF4?=
 =?utf-8?B?c3pWUFBqdlZDbExWVUpuSUd2Ulh4anNkM0dDYVRRK3J6YldqTm85UnNJOWFZ?=
 =?utf-8?B?T1Y0WkRHVmgrTUlyQ3RlaUtGbmtIRWk2alhZaUNPdUdMMno5d3Z6MkJQQVg5?=
 =?utf-8?B?RmFhRnYvU29lY2tHUG5HTm1nM0hOcGxsNW9nR0pWbGN0S3hmV2JSSTlKNE12?=
 =?utf-8?B?SHBJNFZldXMxNVA2dkVJY0Q4aUJrMDVuc3I2bTFYMjByZVpBK3EyYkZLSnpk?=
 =?utf-8?B?YkxLSXNaOEY0UFlOb3pCWXM4NTdQRFpTekpBenIyZUNPY0FlNGlUQXJnaXNZ?=
 =?utf-8?B?N01QZFJVSzAzaFlDdkV1eFNQbWpvZS8zaG4raWo2TjJDL09tZWt0R084L3FF?=
 =?utf-8?Q?yPoN6jctARu5OPNFpLrsyQlft+mNZZb0gyrySTo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3Z4bXpNd2M1RlpFUDNmdDVEQWFmTUx5Sjk0d01jekZFM1UreVFvcDdOLytp?=
 =?utf-8?B?blZwejd6RUtWdmkxbm51TmNBUi9Ya2JOU0tQcHVEcVNzMFhmQ0JvY3RENUlI?=
 =?utf-8?B?YTBiTTBGK0xWVEUrTm43eGUwRXRnS2hxNHNLQlJoSGpaaE5PMzJJMnJBZVZw?=
 =?utf-8?B?UTgzcTlxRVdjUGdUc2ZCRjM1TEMyY3Y3MVdTcHAxblB0clZ0TENmYW9CNjRs?=
 =?utf-8?B?SnJKMVFXTmxZZTgva3ZCSFZJUnFZcUVXNkFBaFdGMk9LOXV0L1pnVUw2VUN2?=
 =?utf-8?B?VnNtNHU1NnM4RS9qZFU5STBna2pmYXRtSTZzMDFtOTl4R2xCcmY1TXhrci9k?=
 =?utf-8?B?MUtiZTFMYUQyc3hmYk9XN0h3WlFxWFZKQ1Rzc3F0b09ub2VDdDZuZ2pITkFk?=
 =?utf-8?B?T0ZHOUJzSHlXanQrWkxwVmV2UEdneWgrQWlSQ0V3ZnZwMTJ6aThqeFBjZE4y?=
 =?utf-8?B?UzV4VTJ1a2Q1Q25jVkhuYVE3b2ZwMlhqUVV4VDlCbG1QUkRMRFIzeDk2blFy?=
 =?utf-8?B?NmxIM0pYUFZzRXJJOHZLVGYrYjlwamNzOEliQXVjUnNOcHFFR3hMR3pIL09s?=
 =?utf-8?B?L1d2dGZ6ZTVJZEZLdWRtc2VRYWR2QzVsMjJJb0RwUUhOWldLalp6VWFWSFk4?=
 =?utf-8?B?OWh6U3JIRzJKaFJQckR3ZUZ1Sk5MVERTR2lsdEw0Sm5SMDRnZWVvQ1d4M09S?=
 =?utf-8?B?S0dJR0FzSHJmZHFjTkoxNjhLbGthbHRNS1h4WWY2TE9SYk9JYngxWEhncHM2?=
 =?utf-8?B?SWpwY2FKd1dhVXFwYzRZTWxIM2NwSWVpMkZqZGhtby9wVCtodXRyNllHUkNI?=
 =?utf-8?B?NFZaRzVpY05HSXVBZkJ3NGRZVk5wOVQyZWZ4SWJialZXbEx3OTRHUEF0VEl5?=
 =?utf-8?B?ZE1BdkZJWUp0ZUV0Tms2NDUydWtEZWh4amp2VVpXZFRGMDlHSHJ4VW1wMy9a?=
 =?utf-8?B?ZWt6S1ZzUDRYRWZUek51M1BSc29xRm4vdkdobHJxV0FQZEFaTzl1bXNCU3Yz?=
 =?utf-8?B?eE5hNkt5RExlZ1lKNGZyLzd3WXVXalRJb1ZqRkh5KzhBMk5yN29MQlFaRThG?=
 =?utf-8?B?OEIxQmlJNy8ycTFPN3Jodnl5RWhnN1RoL254QzI0dWRES21OU1RqVld0eFly?=
 =?utf-8?B?ZkJyY25kbXRhN2pXMWlWczlzZVN3R0lNQXN4R2RVWGFWTU1xdnlvSVc4bFlj?=
 =?utf-8?B?Wm1wQzIwOGJjOUQ4M0thVW1OL2VHRnZKNTJreDJJVlpMVGNpSDMzUmlnbUZB?=
 =?utf-8?B?NzEwT2tjdnZUTisyYktjazFmYjBRaEZwM2ZxWCtyLzU4L2tLczJrcTNVQjV1?=
 =?utf-8?B?bUh0b3FMU2UrTHlJU1lpd245Mkk1dEx3NWFKVktoN0lwUHlMdldPeDU3MDZm?=
 =?utf-8?B?eFU0RUVVNkkya0FlSHJYRVhCbDVZdEo0Q0w3WjZ2ZUkyRjk3Rnhjb0EyazFX?=
 =?utf-8?B?T1RNVkJqUjc2MWJodW94ekRSd0U1MldzaHphL3pCUGd3TXU2c3hYM3oyRVlN?=
 =?utf-8?B?STFHejUybUJyVnE3L0hnRXlMNUREMWpid2NxemlKcTRhMFdhRHRWeURQdVdR?=
 =?utf-8?B?d2pZaHJxTWlSM3RWalI1T3oyVjhRTmg1Mkt5cWxxNDRQNmg3MU16VHYvbk51?=
 =?utf-8?B?MUlDVFNraEdVcGVQMGhyT2pUK3hIbC9PekpaZHR6SXdGSXRrWGplekNBNFJh?=
 =?utf-8?B?bDFNd1dSeGFGL1JMYzBZMzVHeWtIUEFyNDZreVVtT0NGcm1KNDZSc2Z0TzVP?=
 =?utf-8?B?TGRuVDFCc003ZmRrQnVTQitDZ0lua3paelk3eXl6alBaQ1RUWSthNThad3RP?=
 =?utf-8?B?cnlNZGw5MjNOc3NNRjZLRndRZnpFcnhSa1BQTm1GYitiZmlxdVJRZUozMVR1?=
 =?utf-8?B?d1FENzNFS1ZJZUJXTU5aWTJkQ3pIY3kwSjMvRnVvbEt2a0RnOVdMVVNyclZU?=
 =?utf-8?B?VXJiRVhjSUJPdVdvcThyVFVvNjdabVFaVktnMVBlUHRwS0FLb24yRkl3SCtO?=
 =?utf-8?B?TWxiZVRwYUIwZWNQMG0waTNJT2N5c1ZpZjdEV0hyS1J2aFlmMm9URDhXZXBE?=
 =?utf-8?B?TTRlWXVMb3JpSFkwY3VvWE1aRUpxZWRtaHM2WG13SCtrWStnWnhBbVVTeHE1?=
 =?utf-8?B?ekdUNzV2Znl1Y09BVEVOVjcwN3Z5MTl5UDVUOHBkalhCYnl2ZEFKU2xySHd4?=
 =?utf-8?Q?65lWA2UTkVvxEpLAphuiCtc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ded8df-2825-46d8-a58c-08dc952bbf13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 15:30:30.3568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGq+uYoi63GOuQi0uOSRhdg6SQ6LgWELrTdolR9k+YkQwRkcpgjNTB3MWEiintQmP9TmQfkyI6OHM5BdH3dTT+uzEz4YZcwCx3TaNtu/BIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8748
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

On Mon, Jun 24, 2024 at 05:54:19PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jun 24, 2024 at 02:56:12PM -0700, Matt Roper wrote:
>>On Mon, Jun 24, 2024 at 09:44:03AM -0500, Lucas De Marchi wrote:
>>>On Sat, Jun 22, 2024 at 03:23:25AM GMT, Umesh Nerlige Ramappa wrote:
>>>> Per client engine utilization uses RING_TIMESTAMP to return
>>>> drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
>>>> platforms that have render. While this works for rcs and
>>>> ccs, it is observed that this value is 0 when running work on bcs, vcs
>>>> and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but
>>>
>>>what do you mean by engine specific RING_TIMESTAMP? We are already
>>>reading the engine specific copy of the same timestamp. AFAIR just
>>>getting the gt fw was working for reading this register from vcs, vecs,
>>>bcs. Can you demonstrate the failure with a bug open or a series of
>>>intel_reg invocations showing otherwise?
>>>
>>>I think the simplest way to show it doesn't work is to call
>>>`intel_reg write` to get a GT forcewake, then `intel_reg read` to read
>>>this register.
>>
>>I'm surprised to hear that this has been working for the RCS/CCS but not
>>the BCS; that seems backward.  RING_TIMESTAMP is $engine_base + 0x358.
>>According to bspec pages 71185 & 71186:
>>
>>- Render  (0x2358) needs RENDER forcewake
>>- BCS0   (0x22358) needs GT forcewake
>>- BCS8  (0x3ee358) needs GT forcewake
>>- CCS0   (0x1a358) needs RENDER forcewake
>>- CCS1   (0x1c358) needs RENDER forcewake
>>- CCS2   (0x1e358) needs RENDER forcewake
>>- CCS3   (0x26358) needs RENDER forcewake
>>- VCS0  (0x1c0358) needs VDBOX0 forcewake
>>- VECS0 (0x1c8358) needs VEBOX0 forcewake
>>- GSC   (0x11a358) needs GSC forcewake
>>
>>So I'd expect everything _except_ the BCS engines to be broken today...
>>
>>FORCEWAKE_ALL is a big hammer that should indeed solve the immediate
>>problem, but I wonder if it would make more sense to store the specific
>>domain that needs to be grabbed for accesses to any registers in an
>>engine's ($engine_base .. $engine_base+0x2000) MMIO region so that we
>>can avoid unnecessarily waking up all the unrelated power domains
>>whenever we want to read a timestamp?
>
>Well.. I don't know if we really gain anything by doing so, so let me 
>know if (2) is what you are suggesting below.
>
>As an example, show_run_ticks() will get called every second and would 
>rely on reading the GT timestamp each second. We could potentially 
>have domain specific logic here, but logic would still iterate over 
>all domains since we are capturing activity for all classes.
>
>1)
>get forcewake_all
>read ring_timestamp
>put forcewake_all
>
>vs.
>
>2) for_each_class() {
>	get class specific FW
>	read class specific ring_timestamp
>	put class specific FW
>}

I think I understand now. Since we are reading only one hwe specific 
timestamp, we are better off just using that FW domain. I agree that 
it's much better than FORCEWAKE_ALL. Will post that in rev2.

Thanks,
Umesh

>
>Thanks,
>Umesh
>
>>
>>
>>Matt
>>
>>>
>>>Lucas De Marchi
>>>
>>>> to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.
>>>>
>>>> This should work fine on multi-gt platforms as well since the
>>>> gt_timestamp is in sync on all GTs.
>>>>
>>>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_drm_client.c | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>> index 4a19b771e3a0..74f2244679f3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>> @@ -264,9 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>> 		if (!hwe)
>>>> 			continue;
>>>>
>>>> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +		xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>> +		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> 		break;
>>>> 	}
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>
>>-- 
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation
