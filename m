Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE08F94CCC
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 06:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED1C10F157;
	Wed, 22 Apr 2026 06:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWONxLM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2FE10F15A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 06:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776837929; x=1808373929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i6hr8tH7/eTXji9zjsryWjVEmZqNZVC6MVeDUoa1gw0=;
 b=GWONxLM1MQkTzThCKk5bnVjMyX2V9+RsKsRmm1IXtpUwc8mfLFnvzoiV
 Tm7JxzMr1HZOOXItTCBu6yVe+3C55UF6WP3DX8pcINAFhwuXNLWAgNMT7
 jgA8PQmfIG2iZFW56jdTXkVr+cLXfOt4/x8fy3rn199PQIbXT/12GnP2L
 CQi5Ih0r1fiRvf1r3RIL2Gt1Feyt3Wcz9WM9y4DQ1s+19qEGx6YAyfbmn
 lCjThr/yFM+mfUAcnPeH1mPb4y4JNdTU2MCJ77g0m4kx+7wkSeaYhrzIk
 C9bQjc/ILDGsM/hU3M5VF51aNMCk0Dw4GJV+4s229jYmGFtOBexIPat9x Q==;
X-CSE-ConnectionGUID: pgQvFC3jRdCP2Qn7uLvnDw==
X-CSE-MsgGUID: H/R/5exAQVqbvplLhDf3uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65319768"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="65319768"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 23:05:28 -0700
X-CSE-ConnectionGUID: sJ86srHbRu6es6Dp4zuFBg==
X-CSE-MsgGUID: Cd7232bYRbCfsRfhyMlfzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229090015"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 23:05:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 23:05:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 23:05:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 23:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PThdtFFwx2Xkm7OPx7z+Qb7YF48IVKgZS4MaTuSevXPn/XQDMbiGAWejJ3IGCxaHi7eL1KZLY+KTJtrB1whljtygRclBQ7mGnOF5WCFG2CQFhe4CmsL9/Xnza1wAIYI6uHc+YMpcJue2glMBYhV7aBGe8wOf2tkTIRUaKM4bsQ0Nww/H/jZB/MYT/iwsf+aYJb37gCYCG8FSrEZv80lvS7zvl1iU+VLfDsq960ONBvyEvprZzcrsck75n7IU00rV1KzwEK1Xa5dWtxhTAeLdp+6YgL5T3uLxiWXWzMdHjDkePaOk4tSmOlu1uIFC1EY0R+lcdLDzArrroyJZr0bTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/BCpWjw+L7Rs3LspVYKYDm+WhQtUFrm04bcAUU9Av0=;
 b=BdC8exdk+q36Vk4BWY+NrFGukJalxcIfBGE5SGsgKshveS92/fUYtaICkr2HfyLnhHAuxykRYhyOCMsaOXmgxRVE+8whfiXKx4RhcUQ45VyrLMbyK+axAwvYzowLkaiK8CC1jRSt0N2VazYbUS/D7Zhfi+XLfjuPnnaZCyyfpNMWhzjQvQzvcA6/9DwTmSrkbXcTFzztT9had168V5PFROgue2plHRcYJycvcxRJsiRW2FvIaQYxoFV2CntgtkRvHFzqes+DO8Md4WWXPNCCUrMYiB9szxzKVjFRAtXpQ7B7N3zNPiqO4j91SDOzKfZhMEUNpmSvBSgLsw5O4E0D+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 06:05:16 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 06:05:16 +0000
