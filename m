Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39777CA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 11:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC32C10E23F;
	Mon, 25 Aug 2025 11:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLlY0gCa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3D010E23F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756122787; x=1787658787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/qGXUdkl8fSvA1VoHH0m59Wx67NxOSSVOex4gHr5z3A=;
 b=SLlY0gCaGYUC4Lc/GDC3IGmmqtFCV5UFkx30++uDJwT43pCgJCJZkxJa
 dyWOewRynUOPtO5AIE07LtBMaXuZxE8frPCAauyQkI8+esRDnOUT+WPMd
 TicTe4m4TPXh/Wkqb3QBNnwbqVFW0QA3XGLxgDc6tuFwxFQbJjYT+RSh9
 HVtdLwE4K5FKGG+rbWZFieds9HENs8O/K9f3lvpgaVJm0Wvnk6PH1VGyt
 DyXxPO/ZzWVt22AEa7bSgcVZl6qOWqOA9x76GMqy2w3P7h5MXP1oSYzeb
 bH1oBtkdqVKTMCVYMh18YRU30J91K6wYCLX/DQun5XQ8XmN3ni7Z25QiE g==;
X-CSE-ConnectionGUID: qDToWp31RnOAlGEbKD08aA==
X-CSE-MsgGUID: TeYHk6gFTmS4RXDj89sjDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58191650"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58191650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:53:07 -0700
X-CSE-ConnectionGUID: Fb3hhjsYTp+3pKuq6hSNeg==
X-CSE-MsgGUID: 5WGX3IyZSWOQbJXLuABHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173459174"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:53:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 04:53:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 04:53:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 04:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgxO4Lww+vDGUXndZwZHXnx8V//PRsb80c9xMoM7+PVWr+bc9JHW5ItzDS4J5X6Sujd8L0KxSLPbvlg8LZcYIw0rgSyE2ELCrWSOdX9k+AMHBMsMo5Etvh9A4m7kmPt3wGX/PxlFzh5PUcR6yfnESPMRDf1S4ZpFTLVahXdyTZuuPpYgOz0sBa+EwKZxpt1IaJrY54KXt78c+vOUBIKHvIR7RGPgW3pBJWjJy6w+LPw2bp0q39tOMiV8Wmd8HWuBD9oCk2Rvg9MP5E5AP/LJRH2GTsHN909V3b/5v7vuBKJKOND9fVooid1EHB1xqNPkSygJ47nlRDy0lxEsQUMclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkBuEdDkS/NThxX84gbbfcPOYvgHnAnaf06NpfTU/x0=;
 b=orJDJRGiRYbDtZedbC2r9I4Ouh2irzxf4ShX6lYykfD+0zZz4ynXzsaedhgVIIzTiB7uxbtcoa7n5dZf+VLn1TFdQtETLcQ6od6VPZbJYfefGGm3NhD1qPJK56ckfSK+OoS+BONq61hj/NAWYrLXqnm/GDIg0hTvVGkh0NECFXuuxlgP6fnuaHFw8/+0QrA40qFMN/IH2i3f5AAZhBb9Knav8FF8D277iS3ooe+3xb9f6JHDsLs8duDYuthhwGDer+1d63RG6NcT8QlE3RKaOpbHrAcgsqkeHWxJUo6zKYOCNwKNDhKKYkPuG1zky8zB46hWEjyLtCRAGZgirVUuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 25 Aug
 2025 11:53:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 11:53:03 +0000
