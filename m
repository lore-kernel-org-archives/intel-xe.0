Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889E8CD37B5
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 07:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4857A10E4EC;
	Mon, 11 May 2026 07:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJ3DMtj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870410E4EC
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778485353; x=1810021353;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hnReVtPTSndHYpc2vv27HWptAItXrgSa302sTj8QMtQ=;
 b=aJ3DMtj5L7hHS+FHutiuOycUBJXrwHC01qYs+lzrAXx6BOoGQznhpvqt
 4vJGNw9vvaRPYfK/WS8E6SzF2pPMtFxhSTJBksAzuOZRu/WNF3gl9kh3V
 ucJVzUPsLw0Ry44v+52JgUjzO9620xcIWAu+eHaIIEDyNdX9qMLnnley5
 jms9HAshV8HzPqsttELdfqjaRt/EguesvKomsz4YDzkfH+pY6Zt2WtOyG
 vPNKBef3NDj5fkASXFybkVOl5aES57VzBwNfASWSaZXvST0ZZ595QvITM
 LsfG+UgJY/Xsmsi9rcY0HINrEEwQSXcBs5YIc+h5Djc/8yoXIB2vZu+Rh w==;
X-CSE-ConnectionGUID: z6pwZo2LSBuyDNzstcxA4g==
X-CSE-MsgGUID: zu4NjyKvS3y/A7ipEiIuWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="96790258"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="96790258"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:42:31 -0700
X-CSE-ConnectionGUID: nCF4TC0TTEezsWLr7IYXlg==
X-CSE-MsgGUID: Xw0F1F7lRgq0avEqgVCBnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237609475"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:42:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 00:42:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 00:42:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 00:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3os9tKr5jaYHLFXoZ3KtVlEKta+i4K5ru679LC1s4Bmqp4dH0OozSJj7aSWvoiUz9lELnhIPb0tvn4wzIrZug/GLPIWJD6Wa35RtMlSqsx1EEkv2dsV9zUyFXzO0Jo2eT+uJbTwPXO9v+T4S54oeGdwzOGdlG6VgqFXJWCoAZ+1DgWpce6coOye9qunWBz4taWRvG94cTpdD2MSitv3gNaJEhrr+jLwWIK/nu0tpW3NwYcGxXMcPh3gf9I7x0zznlGukhSbvPsb0BEDGEIFrhjZbfRasi4kTePq96UPiJz7UN7do/a6vOIrwwZJdFJtaoVKiCy3Po5TmpMwoqnmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txVgBeR/hi6ALDrXzk4oKZ7vokM3krfUNXH/cOD/5uQ=;
 b=RncThzws22E4FgdKz9k/NK/+HAMXLLOSqJbgxFUhYmW5BcGPgeOuRkXqlTmUz2jO4POlsK4QmVvGz0BI0Hi9EeNaDACKLh8YiLineyBD693TsUWBVD3XD0/AQWL8KAjrsFBbqnTrwR8ThyKRhDZr1rfpjOmzGs6PzqHczHJssOrHQQoGBZBJDTTKsPmxa+P5Z/yV8usIyyvebbd7/or19BupYj9otDsGxlzP+Z/jAZUrjQGFciOkLUMQXK5E5nmd/ia3nwQxXFLrPoh/UHm8tGv+jX5v+ehsUxNZjLmkZAXtkuldvDJtNAuirug4gLAaJiDRFndQ/ureIUyeFmiz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA4PR11MB9179.namprd11.prod.outlook.com (2603:10b6:208:560::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 07:42:22 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9891.020; Mon, 11 May 2026
 07:42:22 +0000
Message-ID: <50cb3787-6763-4673-a29e-b7c347a3bb75@intel.com>
Date: Mon, 11 May 2026 13:12:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/xe_ras: Add helper to clear error counter
To: "Tauro, Riana" <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-11-riana.tauro@intel.com>
 <c4df83de-8203-4b2d-b0f8-c8076fcadac6@intel.com>
 <be71197e-7cb1-4ded-b9b4-3e4b2ac200b4@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <be71197e-7cb1-4ded-b9b4-3e4b2ac200b4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0176.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA4PR11MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: c3050e26-c96c-4b7b-16c6-08deaf30d65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: fj2Q/XP8s70VCugdxLmIdPMx2+6nZCBXu3yVGZVUhg95QmaEPQmqonGncPLjKAReGLiEb5IKbiZxaoQ2OKJPf/Rm5ruR3xng6raLh005fFCBAP96C61BfA/zY2sgct2G+DHaS01+RMER7sPinLvlpA3OFDl1AeD5YXcN2XxcA6/f0JCx44dbpAbj8FeY2FXyVNk9oWP0QT8p4MA2Z6FkjsuNzHatqmjJAGb2bsKYKgBzwaEs1OcL058skVWX4lBwqO9e4TY6z/aguj160ciNFJa95PBVVOZ81Tpx3AMKsHRplKjKJ0lO8hvdm28qygiptv6bgwOiPhLmxHvmfRugU9hS4ETPRiQOr3t4mEmk4YR2qXUPUEGHr3gMsKh4jawOiVi7C7JT8cHD+foOBA5EbuCLIpOhzx9K41WH+Tpmi7jg7SxOC5DZsQ/vkrTh7rdphMRWg/DRD/QgiztqH78uyrZGnQFkA764PqPh+6Dg7fbJ9JK7OrqB0przhbx3Xcuid5EUhITWDULp9y0NUKTxfuxP7nEP4rj5ibvD19uGHUPbK12B6Jd4H1gdlX7c4Jkf4OLU5L/DcpKFSLuXNO1knZ/luQfUQ/+TUg9232RvtblDrjbGxu3hZhWAbA/fLEyLj9JJgbbPXaDX8o1UNezltiRMedhPk1Zp0AwoF56qscIShOmQqARwNdAZqxCiG5/E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm4wcFc0YlhmSTh3NG9uV0tEWDdVTHAyQldYdW55RVNWK2J3K3VvNWgzc2FH?=
 =?utf-8?B?Q0Z6dTdPWkhuQmlVNG1rODJBK1Z3dmp0bnZVUHJsaWhHSy9wSjY5bWhWQmlz?=
 =?utf-8?B?ZXF3ekVYdWM5SElkWEpiSmpvV0hoU1BSRElPVU5TRWd2MzVVbkROc0Y3Wjh0?=
 =?utf-8?B?U09YSXhsaDkwM0sva1hDMEYya0w0emZJTU1xTEVPbkFjbHBMc1ZYWHhHSnZ4?=
 =?utf-8?B?c2hlNHFtbTNHY1crWE1WZDB2ZFlpWWpGNlVRTUVXUlp4OEpZbldnK0lTcDNJ?=
 =?utf-8?B?a1ZTeG5naFVabENIUlJWanRvQlErbVd5SVVObkdLQzVjZGNaN1liM1B2Q2wx?=
 =?utf-8?B?Z2R0cUZKQXRQSS9IQ0tyUk4wN2lpanQyRmppczV3elRqVk9qbjZSV0pNcnBo?=
 =?utf-8?B?djYwdnpuNVpQZlYvR3hqaGY4b3lFdVZrRG9iU3VnQ0NueENPTmovQUJqT1c4?=
 =?utf-8?B?QklCSWVCalZzemJVcGErQ2tnYVZyZ09RdlNiMTJTSDhxa2RtL2RGWEhQUm9a?=
 =?utf-8?B?dEV2ajZlZE5qdnBNMmtHd0IvRFExNDZJUEMrNUU2SWZjZGp6Z20yN1Jxemh3?=
 =?utf-8?B?bEU0Mk9nY3F6R1FGNzdoWlhWWStkY3paaER5UGQyN25hZ2dDdDBYM3k2VUR4?=
 =?utf-8?B?c1hLQTVNOVNxdlo5cFJSVjFVRlJDUmxTbjBkSlBLd2Uyb1FVamxISU1QU0pN?=
 =?utf-8?B?RU15MTRDNzVocEtZZm1LSzJ2emx1V3JwMHJmMDM4VE9Md3EvWVozbVUrRTEv?=
 =?utf-8?B?NWEwelN6S0FieUt0SDd5SVF6UExBeWRDSFlWYmRnQnFwU0ZzakhkNVd1NGxK?=
 =?utf-8?B?aGJGc1JIYjdYSm81ejRlOWJZSkdlNlJ3T3U2Ui8rUGM4V0czMXFsOFFCTEVx?=
 =?utf-8?B?VVlzQmZHVCtIWXN0OXZBQW04ZDYxZitYektQb0ZnRDBQak1ERXFESU9kbStH?=
 =?utf-8?B?ZlVoYzIrR3hrU3dMTTdSdWNQNDdjc2QwaEp3bm0wYnRFaHNHUlhnUDZ2K0pY?=
 =?utf-8?B?d1pFWUthZkFEbzJiSmdzN1FNTTN6N1I4MWJ3T1pJcXZsdmZYSUlwY1dCVWFS?=
 =?utf-8?B?R1BJb1RGRzV5ejJyYWppWXBFanZDaHdFVzc4V1lvRHVYaDRCN0NxWjZMaCtl?=
 =?utf-8?B?SE8rK0dWNDBMdWRGb1cxL21EOU1WVGpSWEdoaTlqdlgyQStOWHFMYnltTzFM?=
 =?utf-8?B?dmZ0QmZnalRnNm43Q1BTc1djellhWTI2cHVHQ3o3U3NrdytYcGc5MHBSZ0pO?=
 =?utf-8?B?YVlJdlhnQkxJL0VWTVJVcUpKbFg3eC9MQUxNdXAyN0N0c3l4Y0VwS0FzTmZV?=
 =?utf-8?B?cGpjMjhQQStBQzRrZEwvcnhKa3I1VG10Z1o2bDBES2hKN2tIaVlOWktlYUtn?=
 =?utf-8?B?N1FQelN3V251Q2d6V3c0YitFWHBUTnRNWXZOR0V2UVRnekxNRFcwamZlVkg3?=
 =?utf-8?B?L09CZThkMHduTWQ5ZW9tQVppRDhzQjBFdnRZK3VHekFFNisrWk1ScVgxb2g5?=
 =?utf-8?B?d2JIbmVhN2RwTHc0VGE2eVZKNlZ0WThWaC81ay9RS2RQaDJaL2EwT0RxZ0V3?=
 =?utf-8?B?RjZJYnVDWlpiNjRjVndBeHpTY1NXR2o4aTZaRVQxczJWa28ycmY3cHV6eU9n?=
 =?utf-8?B?cW16ZW4zQnR2dEhSMU9CYk5uM013WHZFYkNGSnA2NHZCR1dqRnNONGJaa3hK?=
 =?utf-8?B?U3o5aUpVM1JJczhoNDBPU2NGYkduTnpSRTlycUhjNjdOUk1XNnhKNmF2VDdx?=
 =?utf-8?B?eERvZnlpRUM0Z1VYMWdCc2w4Ui8xSVdMTEc3NEpHRTNqd1N5OFNDc3pobEJw?=
 =?utf-8?B?dXdobnk1VFlEd05JbnVkcUROR3pyMDVwZFB1dk5HcEQ2RXRmNHl2QnA0cEpz?=
 =?utf-8?B?OG10b001b3dmSTN6ZVpiZU1pRWxiZnBxcHF1WXJvUXgzWFo4bG1VNExMZ3hh?=
 =?utf-8?B?c3BSL0F4eG5yYm8rd0graGd6SGd0b0JEdXNEZVljVnJQL0dsLzRUZFVZRWJq?=
 =?utf-8?B?eEU3L0RvR1d3UmJkcEtPckpBd1lyeVowZGNwUVV1NHo2S0REV0tzNVJwdUE1?=
 =?utf-8?B?Z3JDVjdtUnJCTmtQenY0bThXbFBSQ0l4NUNFLzB0UjNHMk1DSGhoWkRIbzN3?=
 =?utf-8?B?bE0vL3I2RmF6eGRQcjBIalBKWW4yaWdDSXZJeUpscHV4ZG1VOTRpMnhvempR?=
 =?utf-8?B?RWlyYWVVdThCOXgwemFVWUJQK01qOHc5Vmd6bE10cytxalIrWWlZRU96T1FS?=
 =?utf-8?B?WGNkU29BK0ZqNnpwcnpYN2F3dlFjOGx5UHZma2pKeEJZemtxcHJwYk1yUVEw?=
 =?utf-8?B?Ly8yVzh3alFzNzRqQ0R1dG02dHRXM0hGTUVHM1NaVDg4djF6WWcwekVmSXov?=
 =?utf-8?Q?FLYCRhpN/XoKzBlg=3D?=
X-Exchange-RoutingPolicyChecked: qT5XcLuOn2iAq5DN1n3ffdvsdtGamnnim3Rkojv197s3eM4GqTe/kZhRoGKoQ2LS5qP5OTwUuqwl5S0IDyQEw0Sj0ovzg3FvlPmnlfyig0+jRA25oNst2DWlAwhgDj50xwxCj2TqtD2b+bbS9JOIDT9xcloxnPDz032Y1+m1wqaMBztAuNPaoB/XQgE47j3CHSgpB0+BiP7e+CJhQAzJUW6BgOgvXy0ZOQW1nwQofyTNyCXNwhERvtc7Izo5wKH8NtgFF8mqpIkThB8CMo79wF8vwtcheujmleyYrI7wXWVxydTPvGSuiQL8bh1OaPPc9qO9hSSZJRUylKcEDqX9kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3050e26-c96c-4b7b-16c6-08deaf30d65c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:42:22.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WpF/jH3TQWMMvpzeA9U1gQwQYidH9RM3EFAcx2eUKzNyHZgW/ep9i49OM/42ib/OJF8jRVTGN5B28lPUz3bNPgAN9DPRUbwgG5mcNERwqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9179
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

Hi Riana,

On 11-05-2026 11:50 am, Tauro, Riana wrote:
> Hi Mallesh
>
> On 5/8/2026 1:20 PM, Mallesh, Koujalagi wrote:
>>
>> On 04-05-2026 12:26 pm, Riana Tauro wrote:
>>> Add structures and helper function to clear error counter value.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: add status codes (Aravind)
>>>      fix log message
>>>      squash structure patch (Raag)
>>>
>>> v3: rename function
>>>      add comma to enum members to avoid
>>>      redundant churn
>>>      align with tabs (Raag)
>>>
>>> v4: rebase
>>> ---
>>>   drivers/gpu/drm/xe/xe_ras.c                   | 76 
>>> +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras.h                   |  2 +
>>>   drivers/gpu/drm/xe/xe_ras_types.h             | 25 ++++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>>>   4 files changed, 105 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 47a58ce3b3ca..07f6837694e7 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -34,6 +34,17 @@ enum xe_ras_component {
>>>       XE_RAS_COMP_MAX
>>>   };
>>>   +/* RAS response status codes */
>>> +enum xe_ras_response_status {
>>> +    XE_RAS_STATUS_SUCCESS = 0,
>>> +    XE_RAS_STATUS_INVALID_PARAM,
>>> +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
>>> +    XE_RAS_STATUS_TIMEOUT,
>>> +    XE_RAS_STATUS_HARDWARE_FAILURE,
>>> +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>>> +    XE_RAS_STATUS_UNKNOWN_ERROR
>>> +};
>> Add XE_RAS_STATUS_MAX right
>>> +
>>>   static const char *const xe_ras_severities[] = {
>>>       [XE_RAS_SEV_NOT_SUPPORTED]        = "Not Supported",
>>>       [XE_RAS_SEV_CORRECTABLE]        = "Correctable Error",
>>> @@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
>>>   };
>>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>>   +static const int ras_status_to_errno_map[] = {
>>> +    [XE_RAS_STATUS_SUCCESS]            = 0,
>>> +    [XE_RAS_STATUS_INVALID_PARAM]        = -EINVAL,
>>> +    [XE_RAS_STATUS_OP_NOT_SUPPORTED]    = -EOPNOTSUPP,
>>> +    [XE_RAS_STATUS_TIMEOUT]            = -ETIMEDOUT,
>>> +    [XE_RAS_STATUS_HARDWARE_FAILURE]    = -EIO,
>>> +    [XE_RAS_STATUS_INSUFFICIENT_RESOURCES]    = -ENAVAIL,
>>> +    [XE_RAS_STATUS_UNKNOWN_ERROR]        = -ENODATA
>>
>> Are ENAVAIL(No XENIX semaphores available)/ENODATA(No data available) 
>> correct errno choice?
>
> This is the closest error code i could find. Let me know if you have 
> any suggestions.

We can use (suggestion):

[XE_RAS_STATUS_INSUFFICIENT_RESOURCES] = -ENOSPC

-"No Space left": Standard kernel convention for "resource exhausted"

[XE_RAS_STATUS_UNKNOWN_ERROR]          = -EIO,

- "I/O error": Catch all firmware/hardware failure.

>
>>
>>> +};
>>> +
>>>   /* Mapping from drm_xe_ras_error_component to xe_ras_component */
>>>   static const int drm_to_xe_ras_component[] = {
>>>       [DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]    = XE_RAS_COMP_CORE_COMPUTE,
>>> @@ -70,6 +91,13 @@ static const int drm_to_xe_ras_severity[] = {
>>>   };
>>>   static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == 
>>> DRM_XE_RAS_ERR_SEV_MAX);
>>>   +static int ras_status_to_errno(enum xe_ras_response_status status)
>>> +{
>>> +    if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
>>> +        status = XE_RAS_STATUS_UNKNOWN_ERROR;
>>> +
>>
>> Check status against XE_RAS_STASTUS_MAX, if it failed log in and 
>> provide -EIO and return.
>
>
> Why? Unknown error makes sense too right? Any error above the enum 
> range is unknown.

Out of range status, we are clamping it silently (Unknown error). We 
need to log it (status) immediately which make sense to debug issue.

Thanks,

-/Mallesh

> Thanks
> Riana
>
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>> +    return ras_status_to_errno_map[status];
>>> +}
>>>   static inline const char *sev_to_str(u8 severity)
>>>   {
>>>       if (severity >= XE_RAS_SEV_MAX)
>>> @@ -182,3 +210,51 @@ int xe_ras_get_counter(struct xe_device *xe, 
>>> enum drm_xe_ras_error_severity seve
>>>       guard(xe_pm_runtime)(xe);
>>>       return get_counter(xe, &error_class, value);
>>>   }
>>> +
>>> +/**
>>> + * xe_ras_clear_counter() - Clear error counter value
>>> + * @xe: xe device instance
>>> + * @severity: Error severity level to be cleared
>>> + * @error_id: Error component to be cleared
>>> + *
>>> + * This function clears the value of a specific error counter based on
>>> + * the error severity and component.
>>> + *
>>> + * Return: 0 on success, negative error code on failure.
>>> + */
>>> +int xe_ras_clear_counter(struct xe_device *xe, enum 
>>> drm_xe_ras_error_severity severity,
>>> +             u32 error_id)
>>> +{
>>> +    struct xe_ras_clear_counter_response response = {0};
>>> +    struct xe_ras_clear_counter_request request = {0};
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_error_class *error_class;
>>> +    size_t rlen;
>>> +    int ret;
>>> +
>>> +    error_class = &request.error_class;
>>> +    error_class->common.severity = drm_to_xe_ras_severity[severity];
>>> +    error_class->common.component = drm_to_xe_ras_component[error_id];
>>> +
>>> +    prepare_ras_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, 
>>> &request, sizeof(request),
>>> +                &response, sizeof(response));
>>> +
>>> +    guard(xe_pm_runtime)(xe);
>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +    if (ret) {
>>> +        xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (rlen != sizeof(response)) {
>>> +        xe_err(xe, "sysctrl: unexpected clear counter response 
>>> length %zu (expected %zu)\n",
>>> +               rlen, sizeof(response));
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    ret = ras_status_to_errno(response.status);
>>> +    if (ret)
>>> +        xe_err(xe, "sysctrl: clear counter command failed with 
>>> status %d\n", ret);
>>> +
>>> +    return ret;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>> index 74582c911b02..bbb9d42bd128 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>> @@ -15,5 +15,7 @@ void xe_ras_counter_threshold_crossed(struct 
>>> xe_device *xe,
>>>                         struct xe_sysctrl_event_response *response);
>>>   int xe_ras_get_counter(struct xe_device *xe, enum 
>>> drm_xe_ras_error_severity severity,
>>>                  u32 error_id, u32 *value);
>>> +int xe_ras_clear_counter(struct xe_device *xe, enum 
>>> drm_xe_ras_error_severity severity,
>>> +             u32 error_id);
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>> index 74d85875cd63..44369fc8ef03 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -100,4 +100,29 @@ struct xe_ras_get_counter_response {
>>>       u32 reserved1[56];
>>>   } __packed;
>>>   +/**
>>> + * struct xe_ras_clear_counter_request - Request for clearing an 
>>> error counter
>>> + */
>>> +struct xe_ras_clear_counter_request {
>>> +    /** @error_class: Counter class to be cleared */
>>> +    struct xe_ras_error_class error_class;
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_clear_counter_response - Response after clearing 
>>> an error counter
>>> + */
>>> +struct xe_ras_clear_counter_response {
>>> +    /** @error_class: Counter class that was cleared */
>>> +    struct xe_ras_error_class error_class;
>>> +    /** @previous_counter_value: Counter value before clearing */
>>> +    u32 previous_counter_value;
>>> +    /** @clear_timestamp: Timestamp when the counter was cleared */
>>> +    u64 clear_timestamp;
>>> +    /** @status: Status of the clear operation */
>>> +    u32 status;
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved[3];
>>> +} __packed;
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index b315847cbf64..6e3753554510 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -23,10 +23,12 @@ enum xe_sysctrl_group {
>>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>>    *
>>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>    */
>>>   enum xe_sysctrl_gfsp_cmd {
>>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>> +    XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>>   };
