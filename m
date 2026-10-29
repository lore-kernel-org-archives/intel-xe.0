Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25B606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J6tNx9Np
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E8B10E113;
	Thu, 29 Oct 2026 12:02:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF55410E113
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 12:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793275336; x=1824811336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jvMJS/GlUbD07268m9qF06/DhOkhTi+akjg9ouamorQ=;
 b=J6tNx9NpZVHuwFfQW6QPfFYH1GoW0X0itawj2iRLm20fYbHUBeIZ4ea2
 8gNbTVGGXTpdp4Ea+xAeHcw+11+vxx5plXmwQubPeBOucVG21L8KotA7q
 PQnq7WtobbMNDmi9Jm0++VuslIq7r+GqefwCl1GD9Xqfta8SNC3JH1Vvo
 0QZeLB/wDeAzBUy7ME9M6M2Jn5GDS2faWikhoivst8QQq+012N24FTG9w
 X/Ee1rT2vAgFoA/nxaojradpGVLvd+Y/ey17rEULBM+vx4PFDapYkeWQr
 nCYfVYKfBMLGYJqxl6oHhTVUMfllNUZIIMgsiGB4hhQd3kZ0r54p9vLuf Q==;
X-CSE-ConnectionGUID: J5eSbcIgRIuS0EO5hku7+w==
X-CSE-MsgGUID: AFuB9MU1Q22k/2srdBnwww==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1921688"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1921688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:02:16 -0700
X-CSE-ConnectionGUID: TtG5xU5rQgm6wQ+gcWeobA==
X-CSE-MsgGUID: 0+XkvA5JTamyAzrFoS1rGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5251808"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:02:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 05:02:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 05:02:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 05:02:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSJub8ZBxUpbOa0aMsPWX0LKZ2bAqm6D9c2wofBjqH0O6VPaZiqt4qbLiYuwbP0yMKs6/JZTrDnX9qrpu9naiC9XYMBURDNkOTuSxN6gUMwiwBto1Y8yxlxoLev7cAcwMigSCYgVM//Lx3nSs01rKZ7UUvPmUB8ZsrBr8NoxfGc+fH13mbfwfO65sVQ2uFOahMY0gzwiYdKBhqbkaCpLcjTBo2aq298rkx2WdOKbXI1l/y0FkkCoLK0uTsNhT1TjWbwxvWlf0KXSbz+9M+LYYd/KiAmlgOhe2kQDKls84wxVQb03v3JuA/sQr9g6iFh1SHextW+/Z7zP3IMCfzlddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL0SQfQ0uSSP3w93hC6Eqea1dU5y/JfxOLILSfqF30s=;
 b=DlGtyHRcC/o4Xb0d6sRuyi5QvT62HLcVB8kHBsX7s/UGy7OHmO6t0dyu1XQ6Lg65LVP7tRjOsB/WHVYmL2Ptb+0YW6SO/HjpWXxZIWcczPjb7rrUAhJvxqMtj4jStuTLpEWoF8GFgylUKapEYHSjq+DuzCL58QafL+uUNNQh8vyVcXXNClqKx8qjoB5hwgm7qO5KegB4isHNX1N3sOgM0C2XTYvTKPxxrAKFoyO43yBeytPDBuNDSYKNssSRGY96u87rC8I2O6jrGkGy8kkwmHvmVUxEoAWsfaWGL7f32IKzxj9t2kaIpDXJeDVb2dyfgw9nHcrdsy91ZZ09iD2vMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 12:02:12 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 12:02:12 +0000