Message-ID: <83acf609-2ee8-4f19-8408-d0f7023b6679@intel.com>
Date: Wed, 22 Apr 2026 11:35:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan> <aeJI1WrAr33degB-@intel.com>
 <aeZFqaIlrddHmlCn@ashyti-mobl2.lan> <aeaD3n25U8LqGTM8@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <aeaD3n25U8LqGTM8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3bb64b-258d-4815-a274-08dea0351fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: He1hDEW3DIkfyKW/GWc7PLZ5/FyMwUSf5vwNrP4hNIiYSzv0Uy3lcMqXZ/FM/HsyaVfXSPtVMPmvPEwvbG6DFi52pQjKVzbU2P59D8zW0r033VGyGVU/01XH3cfGL/ibN/gh9HhcajYSU0BdagHKqYj4bQMe+blSASMJvUo8xwKBo/9H6FHwSIHaM3b8Okqmq3TOaI9alPxJQTn96pkOe7+LNPulaqXFKYYizmhYe7wrUsqemJ/G8gEwsy2J6V1B9QlxODAtVqmFpwm+ClTGpWzoVZ/xsVhn91uI7gfy2ounWJjz9XnYTQr4+pqYCHwKBPvfsBrCudWZjbm2yWhS2hlR5bNepm24ajT4fK8KOyXmGccACtY4iEIAgIQcMy0azC9mruPY5DGgc3lMhiWEXuWCR574V1sjSDcoDIJnJq1NnHsIEk8Gc3RGDF5pGnvFG1miEXTQa3eEoW3wqzvP1qV8j7iR8EESvfBbSb+MphjNtm9aHngaElIAYzscBPc4Yn9DMvqwnx613p797dly8+s2dROQMOEj2d8f+0jzsOTIMOBRcYk1fHvKil1hhdSAX2cikZWPSZ9FO1sEbP/AAv6rLwg2kIf4+T4mv58FOSC22o/0bMrrZ/2h48w5/GOUXjK3lCJzXmmqzYZW5JiQNYO8tkpSrbPS2jw+8bM1sT9tgNM8J7ai5+oIdf3WXx7IYH6xRFkgiAuGIx5Bx6JUPHyb9sssp9LpA9hnwTLBo3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEt0OWNBRnh3SCt1b0lqd3A4aXpLcGZ5RVRud0ZwOGVROURaMHhWTFZFSXlr?=
 =?utf-8?B?UHBBNGN5dDhTaDhrOGZUWGk3Nld4Z05SWC96Q0hrOThKQ3dyNzA5K0VjRDFT?=
 =?utf-8?B?QjBrTmNqa0VyZ2JtM1ZiUlQ4RUMzVVIvcEk3bzY3M1RUTk5DcFlaOE43MVpp?=
 =?utf-8?B?NDVaZmVrNnRtU3ZBc2hwUndOUGtzcHNHUXdtRVVzM0UwWElTQVFYU2FoTlp2?=
 =?utf-8?B?SFBzRHdOQU00ZGJEY2ptS2VqY09jc01UdDJuTWtpSkdQVTU0dkhFUDQ3Tk11?=
 =?utf-8?B?R3lNOE5qK0gwakpVaXF2UTR1Ylp4L21yNDJrR2VOQThIMDBhRWVmcGtrUlhT?=
 =?utf-8?B?b2M0VTFKdnVpenlGVXBiaXk1RHdqWTdKNnk2cUoxSG54Y0ZWQ20yT091aFRa?=
 =?utf-8?B?VzhDZzJRWXA4MHFUN3lldGwveit4cXJ5cm9oRVVYQVc5WkI5K2V2Q1ppZmlO?=
 =?utf-8?B?dFBHWmcxZCsrRnNhREFKbXhCLzhheG9hanJsMWlXTkdHUlNNb3hXdnNNekdW?=
 =?utf-8?B?R2pxREVSNC9oTC9zQ1g0anVrYUVuWWlwSWRUWDdnalMxTExXdXlZSWNWYkc5?=
 =?utf-8?B?M2tLVnRDdER2UFdUT2dNVzZoSVBtSlcxaGsrU05sUXROT2hReGFwYzZwTzY0?=
 =?utf-8?B?M0Rta0o0Y09IVUJ2OHhMVVBYUlVDTFpySDIrWlFKK3VoWmZUdUZra21sQU1M?=
 =?utf-8?B?ZHVQQmo5aUR4UzByb1dEWWttT0JTNXd4Y3lQN3ZWK0E5cEdkQlFtSUpQVTRs?=
 =?utf-8?B?SWFVMVJPQUJjRzNoTFFXZUJWaTFIS1Y4V3Vnd2oxd1BWTFljaHJka2tybTVE?=
 =?utf-8?B?ZTdKeG93TlAxNlQrc0sxZ2ptZmQ2OEpiUkhpb212aHFSYjRXYStqTk4ybkhT?=
 =?utf-8?B?SzVneFNkNWl5OWNzc0s2YU82dXppVGxJSkhmZ0g5dWZsRitqaXUvaUxCaWlZ?=
 =?utf-8?B?SU15ZmlLYjJoOEMza3lTQWxlbjIyaUtISFFjMTBxTDMrQURpVGRhVXVZUWZy?=
 =?utf-8?B?emk1bnhBNmR2R3F0b0dXMGhKUTJVZDl4TFBkY1lDTGJER1NVKzhFZThCRzBF?=
 =?utf-8?B?WFdoOXo3TFphMHNXNFMzNkwrbE9sVTBxbnJNVGptUmVkL0J5UlQ2TDBCMTZE?=
 =?utf-8?B?b2FuZ0xNbkpXa0IvQVlSUGxwU3pqN3FHUGo2RTd5WmlqUUpnMkVWUUhKTHVS?=
 =?utf-8?B?U0U0bzJIRDZEUnF2blFGYkxPYTdjNzczK21GQjZzUnQ5QnVnKysrTnhTU1pl?=
 =?utf-8?B?NlpSalhWUGdhQnl2Zldkc3plSHBXZ2Rsd0VIM1JpbkNNMVFJV1VMVXNVZXlB?=
 =?utf-8?B?L0hTbVB6NlFBaTNaR1BNUjlYdnREbFpVb0E0cEpheTZWOTZ2cUZ6VDBjL3Qr?=
 =?utf-8?B?a01WYk5Kek11VjRZOG5qWm5rcEcyczd0MlIvOGxBRTZhbkNhUTY0aXFuVCtQ?=
 =?utf-8?B?UlVEZm9GZmlaOWh0SlhzRmxQd0JrbDNRNlM1VUwzNHRVQk5BRUdWME15MDlr?=
 =?utf-8?B?R1ExcmMyeG5NbnkvMWo3WTVPSzJUREVNOFdCYkJ1dHV5NURlemFVU3VNckRy?=
 =?utf-8?B?R0ZZS0xJVUFPai9ZNU9xYlg0OFAreFJFcGFpeFBaRWxMb1Y1cS9tVnZCTHBu?=
 =?utf-8?B?R1IxRjBjMFpmS0p0T09mTnB5SmhkZzhXRHltSFpaUTZFMUQ1eW52TXJiQzdn?=
 =?utf-8?B?T0JsZ1pJa0wvNk1leldDNHNhVzFQQnJ5V2pmVFpISVFzcDBYTkxWb25uWHU4?=
 =?utf-8?B?aVBjTFFQWnR2eE9lMVBHbFM1UnZzcUZvVk0rMTN1Y29rMUVjSWtTUGVDV0ti?=
 =?utf-8?B?K3pxUGxibWdtR2dFT0ZreVdCdkFjZHhucWNQR2ZYci9NYkY0SHo5aVBZTWFa?=
 =?utf-8?B?MkszbnBtNUtPSlRkaDR4K2NraVFUSHlocGNxMHhKOXRydXlHWUQyamsvUTdK?=
 =?utf-8?B?NEtxVTdBWEpaMWFLVWJRZHowWHVFcjlZSUMwSG40ZE5TWnhZY3NENTh4STZZ?=
 =?utf-8?B?ditnZVVjQXNiMUEzSWRLNFFjS01JUDY0ejZEYmxGTEMvOWZsalplMGtYNnlx?=
 =?utf-8?B?ZUxXQ3dIbDBwbG1aUmluSENLQVhFakxld1Q1aEg3a3ZoSEdORDF4REVSL1BU?=
 =?utf-8?B?NGFQZUQxSTEvY0Q4UjdzT084VXJ1ZkM1MVRnTVJudTdzdndnWVRPcGFVOUpl?=
 =?utf-8?B?cmprazA0MDM3cTJLRnN4eFBEY3hpTG1KcUV0M3JrOVpha3dQQ01zVXJieHRh?=
 =?utf-8?B?c0RjUENuTy90MlM1NmRoYTNkVGwyZi9jbW43dHNrN0dBQmxKS1I3M3plcDln?=
 =?utf-8?B?Y2pjM3M4M3Z0d21uNmplQ1czU2dhdWpFcXpHY0VWa3JVZ0oxRVZkUT09?=
