Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D39606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dVqTf52/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DD710E394;
	Mon, 26 Oct 2026 18:32:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A810710E394
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793039520; x=1824575520;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rau13nVtpvkVfbDMGeux8Fpbs83FXyipXB2OYfozEzs=;
 b=dVqTf52/D2CxIQtfLcck2SM2pIMvsqBkOmfvS4VkQ9K4HE96Ra9vKMSo
 SUVgekbtO5qceiQgId6LhQYKo38wE1HZgyCL6h182abmTL+rZ8c5tH94g
 7qiQSGMsJlCEB2WPsBJ/G8P6KqPPSfkxUO7UL5/2xMzfSVAKi4+ydBfBt
 NS2vfZ28Rsyqu3BfwfbYEyxkV9/qM3OWTsbnP5iqF1HxfxGlbf9kE+Bns
 DTyRBWNrr4EP/ifjhyMFhPyJU5S170BHaSUUgBUetXooOPFyV3SIlnG6g
 HlDe3CUIXM84s3ISLOORxMrjBOF+/E9lNC2nXRh5GGkpPXhAv1gn8uI8I g==;
X-CSE-ConnectionGUID: C5vS6JEVTuCRbbM5RLIpeg==
X-CSE-MsgGUID: G2lQjHljRo25BTwr16ZTVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1748308"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1748308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 11:31:59 -0700
X-CSE-ConnectionGUID: zPaba2thSVqb9ufPfJbzDA==
X-CSE-MsgGUID: xI/WmGJRQP6zUQ2Kj5n0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4694862"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 11:31:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 11:31:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 11:31:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 11:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHq7mS579mj9tf+zgxqqYf8S8r9HS6uhWklxrECJALxlPWPjGMtceCtYAlpUifp0+qt00JY29SQ3vQxOWgfmHhVheBLoT/Upxze5TcKnrPqB8DNa2IKbR2t3fhgZPoAffIbedfOPni5qHskGMbnApzCTOlS+ZU1NaCmTSUBl3Ugku46ZM1aXkFOjq4NRE5xsqV/GBqWZ4z5pRF+FCfIQmbDs+3PFFJdWPKAi9mI7uiqc/BloKliUPb4DVzyZkYCM8ugc0WoDtZ3NyLuccxZBohxyUuGmWKRarR081/LjgcOv369R8ZJjAs4e5mfA7PvcLDOs7V5i2lxrNQc3Mn3jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sTo3L3NEXKcvrN2NpDaPnvfb+DfZxwJfmVTY1XEzYA=;
 b=AetfL8fhDB5H6uKN3j6HUdySuM5pjaf5tqXMEJ+PkWE8cXYc6dV9LWG2FM9YCKHL37Kc+rCbmbNQoVIAMdY9qx60NhnhQzhsy3oTdP6BRUDB6+xn3KMpI6KuXAMZQhYOsG77mkv7yoVWhfjpQ5B+k84Hw/VoDDPgVjRpnDMZkzuev3duv+7cC12hRz0dDB2ocJLKlQKQBFa3Rg2uXYzS1MZ+u52YixkkRp51d0bVWibW6pj8kS/O6xmdwkouzUOT3AM1EX45CoMIMn+GHwnd8FR3xnIcAtrH4OLNaM4HPrV0ci8lNuvIoqJiyTEvo09EeaUcQanncA3jFL4gqH0MfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 18:31:54 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 18:31:52 +0000
Message-ID: <508a5fd5-5734-4eba-b93c-b247a6418476@intel.com>
Date: Tue, 27 Oct 2026 00:01:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] drm/xe/xe_ras: Report device memory errors using
 SIGID
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-22-badal.nilawar@intel.com>
 <at9L8jjWN13Z7yy-@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <at9L8jjWN13Z7yy-@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CY8PR11MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 1746c08e-2caa-47c8-5753-08df338f67a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|261021121427099003|261026140227099003|4143699003|56012099006|261022105027099003|261009223327099003|261009221227099003|261022113327099003|261009221727099003|261009220027099003|261021123027099003|10067099003|261009223027099003|18002099003|22082099003|261026121527099003|6133799003;