Message-ID: <d040134e-8049-4aff-ae3b-08685205c7b0@intel.com>
Date: Thu, 29 Oct 2026 17:32:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-2-karthik.poosa@intel.com>
 <244e9d47-794d-4290-9bdf-d6c83a6f0fbe@intel.com>
 <c652ebce-4e73-483c-8b5d-82dcaf453d7a@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <c652ebce-4e73-483c-8b5d-82dcaf453d7a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::15) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|PH0PR11MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: f22b9b66-001c-445d-e209-08df35b47778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: hDvU5wEMa1UluUn/9ae4AelLQ9DCUQ2HbbDlZ4SZR1RnnMVDwYDIkGoeQmiec1U6YM0G1JAPeh/dxp8wNCNkxudUI4IZw4FqSqilhwlFE7rRgEoeI6l6SQ5YS44iKQevcbLoq0bqSzFPBQkF+nHzSeZAXHq4sfFWSKQ5f8OB8QCIfz6hH8clQNH1FS8Fz3ZAljtO9FpF1H7BrUQib0QOyZHV4XgL2tHrSpDpRLBNJfHfb7L/hYDmpX24Puc8Kn6uKLKJ5CXVz6gqykR6ATotxa59JxTce6J/1YsQYyd2ir2o4xdgnJKmEPTeZuZQjZwGLSW2am+81TIPMC19D+35oGRk5c+I72MqHxtM1DjPGceNL2rWOHEzoFHJMZ+qpsjgxM4ePEnL4H5HjE/vZ8WMlbFWVAvFh0IUsV2QhW3ltVDx4rzQtm5jhQRhSdF97iMJiNbDjkdEGRKBfoifDk4z4sLnKWZQr7c+9z+1ZYpQcz027E578fRowNqJappdzaTQoPJgL+UvXSEIfxADX76yvouUyOP9DBkc8Cj9H8mgqWLd4dD2xk0jYLJW3/ZF25ioPzCQEzrjrHCZuCmwU/OBzNbhHC2xeo4TK6Fr4A2t3NzdbKxJMzrpusGk0kdNadqwWlp7EHXjAUn6hroTt43/yAEIMQ3QhCfMu+vsZdU6gdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yjl2NDBBZ1luTDJGWG5tWXpxME1oN29zT3lRNWtsMkhIdUFNd01MZ0tacjJw?=
 =?utf-8?B?THBOdFJXRWxGY3VFVW1FcDRsMkpBUHVKT201TFkyN3p6akNieFlVOGNoMWVQ?=
 =?utf-8?B?UTAxUFJNdXRuR3l6c2xYTU8xTXVLT1M2MWZlY2RDRDFnWTkraGExZ3lrYnBv?=
 =?utf-8?B?Yy81NGQxV3lsSnZyZUtYeGZidDRGVEdxVkhGQ2h0c0tHOHNCb3RQd0xOTHl4?=
 =?utf-8?B?WnJaZXE1Q1NITHAxN3haMmIrbkZpcWs2cXp2TWFYS01GZG5MMis0Y3V0WUhR?=
 =?utf-8?B?bis3alZ3RHBkcGhzeldaaGNvVWo4U2ZlS3k3c1BzeDBveDNMVHhQTE9SZXVj?=
 =?utf-8?B?WFQ0TEZkSHM1UjdQd1FQTWh2Lzl5M2haWG9ZV2hoK214OVJaYU53VlMwZ0c4?=
 =?utf-8?B?Ky93TDM3SWlCTFJnWElmdnJzT1MzL2hDRDNTc3poSHVTNUtVaXJ3dm5hYXdZ?=
 =?utf-8?B?K1QwaGZqbWFRM3BjOHg3aGp0eTh0M0c5MFhpak8zT1V5UlZxaUhGL05idWM1?=
 =?utf-8?B?U0JqMU9Hd3ErMEozVnNlaDIwYmxjUUsrZ21vR1hqcHVqSnBkTlFONjR1a1Nz?=
 =?utf-8?B?K0IwZjVGcHFibkRUaG5OTkRQNklGdEsyUy9uY3N6V2o3N25uK2ZyaVRyNCtZ?=
 =?utf-8?B?eVRjNjUrdkRrelIxQlFsdkZsdmVvQThLWWZtZjlsR2gyZ29lYTViQTZvTE13?=
 =?utf-8?B?dCtWYlRMaXQ3cUk1dGFtZjNmU3Njd25DMzFUUCtNV2tQaGFhQmxpdXNHb3R1?=
 =?utf-8?B?ZUNYbWkxNld5V3h6YnpydUF4K0dFUzBwRmNMdm9RV00vbWxkSFpRL1Y4T3Ir?=
 =?utf-8?B?OFBzdU51VERGcnJPS2I4TW9UZWoyRXFibnE2OTR4ZzZORWtiY3RBVnZtekhv?=
 =?utf-8?B?ZzFFaDNTMHQwTmxITFB3RWNiSmZRUmlabGNHMm1vWTR2a2FPMXdVTmgvZTg2?=
 =?utf-8?B?TitJWlEveDVVeWFSbEtmQXBLR2NQeE9hczNibGpoNEcwVzNSL0daOFhHUUJh?=
 =?utf-8?B?a2FXTG9sQ2RReGZEUys2OVgzMXFHVkFYZm13eGhoWGtqUFNaWkZPMEFRTWFi?=
 =?utf-8?B?eWZCTHloMjZGM2pyRVBnM2llZ1dSeEZ5Z04raWxYelFlbTRVNDlLOGR5cmMr?=
 =?utf-8?B?S2dIWjdITUlKdCtUMWVER2c5UHd6QmcvRkRGYml3WlY4R011dzhvVzFkVkVR?=
 =?utf-8?B?cy85MUVsZUNySnhMS2xkVWtQYkNyMUxBdStZVWZDRDhVdzErQ1YxcEZrVVFK?=
 =?utf-8?B?eHZDeXJ3andKbUl6dG9wV2YrbVV5VmtqVzBPQU5jS0V4Y3NiTEtOUUFHUW1J?=
 =?utf-8?B?eTl1eGJTcGpBNndjc3YwcDBQeVphQms4V0hrL29JbG0vaExjUjJEeWlFMXNQ?=
 =?utf-8?B?d3B4V3BHZEc3R3o5bnRoVkM5dHJNVWgrNVBaRWR1MWZsUUx6OU96Sk1tZ2lO?=
 =?utf-8?B?d3FmKzdRcUFyQWdESEw0eW85ZExnVHFXejhTMk1nYlpUZWpoVXM3YjBjNk1u?=
 =?utf-8?B?QVN1WUpCWFhlaDF4dUN4a2tycWh5NVBvWUc5Z2hSQ1hJMjRYeXd2NkVQUC9P?=
 =?utf-8?B?emFtNzVkcTN6cFFHb1lOVDZPbzZiekcrUjJFU0dZeXJGK1N5K3J2YmFiYWhm?=
 =?utf-8?B?cW9VazNGM01vYm5JcVZzMFlnY2d0UVVZWTUyT0lSVHdaVlJrRVBoTmdjTys0?=
 =?utf-8?B?Q1VhZmNpeDN3WlNqaWFkcHdQMWIvT0hScStDaWxkNnErTWFJUVV5MXdiWll5?=
 =?utf-8?B?UEZteHNjMXBaMmNCdDk0c3hHaEV2R1ROMnlIV0xYcmhxYmZzNFduVTY0cGVr?=
 =?utf-8?B?SzFCSzFsNGpPU05GRFc2SjVITjdnNG1UcCt2b0xwL05ZcGkzTDNVMkw1NGg0?=
 =?utf-8?B?UHdQTkpUQytIcWs1Mm1ab2RPbExscFhTa3A1cFVvaHRleHhEYkhhbHNVa0NP?=
 =?utf-8?B?ZEpaYnVwQWUvNDM0NUdnN2p5VHR5bXNDRTYxeEZvb2FaU0UrcGx5emVXSGZr?=
 =?utf-8?B?WThNTEgvTW5VcWhDUmdwL2hsRUdPK0ZEL1BXaXVuMFUwdUxTNjk3YkFIRTZ6?=
 =?utf-8?B?c3ZPclFHMXA5Y3g0bnBwckpQZzVTSmI0WWVqekNHVHVtNkhobi9pMHM2TUJn?=
 =?utf-8?B?M0MyRzFHbWlBSkc2VThCeW9Uc2FoeHlhTkZRSGNCbjZpekxVblFTaG9ZUVhy?=
 =?utf-8?B?WjROa1ZkMkY2eHNGckMwc3FXdWc2dkhwd3oyazhXbXdOQjBGcWZBdDRIMTNI?=
 =?utf-8?B?MEZFaDR1NzU0aVhUMnBNY0d0RGo4dCs1eUppdlJMT2dmWXcza3EyRVdKd3ZT?=
 =?utf-8?B?UkNrbDFzdDNvZUlSdzZ4L1ZtQk00M1p5MmRVU0ZrSGxLU2hBL2lQZz09?=