Message-ID: <2cf0bc62-489e-4447-b3ea-a5716b2c3f57@intel.com>
Date: Mon, 25 Aug 2025 13:52:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/gt: Introduce runtime suspend/resume
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <matthew.brost@intel.com>
References: <20250825112025.1766637-1-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250825112025.1766637-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: ae356f8d-39b9-494a-9f59-08dde3cdf28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1NOdEpMbFBSNkxBeFE1RXFqdzZVL0hoYUZhbkJvNHpZWWx4eVhEejJtM01o?=
 =?utf-8?B?bVFybmNubmVjYlgvOTRaNHhlQ2QzellMUXJ3dGt0NlpRZW9vWDd3dzhWL1BP?=
 =?utf-8?B?L1FKRU5GVW9QbHVQdEhEdVlvdDBKVERZY1lGbWRqTU55ZEJwVjBwbEhhRXlR?=
 =?utf-8?B?YmlXVFFyY2lDcFQ3ZVJrdnV3RlR2eXpQOE41RHd6SDZvcFJySlVjRDZ6SjMr?=
 =?utf-8?B?QThiUFhqUk12d1d2TDRnQzRtYkZmNG9hRURGbytyYWE5dzE3aE9nUGg3T3Fk?=
 =?utf-8?B?SEtsOHlFMDg3VnlUa1c1YkxCakZKNGFlQWxQN2RxbjVSeXR4RnNkaDcvd2F4?=
 =?utf-8?B?ZlM0RTJiL1J1b2xVczAyMFFzdEtSWklVSUVTK3cxcEtXalhsNEQwOWo4WFBY?=
 =?utf-8?B?ZWNsY1pzdWxJSUlBODBHYTRQVkVHYzRoaU5YU0pHRU9JZGducHVKbVFpZXMx?=
 =?utf-8?B?ZUx3aVM5Tk54V3cvOGNYeGNFbzAxTm5aOVdrUENGODB1SEsxVktzV1pieVMx?=
 =?utf-8?B?b3pta1BaajVwd0xybXczRXBTSkdpTUNJVi9HT2NPVmdCZEU1TmV2NTIzdHd1?=
 =?utf-8?B?SmkrUDhqYXdIc294OGVLWmRxUWUrZmVpMDd6YlBRT2lHREtkSzFMdHMzQ1Jh?=
 =?utf-8?B?R1BDRmQxWnNSRTAxOXI2TVdUZWFnMmV3LzY4VDA5QUtpSVZjM2VOWTJmTlY5?=
 =?utf-8?B?elAxWEZIdWhyVnVSRy9pc3NFNlBiMXAxeFA2c3ptaUFiS09CUFhyR0ZPTE9h?=
 =?utf-8?B?RzNSdGtPTDlDTlBGWGcvVDEyVE1KUkFYcnkzQnBrT2phNGxoQ2w5TG9nQThM?=
 =?utf-8?B?NTFXdGhPMTFFdUNDQUVpVXV6bTFuMXBiOTQwQWQ4ZUVYeTJCMHFrT2ZGWDFB?=
 =?utf-8?B?SmNVemdNRUJDZHp5UERVRlVyNzBtak1SdFBLRFJPL1IwbDZzcjErNEJLdjll?=
 =?utf-8?B?dStqNS9tYmtTTVZhbjRpa2ZSV3NoZ2N0blBXcWQ0UHdSSUFvUm5DZFZydUFZ?=
 =?utf-8?B?UG02alNTREw2SjZoY0RDMEdaL1hPK0s1a0JibFFxbktHY2c0MTBHV29iZWRM?=
 =?utf-8?B?b1VjRDd5K2JPamF6dGNWaGVUTytnSXJtbGlXOWpwRSsxREp1ekdqdE1Xdm54?=
 =?utf-8?B?NjNkcUt3c3Vub1c2UnI2QTNCY2VSN0c5VGpvZXJvTkNyZHJUZ3hTdDg1MVpF?=
 =?utf-8?B?N0t4WW9DTVRja3MwQnBibzhZMmhQU2tVY0NaT2FmTWVxUGI3QkJYZE8rcUhQ?=
 =?utf-8?B?ZmU1aSs2OEFEMXltUTJhUHlUeWxTd29nQnRrK2toUlV5OFJKTGZGalE2TVFL?=
 =?utf-8?B?QzkrYUpXYVZCcEhrTVArQ2lZQTVzZU5RVW0rcXJlazJOdjFqb1dUNkdaeWhC?=
 =?utf-8?B?ME5mNEF2SXVLT1dqNmMyaVNlMGNOMjMwVWZnTGtyYnFUR2pyaUpVU0k3ME80?=
 =?utf-8?B?MjBUa1VIVnZCK0JuSmtTczBEYnlseUl2YUR2THFoYXJaaU9Sa2dTc2VGdFJK?=
 =?utf-8?B?UGVkZjBEV01ZSUs1VXp0N0JOcVBmanlIOGdIMUV2cGJKRFdyRUd1UWIwZlBZ?=
 =?utf-8?B?NWRWL0FDS0YxQVRGelJxUk9kU0dwb3RJVC9EYTNpZHBNaVJ6RkRLMkFmRDN1?=
 =?utf-8?B?c0pxbmNPa2JBckRXbU1IRmUyN3diS05sZWpkcXhKT2pCMVRUSFgrSmpRSElx?=
 =?utf-8?B?aWdibmowSmZXdENDVUlZWGRLY1I3ejM2MUtmdFpzcUJuLzE3Zk1TOHh0Zmhs?=
 =?utf-8?B?ZXozVWlaMDZPbnYyWFV6K3EyUm1xNVE2U2NHTVc5cy9hQ1BtbFpEMGhiL1JV?=
 =?utf-8?B?ZDRuMGV0ZXlzaGkvRUJENkhxVVVZOSt2cXJVWUlGc3orUTQvdktzdENXL1RW?=
 =?utf-8?B?ZGt0VTdLZ3RqUmlSNmhQTkRZSVVDMUNBSUtKRUZ2VEtWOGtFTnFlSXppdTlW?=
 =?utf-8?Q?hs7gFCTna6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZ3RTdvejQyTUJEOTNCMVJ5QU14L1E5UUY3OHNpYXhCQ2NXVUNYQmFDb3Zk?=
 =?utf-8?B?Tk4vbUdsQmtQMmc2V1ErN2tvdFBHZkUxZnYzVWJ0R0R4VG1iNXJ6Q2F3eWpj?=
 =?utf-8?B?djBkK2o3M21talBIdThhNlZpa2Z4QytFdS90SE5zcFlQWWRoTldrelpJdm5h?=
 =?utf-8?B?ckJGUG1YeWFlZURIa015NXBQQmtYc1g3aFhLL1hxaGduemtRS25RS0FPYmFU?=
 =?utf-8?B?T2FGWVNGbkw1OUltM21SMU1EYjRBNW93YWtzWkI5c3R4MTE0bDBTSG56U3h1?=
 =?utf-8?B?RkJPVml1dU14L1Z1M2RoeExSRXVvSDJLQmpuUzFyN2g5N1BaNnQ4M0NaZ3R6?=
 =?utf-8?B?d0Zob3ZKVGM4U0NERzZTdC9sYklhMmVvNmsyR0YyVWRYbTFGVCttTjhGd1Ax?=
 =?utf-8?B?VXdubzN4bTdxZFYvMGFzM2kxMXFVbzNDUjZGRTQybHBzQ2pldGRKRDlPWG0y?=
 =?utf-8?B?RythWUtUQ1YyMnV1Q3BjY0tZWnNzTUpGWHBxbVgzd1o4M0tkeU12ZHN5SWl1?=
 =?utf-8?B?N25OS2lNS1FEVEFmcGFFZTNCZStVSUtBYkt0WXNpcWFyOFFMbFFSYXlKV2tm?=
 =?utf-8?B?Sys4Y29VemhnY1JnenZSRk4zTU9FbmtHUDc1UWorS1A0YjVMeEFhMUJKWUtT?=
 =?utf-8?B?ckh5ZXNQNGYwQmpBVmFNK3I2MGpmWm9CVyttZGpNcC96WXhCbFlrQnBTcTBU?=
 =?utf-8?B?RlEyK1V1ZVhJVm9uV1dXcWh0d3kxQ1JmK254aEduQ1R0T2MySytBVUJtaEo2?=
 =?utf-8?B?K1VzSllUTldsYllxOGM1S3Mzb2d2VSsraVNkUGt3NG1CT0dBTXRnNUVzMWFt?=
 =?utf-8?B?bk1MM1VERUFCdGpqRFI2L3pOU0ZIV2duak9xM1VrbWVUVER6QUlpVDg5OTF2?=
 =?utf-8?B?VU9rTlJHWlovWFlIanRGcVRIOXVLeEkyNzkyU0JQQzNNSU1sR0o4bEJBY2U5?=
 =?utf-8?B?TllXYy9sVEtRTGQ5ajMxY0lJUTl0MlVLSUJ2cTI4dkhTKzBuYlR1RnluY3dt?=
 =?utf-8?B?R201WnJiOE0vcDE2YkZaU0Evakh5QmZCOTFFb2tzb0k1NWpZd250S0tHTlVi?=
 =?utf-8?B?bGZNQmhQMGlpWUZBOUVyd3gvOGtIOFc1aldXSkdJK1Z5bTZaSnhKSFVXRGZ4?=
 =?utf-8?B?RE8xdXdMaG9zUDZaMkhLcmpzNEpRbDB0UnpkNThOWHd0TlA3NFFDSlRqSmFB?=
 =?utf-8?B?WDFHMnVrM1RicUNMRW9nc1NYTGE2NlpBeFZyZE4xc05Fd2xnNUMxTDBGbnJG?=
 =?utf-8?B?cjJYOHJyUDlnZ2pnd0lleVZwVmFySURjNTNGbklTSVZNQjdldllBb2FzZks3?=
 =?utf-8?B?b21TbWMrRE9HWVBvTjExQ2E3eXM2aHAzZ1RkTXFXcVBtQmgyQTcyM0Nidmcr?=
 =?utf-8?B?b3dudk5lck0wY3hyS3kyZ2dXSXdkSW5USWo0QWxIblNxSzBZWkdoUGg4TUNQ?=
 =?utf-8?B?S2xsNjJnRnVleVgwTFVUTVpqbUpzNXpzeC84QXhGZEZ3d3VOSFhZZjRxdlAy?=
 =?utf-8?B?ODlveUFCMkN0ZFVVeHkzZTB5N1ZxYUFLMHNjSElLS3hFR2hzbm1vc2JpeUx6?=
 =?utf-8?B?WGhKYklzQzJORXJja0xST21sVjRSL0xoRWtmT2s4VGRKTG5pdlBDQmlEN3JR?=
 =?utf-8?B?V1FtR0FISWg4bDNFMlArMzhYMHNhOGJGa0VMVDg2VHNUMGM4SXdyYi9iNitz?=
 =?utf-8?B?RGlEMjR0aDg4K0gvempPYm11UnJnbExmcXhPSnp5OHRtc1pudVRzb3RoMEdQ?=
 =?utf-8?B?a0xabkJZZWs1V3VmMmk3bzJNUXMvZUtHTzU5WkdhdU5EeWczeXEraXdrVjRQ?=
 =?utf-8?B?NS9lSk5UbTFuaksxeG5Eb1BtNE9NSkJjTno4TStaRTZtUEpBdUtkQkh3NEtv?=
 =?utf-8?B?UjEybG94Smp0Zk9NTDBXWjQyaVlQdlg5YkFGYS9LZm1FbnRuTmlPSHhjQjZB?=
 =?utf-8?B?ZldMa0JoYmdvU0x5dzVDZDFvME9hWC80aW1XMXVTL1dMeldNczNtNW45QWFD?=
 =?utf-8?B?UzhNdGFEWEN6WDN6dHRHN2pHUEEwNjUvVUtmK0ZHMzF0bHhvNTdONTRlSG14?=
 =?utf-8?B?Y2Z6dVRoY3RaNUFQQTh1aTUrUEhZcjNOdEFTZkU2Umg0SUNWb3FPSFZIUEVu?=
 =?utf-8?B?bHVIWmQ1N0ltZXFnODJFZXhrcmZKNHl1MVVrbElVVkw2dXhjSHRYN2Fhd3ln?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae356f8d-39b9-494a-9f59-08dde3cdf28d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:53:03.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhUAAEhmKw7WGPQgn26m1ZXi+y8Tu9y4LvS63KKx8WecWCALCE/2q+XwFgbIjsOGsJrQMCUUNcQrpEfI75PSbilq+GKYK1Y+p+BEgaeCDAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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