X-Microsoft-Antispam-Message-Info: Y9DSFVhMBSRlqZ1VbKBR4ESeC7SG79QxXypBtKsAeLdiMu2NQdkLiLBtvmfswJ5RCUS/eOyaiwHDPfHBvTBuNrWO8PeWbtt9a6kTsX1ny1KYcycgaYoFeETWvg+r31PdJPpGJBShYVFwkIjRN7JDcjiRpmLVcMQ723sI8NJGA5QEhog6RGjaIArP08ILLkPVoM6FPvTQYVTOZcU1wM4OvkM+2nlgntgZUJcOlzEF5CcY5EMdI92KO/V+Md6Ty2lvEf5WtjqUwp5DQ6xUHThyeKDO99OxxpUDkCa9SlcsDEADdl9Z1ms+CFJWpqGCfVSA+oSXFFJGoe9yUvWDG78upANGdgN2YT1fQ0AgaNzdiSJv5FPZo5GOIyvFUzWyjf3GlfmPCzHKtzuUJNKcoOa0tL7j26VM0997LBROPfL3IOTT3lR+jUpAFtCppnoj0XT0miEZeuyPGQrjwCKsw3oUgZlx0euRg27iSbcK2XLCWuQNhEErLk1oaqS+lXwWAyezVjSP7ETxe4cm8HGo5qYyujUTguQH7+mFw2s57yhaUlqlvw3qjW6ZFei7PgErmALVgKWvkCwI81byQiPBsCnLkJ4RMxvaLuP/a8la62xJvevcFt6ru9rPEF1tcIFGEhPOxvGwk+XJDL+Etvx0pkGSemWrUfRVTtwt6Eqjw0I9JoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(261021121427099003)(261026140227099003)(4143699003)(56012099006)(261022105027099003)(261009223327099003)(261009221227099003)(261022113327099003)(261009221727099003)(261009220027099003)(261021123027099003)(10067099003)(261009223027099003)(18002099003)(22082099003)(261026121527099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L01sc1ArcmZpaWRta0lrUVY3dzE4b3BXdUdIdTVBL0FXblhBamU0QnVEMS9y?=
 =?utf-8?B?UENlQXI0Rmk3Wk5VNlB6SGZWNnhyRlRtSGZJcHZaRnRkVmFwM3I4U1FWc2RH?=
 =?utf-8?B?c20zdDBRU0h3bm05dE96djFjcmFCOUlNYWF6YlJlcDl4UEkwZEphbVRrMUZm?=
 =?utf-8?B?eGl4SGQxNGg1cXFCa2ZaMFZjL2lUOW9XQmJhdUZ1QlJtVzY3K1J0amErdndx?=
 =?utf-8?B?cW5HbzZBQlFxWlpwR3Jxd3JUTGkzTVJyRG9pSmh1aSs4eE5GSkFydHIyL1V1?=
 =?utf-8?B?b0hscFpzaDNUR2E4Qy9Sc3pOWHdoM0JxUERvbVNKdnhFWEM5NjhmVEhWVks5?=
 =?utf-8?B?Q0ZwT0s2c1A2a0pjbklQR0FyNnN6MGYyZEx0bFBsQldWTkp1eEhmcnRPK0FG?=
 =?utf-8?B?YmFsUnVSUFlvMUk5T2x0a1ljVi9Pa3pYZGhOMkZEODZobFl1bmNRM0tvc2ZN?=
 =?utf-8?B?S2RiZ0hueS82NjBoY051SGFHdUQ1SE9pb1gxdml3MjJLUDViMmNCQ0d4SXlS?=
 =?utf-8?B?b2ZjZjU5M0gxQmNTVVlvSzMya0ExdHdlZlE1czFzNXJJdFRqNkR1SWEyK3Rs?=
 =?utf-8?B?QUNjdnMvdnRZVGE5RWkweGZVSEkzMFB5UXAvSmJ6cWkxU2xQdjFBblZ2YWp3?=
 =?utf-8?B?UDRTMmlQSjFxdmVUbURwdzdid0FsRGxvbE5hdy93a3NHZnlRNWhNbDdKWkdt?=
 =?utf-8?B?cU1yU1JFekY1OXEzZ0JHK213OFRHSFRpblZtY3duTk9xS093cHI2dTNDdmNT?=
 =?utf-8?B?cmJBYmcrb1VHdzdPYUpqUFBHZW5YbVBjWnFtbmtrcE9ldUlDb2dzY2Z3bmY1?=
 =?utf-8?B?NC9QQWwzTEt4Tm1CbEFmdHU5aDVVY2VVNEFJQ3B3dm9lSlZ6Qy9XVkJ0UHRM?=
 =?utf-8?B?SjBvSERJc2JTRmgrWW5VZHZzZlRkb1IvZllsZlZjbG1MK3Juak5yY0dDNENp?=
 =?utf-8?B?ZDJ1RUpzTUx3WGwxdlFTWE5CWmhLSUVXcUpLaS9kNjRyUVJySjdqWFZubktn?=
 =?utf-8?B?Mmh3M2hZNUJFZFZ4MS83Q3N0amNxcmZpd0duSnR0THJKU3FucDFuWFByanNY?=
 =?utf-8?B?dTZOdHpqRDFwTDNOWmtuVG9PUHlycURpckQxOVc4K2tuVWF2QndadE4zTGNR?=
 =?utf-8?B?d2dMYXRKVExrNzNMTktWSHJOc0xTR2s5N0J2aUFGKzZFZG5seUZ6SkV3Vklj?=
 =?utf-8?B?MGFJRHJ2dzhUZVpnK09XTm4xWHRESXE4cGZYWE1senBlZ0RLd1o4WG9aOGRU?=
 =?utf-8?B?c0hEL3BZNWdHTHFpQXQ2QlZ2L29TNFBLNW9LNVB3QkxEcVhJSlpkY3pmdWRv?=
 =?utf-8?B?TUhyeG1GYUI1YVJYNkpQay9mdWFqOXp1L1ROVnp0WE00cXo3Q045anZrWG4z?=
 =?utf-8?B?Y1B4K2VKbWVZcEFFTTExaklKMktYeUZ4RE9qT2VLVWk5aXdYMFREK2pVa2dl?=
 =?utf-8?B?RVdKdUc2Tlkwb1dVczBVVnpKNGQyZVQweER3MGdrYnloYnl3V01NMnRPcHhN?=
 =?utf-8?B?SjNIMC9IZWdUakVXNEcrWnp5Yk03N1R3UDNadk5wTFovbmdLa2h6eGR6dS9x?=
 =?utf-8?B?TUYzSkxpdXI3VlZ2MDdSSThpbkwxcmdvTmt5WFdoTUY1VkVsTHd0NGxxVEJo?=
 =?utf-8?B?dlUrWWV0OHRSSjRRRUtZTHVqR043RUoxczQvdUdmUk80MDR5d2VabkY4c3ZG?=
 =?utf-8?B?R0s3clVuUWZhMks5U3lxdklXM0lmRnIvZEFaZjJYa3ZiU0cxOXZCMTJXeVZM?=
 =?utf-8?B?S2dLcGFGOVdSREhDUEFqc29xS2swMUxLSVF3My9IdnZNVC9XU0haKzhOSFkw?=
 =?utf-8?B?STdUbEVPSVN5bkVGMHludmVHakVVTzVXM0VxYnordDRPOGlvU2lINFpmT3dS?=
 =?utf-8?B?S1FWV3N0ZFNtZ0Frd1ZmenIzMitHZ2VUTDE2YnZhS0ZmSnFYV013am9ZMzBZ?=
 =?utf-8?B?S1pVbTNGSDBCYkYweVY5U1ZyMXpEKzlvYjdQcHgvOWlnbjVMUHdjMENpMnJN?=
 =?utf-8?B?bG5oaGFna2dUdlRrZzhFdDh4cDNXaHkxTmd3QmtGUDBJK0J4eGlzMUFYSjFC?=
 =?utf-8?B?Rk9KMTVmNU81ZC8wTkRidzNGVG16RTdESUVXaFVJRjlYV3ZyNVMrZkhIdGpQ?=
 =?utf-8?B?RmkyeVZUUFpHNTVEYVcwL0c1WldqR0N4cFJNQ05iM2JQeWRHSStLWXhtNnA4?=
 =?utf-8?B?MVE5OUFtelZ2YjNzanFQc1VTemlic1Y4T2pDL1VtVysvdGFGVjJyRmhGekx2?=
 =?utf-8?B?Z0V6RFMvdzRmcmNXcjlHTjZLV1VFM29JSFl4djBlVlN1OWxwaDkzdVgxSUMx?=
 =?utf-8?B?VU5HUWtWL2Vtc2xVaEhxRWlOQVdtb3lBOUVRRFdXYTE3TTl2cTY0QT09?=
X-Exchange-RoutingPolicyChecked: 2aIr5BPHWN1Jw2ih0PUu7+XlrdnsEW5eYTFx+OQH783hlO/dlY0kKphIjPY0ETHFOl0becDrCxAdS8anlFYatIHYbPuBm3RqbPArOmjpx4EFI3nnUnVRgBQAaYaO1dCQ7FuTWUesVe56qH9mD/KnttVYfAKqVmnk4JH6BqZfuuXJGmeeFbQMp5dt1CzQPxmFSMGy2zg65zSOCTP4FYI9fNj8rM6dTJMbHCLsWQCUNxq4EKd9wN5WkIITHJlW1VGw58DIiarvooGrzbmUm0BFfn3rd2IzOYSNmqYf9J057x9tKrlg3yD4RxL5gD4IvfKYxjePVoAh0ZVLpFOWTYr6AQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1746c08e-2caa-47c8-5753-08df338f67a5
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 18:31:52.4989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teSuC7mNQKQ12k9er26A9/INz2taMVZN8pJqXnLm9K2TNBDwPkwx2c20b9oPex5nOHv5pTFFt16MmpFBxfXH1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 18:17, Raag Jadav wrote:
> On Fri, Oct 23, 2026 at 10:04:29AM +0530, Badal Nilawar wrote:
>> Use xe_log_comp_info helper to report device memory errors using the
>> corresponding SIGID.
>>
>> Example:
>> 	xe 0000:03:00.0: [drm] SIGID=202 (020100020008002000300000)
>> DEVICE_MEMORY: Double-bit ECC error detected at sw address 0x63000
>>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v5:
>>    - Log unknown memory errors
>>    - Add example log in commit message (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 20 +++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 95e87c635b04..5ebfc6e8dfc7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -643,6 +643,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>   {
>>   	struct xe_ras_memory_error *info = (void *)arr->details;
>> +	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>>   	int ret;
>>   
>>   	/*
>> @@ -654,17 +655,30 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   	 */
>>   	switch (info->category) {
>>   	case XE_RAS_MEMORY_POISON:
>> -		xe_info(xe, "[RAS]: Poison error detected\n");
>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> +				 "Poison error detected\n");
>>   		break;
>>   	case XE_RAS_MEMORY_DATA_PARITY:
>> -		xe_info(xe, "[RAS]: Data parity error detected\n");
>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> +				 "Data parity error detected\n");
>>   		break;
>>   	case XE_RAS_MEMORY_DB_ECC:
>>   		ret = handle_page_offline(xe, info->sw_address, true);
>> -		if (ret)
>> +		if (ret) {
>> +			xe_log_comp(xe, cper_sev, DEVICE_MEMORY,
>> +				    &arr->counter, sizeof(arr->counter),
>> +				    "Failed to recover double-bit ECC error at sw address 0x%llx\n",
>> +				    info->sw_address);
> Isn't handle_page_offline() already logging this? If no, shouldn't we
> try to consolidate?

It doesn't emit CPER.  I will consolidate this to

                xe_log_comp(xe, ret ? cper_sev : CPER_SEV_INFORMATIONAL, 
DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
                                          "Double-bit ECC error at sw 
address 0x%llx\n", info->sw_address);
                if (ret)
                         return XE_RAS_RECOVERY_ACTION_RESET;

Thanks,
Badal

>
>>   			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		}
>> +
>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> +				 "Double-bit ECC error at sw address 0x%llx\n",
>> +				 info->sw_address);
> Ditto.
>
> Raag
>
>>   		break;
>>   	default:
>> +		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> +			    "Unknown error detected\n");
>>   		return XE_RAS_RECOVERY_ACTION_RESET;
>>   	}
>>   
>> -- 
>> 2.54.0
>>