X-Exchange-RoutingPolicyChecked: aUx6KJxGmx+O0c8SXj6hLZKMUM4tMKr0qokN5zXkRlVygvhqsIlbKrFiDVRS8CaJ4ywRRcKHEg6Tn4RlkCRAmBu9ne/Pzfk2MwftACNmoAQK/wLys7AhBq9P1IwvnS50YFZ6DK9T49y+NHkDk6salZBGZFVDkUspHx/AO3Th7JdFwqJCwZX7VT36tGi78QXtDjnxEWHBz8YfB3AG6pwkAizRiGoIR0+ErDYgmTZyEX8IHtKN+l42f+t3OX2udmhpDKPHmfiYhFssNtUNZtUMjRXLaEemDxiMfZcV5HgA59M4k6qBWQPbmcYIhbxpZS7/LtTrt8CRyUB2Mg0hEYRrsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f22b9b66-001c-445d-e209-08df35b47778
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 12:02:12.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thxAoogIUIdU+DIbVMAREiTOJgypw48svHNUopmUvlLVkocdjc0bwa8qf2MAAPPWrTSb23gqHHFAJsNNjHn7Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5014
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


On 29-10-2026 17:04, Poosa, Karthik wrote:
>
> On 29-10-2026 00:16, Purkait, Soham wrote:
>>
>> Hi Karthik,
>>
>> On 16-10-2026 00:37, Karthik Poosa wrote:
>>> Initialize Xe hwmon fan-control support by detecting fan count,
>>> reading stock fan control points and min PWM.
>>>
>>> v2:
>>>   - Avoid user table initialization during probe. (Badal)
>>>   - Move unused code to appropriate patches.
>>>   - Use xe helpers for dmesg logs.
>>>
>>> v3:
>>>   - Rebase.
>>>   - Refine a few debug log messages and comments.
>>>   - Update xe_hwmon_read_fan_control_info() to return on any stock 
>>> table
>>>     read failures.
>>>   - Avoid returning when num_fans is 0 in
>>>     xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
>>>     initialization is not skipped.
>>>   - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as 
>>> default
>>>     timeout itself is now 10ms.
>>>   - Use xe_pcode_read() instead of xe_pcode_read_timeout().
>>>   - Rename fan_control_point_count to point_count in struct fan_table.
>>>   - Resolve kgdoc warnings.
>>>   - Add valid check for stock table fan point count.
>>>   - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when 
>>> enumerating
>>>     fans. This avoids assuming contiguous fan indices and allows 
>>> masks with
>>>     gaps to be represented correctly in the hwmon interface.
>>>
>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>> Assisted-by: LLM
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c     | 167 
>>> +++++++++++++++++++++++++++---
>>>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>>>   2 files changed, 157 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 42acfeb8818c..f2bd20f8b0a2 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -21,6 +21,7 @@
>>>   #include "xe_pcode_api.h"
>>>   #include "xe_sriov.h"
>>>   #include "xe_pm.h"
>>> +#include "xe_printk.h"
>>>   #include "xe_vsec.h"
>>>   #include "regs/xe_pmt.h"
>>>   @@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
>>>       long accum_energy;
>>>   };
>>>   +enum fan_table_type {
>>> +    /** @STOCK_FAN_TABLE: firmware-provided fan table */
>>> +    STOCK_FAN_TABLE,
>>> +    /** @USER_FAN_TABLE: user fan table written through sysfs */
>>> +    USER_FAN_TABLE,
>>> +    /** @FAN_TABLE_MAX: number of fan tables tracked per fan */
>>> +    FAN_TABLE_MAX,
>>> +};
>>> +
>>> +/* Check if a fan is enabled based on the fan_enable_mask got from 
>>> FSC_READ_NUM_FANS. */
>>> +#define IS_FAN_ENABLED(fan) (hwmon->fan_enable_mask & BIT(fan))
>> If this macro is called from any function having no local variable 
>> named hwmon it will break. Should it take hwmon as an argument ?
> yes will change this
>>> +
>>> +/* Maximum number of fan control points supported by each fan. */
>>> +#define MAX_FAN_CONTROL_POINTS    (10)
>>> +
>>> +/* Fan control point index: bit31 selects fan table type; bits30:0 
>>> control point index. */
>>> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 
>>> 31) | \
>> Cast to u32 ? shifting the signed enum into bit 31 could lead to UB.
> okay
>>> +                        ((POINT_NUM) & REG_GENMASK(30, 0)))
>>> +
>>>   /**
>>> - * struct xe_hwmon_fan_info - to cache previous fan reading
>>> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
>>> + *
>>> + * Each fan keeps the latest tachometer sampling state along with 
>>> two fan
>>> + * tables: the stock table discovered from firmware and the user 
>>> table managed
>>> + * by hwmon sysfs writes.
>>>    */
>>>   struct xe_hwmon_fan_info {
>>>       /** @reg_val_prev: previous fan reg val */
>>>       u32 reg_val_prev;
>>>       /** @time_prev: previous timestamp */
>>>       u64 time_prev;
>>> +    /** @fan_table: fan control tables */
>>> +    struct fan_table {
>>> +        /** @point_count: number of fan control points */
>>> +        u8 point_count;
>>> +        /** @fcp: array of fan control points */
>>> +        struct fan_control_point {
>>> +            /** @temp: temperature in degree celsius */
>>> +            u8 temp;
>>> +            /** @speed: fan speed in percentage */
>>> +            u8 speed;
>>> +        } fcp[MAX_FAN_CONTROL_POINTS];
>>> +    } fan_table[FAN_TABLE_MAX];
>>> +    /** @min_pwm: minimum fan PWM */
>>> +    u32 min_pwm;
>>>   };
>>>     /**
>>> @@ -193,6 +231,8 @@ struct xe_hwmon {
>>>       int scl_shift_time;
>>>       /** @ei: Energy info for energyN_input */
>>>       struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>> +    /** @fan_enable_mask: bitmask of available fans */
>>> +    u32 fan_enable_mask;
>>>       /** @fi: Fan info for fanN_input */
>>>       struct xe_hwmon_fan_info fi[FAN_MAX];
>>>       /** @read_power_limit_from_pcode: pcode accepted power limits 
>>> write for the channel */
>>> @@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const 
>>> struct xe_hwmon *hwmon, u32 uval)
>>>                     (uval & POWER_SETUP_I1_DATA_MASK));
>>>   }
>>>   -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>>> *hwmon, u32 subcmd, u32 *uval)
>>> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>>> *hwmon, u32 subcmd, u8 fan_num,
>>> +                       u32 *uval)
>>>   {
>>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> Nit: blank line after variable declaration
> ok
>>> +    return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, 
>>> subcmd, fan_num),
>>> +                     uval, NULL);
>>> +}
>>> +
>>> +static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
>>> +{
>>> +    int ret;
>>>         /* Platforms that don't return correct value */
>>> -    if (hwmon->xe->info.platform == XE_DG2 && subcmd == 
>>> FSC_READ_NUM_FANS) {
>>> -        *uval = 2;
>>> +    if (hwmon->xe->info.platform == XE_DG2) {
>>> +        hwmon->fan_enable_mask = GENMASK(1, 0);
>>>           return 0;
>>>       }
>>>   -    return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, 
>>> subcmd, 0), uval, NULL);
>>> +    ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
>>> +                          &hwmon->fan_enable_mask);
>>> +    if (ret) {
>>> +        xe_warn(hwmon->xe, "failed to read number of fans, 
>>> ret=%d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /* Check if fan mask exceeds FAN_MAX and log a warning if it 
>>> does */
>>> +    if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
>>> +        xe_warn(hwmon->xe, "fan enable mask exceeds maximum 
>>> supported fans\n");
>> Reset the mask to 0 so IS_FAN_ENABLED() stays false in case fan mask 
>> exceeds FAN_MAX.
> how about clamping to FAN_MAX ?
Clamping might be a better option. In that case the warning should state 
that the extra bits are being dropped.
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    xe_info(hwmon->xe, "Number of fans detected: %u\n",
>>> +        hweight32(hwmon->fan_enable_mask));
>>> +    return 0;
>>> +}
>>> +
>>> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>> +{
>>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>> +    int point;
>>> +    int fan;
>>> +    int ret;
>>> +
>>> +    for (fan = 0; fan < FAN_MAX; fan++) {
>>> +        u32 stock_fcp_count = 0;
>>> +
>>> +        struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>>> +
>>> +        if (!IS_FAN_ENABLED(fan))
>>> +            continue;
>>> +
>>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon,
>>> + FSC_READ_STOCK_FAN_CONTROL_POINTS,
>>> +                              fan, &stock_fcp_count);
>>> +        if (ret) {
>>> +            xe_err(hwmon->xe,
>>> +                   "failed to read fan %d stock table point count, 
>>> ret=%d\n",
>>> +                   fan, ret);
>> Why not continue for the rest of the fans marking the current one ?
> yes we can continue, you want to mark current fan invalid ?
>>> +            return ret;
>>> +        }
>>> +
>>> +        if (!stock_fcp_count || stock_fcp_count > 
>>> MAX_FAN_CONTROL_POINTS) {
>>> +            xe_warn(hwmon->xe,
>>> +                "fan %d stock table point count %u is invalid\n",
>>> +                fan, stock_fcp_count);
>> Ditto.
> okay
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
>>> +        xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", 
>>> fan,
>>> + fi->fan_table[STOCK_FAN_TABLE].point_count);
>>> +
>>> +        /* Cache the stock fan table for later use. */
>>> +        for (point = 0; point < 
>>> fi->fan_table[STOCK_FAN_TABLE].point_count;
>>> +             point++) {
>>> +            u32 fcp = 0;
>>> +
>>> +            fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>>
>> nit: u32 fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>>
>> Regards,
>> Soham
> ok
>>> +            ret = xe_pcode_read(root_tile, 
>>> PCODE_MBOX(FAN_SPEED_CONTROL,
>>> +                                  FSC_READ_FAN_TABLE, fan),
>>> +                        &fcp, NULL);
>>> +            if (ret) {
>>> +                xe_err(hwmon->xe, "failed to read fan %d stock 
>>> point %d, ret=%d\n",
>>> +                       fan, point, ret);
>>> +                fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
>>> +                return ret;
>>> +            }
>>> +
>>> +            fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
>>> + REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>>> + fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
>>> + REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>>> +            xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, 
>>> speed %u\n",
>>> +                   fan, point, 
>>> fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
>>> + fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>>> +        }
>>> +
>>> +        /* Read minimum fan PWM */
>>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon, 
>>> FSC_READ_FAN_MIN_PWM, fan,
>>> +                              &fi->min_pwm);
>>> +        if (ret)
>>> +            xe_warn(hwmon->xe, "fan %d min pwm unavailable, 
>>> ret=%d\n", fan, ret);
>>> +        else
>>> +            xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, 
>>> fi->min_pwm);
>>> +    }
>>> +    return 0;
>>>   }
>>>     static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, 
>>> int channel,
>>> @@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, 
>>> u32 attr, int channel, long *val)
>>>   static umode_t
>>>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int 
>>> channel)
>>>   {
>>> -    u32 uval = 0;
>>> -
>>>       if (!hwmon->xe->info.has_fan_control)
>>>           return 0;
>>>         switch (attr) {
>>>       case hwmon_fan_input:
>>> -        if (xe_hwmon_pcode_read_fan_control(hwmon, 
>>> FSC_READ_NUM_FANS, &uval))
>>> -            return 0;
>>> -
>>> -        return channel < uval ? 0444 : 0;
>>> +        return IS_FAN_ENABLED(channel) ? 0444 : 0;
>>>       default:
>>>           return 0;
>>>       }
>>> @@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct 
>>> xe_hwmon *hwmon)
>>>           if (xe_hwmon_is_visible(hwmon, hwmon_energy, 
>>> hwmon_energy_input, channel))
>>>               xe_hwmon_energy_get(hwmon, channel, &energy);
>>>   -    /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>>> register reading. */
>>> -    for (channel = 0; channel < FAN_MAX; channel++)
>>> -        if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, 
>>> channel))
>>> -            xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>> +    if (hwmon->xe->info.has_fan_control) {
>>> +        xe_hwmon_get_fan_enable_mask(hwmon);
>>> +
>>> +        /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>>> register reading. */
>>> +        for (channel = 0; channel < FAN_MAX; channel++)
>>> +            if (IS_FAN_ENABLED(channel))
>>> +                xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>>   +        /* Fan control tables initialization */
>>> +        if (xe_hwmon_read_fan_control_info(hwmon))
>>> +            xe_warn(hwmon->xe, "Fan control tables are not 
>>> available\n");
>>> +    }
>>>       return xe_hwmon_init_temp_info(hwmon);
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> index 00c4fc7d0124..0349b24a8259 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -83,6 +83,11 @@
>>>     #define   FAN_SPEED_CONTROL            0x7D
>>>   #define     FSC_READ_NUM_FANS            0x4
>>> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>>> +#define     FSC_READ_FAN_TABLE            0x7
>>> +#define     FAN_CONTROL_POINT_TEMP_MASK        REG_GENMASK(7, 0)
>>> +#define     FAN_CONTROL_POINT_SPEED_MASK    REG_GENMASK(15, 8)
>>> +#define     FSC_READ_FAN_MIN_PWM        0x8
>>>     #define PCODE_SCRATCH(x)        XE_REG(0x138320 + ((x) * 4))
>>>   /* PCODE_SCRATCH0 */