On 8/25/2025 1:20 PM, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't have
> to perform full gt re-initialization. Introduce runtime helpers for gt
> which greatly reduce suspend/resume delay.
> 
> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>     Use runtime naming for guc helpers (Daniele)
>     s/xe_guc_ct_enable/xe_guc_ct_register (Daniele)
> 
> Originally-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 49 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c    | 23 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++----
>  drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++-
>  drivers/gpu/drm/xe/xe_pm.c     |  4 +--
>  drivers/gpu/drm/xe/xe_uc.c     | 19 +++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>  9 files changed, 110 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a3397f04abcc..9004af061af3 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -943,6 +943,31 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	return err;
>  }
>  

please add kernel-doc for all new public functions

> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;

this is only used in err_msg, maybe just hardcode it there
or use something else than %pe ?

note that if fw_get fails then there should be already big:

xe_gt_WARN(..."Forcewake domain%s %#x failed to acknowledge awake request

so this log with -ETIMEDOUT seems redundant

> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_msg;
> +
> +	xe_uc_runtime_suspend(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_msg:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
> +}
> +
>  void xe_gt_shutdown(struct xe_gt *gt)
>  {
>  	unsigned int fw_ref;
> @@ -1002,6 +1027,30 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  

add kernel-doc

> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;

see above comment

> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_msg;
> +
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_msg:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..3f793230e78a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -51,6 +51,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>  void xe_gt_shutdown(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37d06c51180c..70598df83ef3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1355,7 +1355,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> +	err = xe_guc_ct_register(&guc->ct);
>  	if (err)
>  		return err;
>  
> @@ -1626,6 +1626,27 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>  	}
>  }
>  

add kernel-doc

> +void xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	guc->submission_state.enabled = false;
> +
> +	/*
> +	 * Since we're already in runtime suspend path, we shouldn't have pending
> +	 * messages. But in case there turn out to be any, we'd probably want them
> +	 * to be thrown as errors for further investigation.
> +	 */
> +	xe_guc_ct_disable(&guc->ct);

maybe this should be just

	xe_guc_ct_runtime_suspend()

and then comment will be also moved to ct.c where it belongs

> +}
> +