X-Exchange-RoutingPolicyChecked: M/xtiXTIIwONhYN+leM8Zhg06WEx7zBujIEFGlvna310/CJG+UH6JiC/tWKQf+/UmwrZVWlrj1ReWJAU70dJePQbN130ZJi1MoiYo/18Urj9AUU01DBEGivWR+KMZRPl1ofts2O2G48SjhLsrpyJfnIxER4VQv78BCDh4TECQsptEpD1dfHuhD39yWYn50t+PgMjRVIhqa/bNRtRwaebI5IHYVwlI+t8lRN50JCUoXcQZiyMXgtv/beJ8yYaEtOsC4BAwVs56QcCPcneQqXWE8z9MlhyBwDVDiYUfPIx4IyL6Mm6qdNP1F2ojJFcycLb6AoJGXHAdneNfhUMIIU8Ig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3bb64b-258d-4815-a274-08dea0351fdc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 06:05:16.5050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAQHtUOFHNLseD7bjZUaS5alpZpONaJYEi1Qr1MpSRmPBf+GDdq+zYmMKqHnz5GPeh7VQoVgKYhp1eKYEOBjnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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


On 21-04-2026 01:21, Rodrigo Vivi wrote:
> On Mon, Apr 20, 2026 at 05:26:33PM +0200, Andi Shyti wrote:
>> Hi Rodrigo,
>>
>>>>> +static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
>>>>> +static const char * const gpu_health_fmt[] = {
>>>>> +	"[%s] %s %s\n",
>>>>> +	"%s [%s] %s\n",
>>>>> +	"%s %s [%s]\n",
>>>>> +};
>>>> Please, don't use complex sentences in sysfs outputs. Use a
>>>> single string/character/value
>>> I like this one better. So we don't need to have an uAPI entry to define
>>> the meaning of 0, 1, 2.
>>>
>>> Regarding the sysfs rules, as long as it is one entry per sysfs we should
>>> be compliant with the rule. So, we should be good here.
>>>
>>> This style is consistent with the style used in /sys/power/ entries for instance:
>> Well, if it's a sysfs interface, it's a uAPI entry and needs to
>> be documented (something that I don't see in this series, BTW).
> Indeed a good point. Soham, can you please provide a documentation
> in a next revision?

Sure.

Thanks,
Soham

>
>> The sysfs interfaces don't really need to be 1, 2, etc, they can
>> also be strings, as long as userspace applications are able to
>> easily parse the content and know what to expect from them.
> Which is the case here.
> We only have these 3 states that user space can easily parse:
> [ok] warning critical
> ok [warning] critical
> ok warning [critical]
>
>> If we need two strings, then we create two files.
> This part I don't agree. This is just the same as the power cases
> which I already had pointed out.
>
> But right, you do have a point here. Different from power, we don't
> necessarily need to expose all the supported modes + the current one.
> After all, these states won't be that different from state to state.
>
> We just need to document it properly and then just print:
> either
>
> ok
> instead of
> [ok] warning critical
>
> or
> warning
> instead of
> ok [warning] critical
>
> or critical
> instead of
> ok warning [critical]
>
> The full string with all the supported modes do sound bloated for
> this case. Considering that the supported cases themselves shouldn't
> change much and that we keep that documented. My bad, I'm sorry for
> the confusion here.
>
>> If we just need to provide information to system administrators,
>> then we can either use the debugfs or procfs that don't need to
>> be considered as uAPI.
> That is not true. In many data center deployments the 'debugfs'
> is not available and the admin and cluster tools still need this
> information. It needs to be stable API.
>
>> Andi
>>
>>> $ cat /sys/power/mem_sleep
>>> [s2idle] deep
>>>
>>> $ cat /sys/power/state
>>> freeze mem disk