add kernel-doc

> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	guc_enable_irq(guc);
> +	xe_guc_ct_enable(&guc->ct);
> +	guc->submission_state.enabled = true;
> +	xe_guc_submit_unpause(guc);
> +}
> +
>  void xe_guc_stop(struct xe_guc *guc)
>  {
>  	xe_guc_ct_stop(&guc->ct);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 22cf019a11bf..e3736300ffd8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> +void xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..f769245f91ae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -465,7 +465,15 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +void xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> +
> +	if (ct_needs_safe_mode(ct))
> +		ct_enter_safe_mode(ct);
> +}
> +

add kernel-doc

and maybe we should expose

	xe_guc_ct_runtime_suspend
	xe_guc_ct_runtime_resume

to make it clear when it should called and all logic related to
CT will be kept in the ct.c code

> +int xe_guc_ct_register(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -489,14 +497,11 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (err)
>  		goto err_out;
>  
> -	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> +	xe_guc_ct_enable(ct);
>  
>  	smp_mb();
>  	wake_up_all(&ct->wq);
>  
> -	if (ct_needs_safe_mode(ct))
> -		ct_enter_safe_mode(ct);
> -
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  	/*
>  	 * The CT has now been reset so the dumper can be re-armed
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..32ce578b031c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,8 +13,9 @@ struct xe_device;
>  
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> -int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +void xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +int xe_guc_ct_register(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 51ed7270994a..9a306b5fbdaa 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -495,7 +495,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out_resume;
>  	}
> @@ -558,7 +558,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>  
>  	xe_display_pm_runtime_resume(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..e0ebe5e4fc49 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -15,6 +15,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_engine_activity.h"
> +#include "xe_guc_submit.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
>  #include "xe_uc_fw.h"
> @@ -301,6 +302,24 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  

add kernel-doc

> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */

do we need this ?

> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_suspend(&uc->guc);
> +}
> +

add kernel-doc

> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_declare_wedged() - Declare UC wedged
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);

