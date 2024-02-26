Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44734C54E49
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 12:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF51410F164;
	Mon, 26 Feb 2024 12:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSF4VVaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3A610F161
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 12:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708951689; x=1740487689;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=lrtSczgMEM1x9lLvOE+MgFzHtjHQDEpvMfiNQqZN00c=;
 b=XSF4VVajzSdxrx1fVV+x5SsnWrL40mX1ei3iTffYUmMD3dvKn7XvXSxl
 CsT3oY8ddlfOBApowf//onl4goraRoH5M6R+IE+k3qGtPTmnKAIBXcDxP
 i/zeNMmgZb84lNBCoqG0fDTqG3qqSAtrSAjZzedbQw9crQa/0z+OZXbCO
 1FyIZAxKgyk1shmALEU3H7ete93TeBjKW3CMpiXJdH0BOisl4nNNDhT7E
 +5c+pWNbrM2e9JFSnCcu6gvQRsbzVrpVJ5z2pcrlycFFgj0tRUpjx9YBY
 jH2DhxEjxpF2+3KqA3DXiFC8aQTderwkkzsPT4+SyJ4UMPRfcahC8KLde g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658907"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="28658907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6643412"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 04:48:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 04:48:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 04:48:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 04:48:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 04:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbtTLLv2iFT5GQN1ww9w9hOr5AXPA02+8BOE1AjfLwBPq0NSpHVGf4E/8H3H1iwFE92HQndjA35NBTB/l/nLaQTJKxWK10GN+7VWxBfkMjebFANGn4DapJcKMFlZQWUbvSYWRRJGFnRX7rwe7qywGTzaFopzLfqC7xdn2F308KJJIxjHQqNES3Df2jjjcs0lslBlNxTPX5KcI3acATlUFw6JoP5npkAmDODJUuz4+YfDreF7MTdYCjXbmo86DxmnVhyBBZdt/VxicrJksrpGXTDZDkrKwGiLlG4j+iRMuwu936gPmBo5RSYtlgOpsDGzqi0fdEiiwVo5QGVuk4gNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q145kpdKXEN0ucMxjG6qyR1vJlFDE9AeWZJ1Qs6Qe4s=;
 b=TphpsJ7fRU3TKwilp6e30gEDgDijw9JfrR1ycIVMavdQlNJjrnvfWrT2mLNYG/vmyPtCDmsgmiHdMu/B3dXn2YSjZ/sTQ1P4vZhk+ENTkswgumI1eiB3fa9kNqu8LjRPeHfDd0kynQiyDxHFfehiRhbA6vidvu59U3rPKmXT6f9ryj4vlbQyjnIJQNYvk2tHym/CgQBbMfw8tz+dAhu6Ffbnbkh5PgTeq4x6pgs+QVmm6HKMqxSyzsw0mhuczsItleM/dEvqAuJcThaItVWDA9/AVKNgQZhUZchLRY/HdgpN3IPLbndYI73xMVU0qdFQzwdy2eS0b9OVnzFAHod9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Mon, 26 Feb
 2024 12:48:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3a8d:b57a:4dae:a25b]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3a8d:b57a:4dae:a25b%7]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 12:48:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <q25qxtc4giekwmmhinqndc6kwvob5hzjamwmeq2mmlikony6ht@f7olml3nfugc>
References: <20240221095556.1635644-1-dhirschfeld@habana.ai>
 <oq6jinj6fobwbqtoe5mhq3uebcqim7rc6u37tvj27j4oaqjmfk@5wzgbsobqtiz>
 <5h4x7ssbrvxklvpqm5cedhtl44so4inctmytly4ttlv5m5wjys@c2zki3kp4jbv>
 <q25qxtc4giekwmmhinqndc6kwvob5hzjamwmeq2mmlikony6ht@f7olml3nfugc>
Subject: Re: [PATCH v2] drm/xe: replace 'grouped target' in Makefile with
 pattern rule
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Date: Mon, 26 Feb 2024 09:47:58 -0300
Message-ID: <170895167882.15052.5203401390608295139@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:303:86::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: f043951f-806f-4781-9353-08dc36c92c65
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcsdtldgNhdi3oFFfYQid1E9Y12wChFaQvAvIzuTWMF4V7gPMpWYPbLRHS8FSpQU+5b9Q6fXSuqCEvbq0CG9yz/96+XauD8d9TVEpmPI4rlKyZvYtsWekAjTP1kFlWxiaGTcLU+1wM+lwLq0PCFrLTfG+KgZmPDN6KLIqVNT1CtZ1CgepPxiDxyoJhUrFWtk3w07q9YsYNHLyLqxdGZFu27oXmRMEJGxnwPkp0YjRCahVQMJ7JVD4ZTtNFjH/5MPGzxocmfikYRG5QIZjXe9qkP4kE3kOQ8nQ5o/srIHiU16dVKuRUVKkYCVB6mbCHgAVbhKaDrdJbnltN3TZc9Yxu7scjFSj3PYP7JxBBNd+PhlFS7OQ+TltMsmIhAQL4oUlQlVKD2/A4AAFNPnMA9I+JxWp64uYiAQFlQ1dAHQ0rrc8INOlJoH6wx1iC4Xb+L2tmCIf/cm//PDQbBK4FrjyFAhPc0hzl9ZYj13P+h2EFRton6JTOLjCCquJuDY7ajahQaXN9KrUNP9WLdIuWmupOsvt0EVsqzcpFv0K9XbAtkLGttvdleQMhzljNm79PoLCZHozHOVSceIzJYd4nb1z/FDVXlB1QVKeRM8Ht9pM7dHlavfDf3wIMi/NC27Dao8+UuFDWKdQvsIndsot2YB+DDTYdOcBQAJvzFpCce3M2HV6jnR/j7mqoDXDrJsgoKe/eI6FwMpT+59gDn+K5DkWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(16122699003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUd4RjN0Qk9vL2lhcWFaak9jd0VHYjlTMjRlTjJEdGdia1VjMHNGN0tYSGt2?=
 =?utf-8?B?V2tRSTZuOFM5eENOa2ZmQlYxaWp1M29PM2w1R1NpOFZjYm4xVUlJY0VoODZW?=
 =?utf-8?B?RC9HZFhFcWdhS2RLVTRRWjJPRTFWeG8vTW80OHZCaVNjKzY2SngxTUxxdDJj?=
 =?utf-8?B?NGV4eW0wTDZBOXRnNVQ3ajF5WHM2eENPN3ZKUHFKWDlyZzExQ0tNWUwvYnpo?=
 =?utf-8?B?bEJzNTRmSXNVTC9hSisvU1pNWkVrS3FkNU9DMVhtaFd6T0l2K21LSnVpU3Uw?=
 =?utf-8?B?anc2RENZVSttbmE1bEp0ajEvNDlpRFBqcEk2WU5oOGFVeUkyblVWbXRMbEJ3?=
 =?utf-8?B?clVkalo0ZzF5N2RMazNJemJITWp5RWRQa1VBZHJXekNrTzVoWFJVTXR4MUh3?=
 =?utf-8?B?V3JKWitZZGJtdWhKUUI5RkhMR2lDVUxRY3JLYU5YQTBzVUJoWGtkWWxON1lu?=
 =?utf-8?B?N1BJUWVmeHFjUWs5MVdDazZVM3hjcS9nLzhpL283Yy9PUGRHc1BlYXA2TVo0?=
 =?utf-8?B?cm1ONHJsdWRCNzFVeVJTNVZqc1ZjZ0puaVordnhmYmxXMGZJUkZNeE5wZ2hx?=
 =?utf-8?B?TzgrSXM4ZTVsQnA3YlE0Wkt4MURNbWZEaW5qanhzNlNlR1hLS0oycVpZM00r?=
 =?utf-8?B?dlJNQjJ6VkVxK1ViOGxNM0RMdkhnNG9YYUlPKytVTGVySWJFdUFsUWV6TnBk?=
 =?utf-8?B?VWthbnlDa1NNTCtFUGh6T1RjVXlnblpHTzFYVElvdnpOeHcxckRuQUFzWW1E?=
 =?utf-8?B?YmFqR0M0KzQ3NlEzaS9TT1ZTLzcxS2VOZExNcC9rRjNNKzg3YkdhUzBPSVNM?=
 =?utf-8?B?Z09wSnEyZmdYenlCYmUwMHgvWGo0S1R3R0p2Sk51b0twYmdlRVhDbnJtQlVU?=
 =?utf-8?B?bjRxSjFhbklIVjdyZDNxN1ZkeXBWK0E5RVdDM1QyaS9iVXBUVmE3UzlxTHBn?=
 =?utf-8?B?S3k5Z0loYkF3RkZUNnc4TVcwUVdzaXJmalVNdEgxV216Q1FuLzVnTVZvZzVv?=
 =?utf-8?B?YXZZMDBDVVdWNmZFVCs5T2VBZ2RxeFc3QTJ2QUtyWDA4Z21YTThVSnRxcmNW?=
 =?utf-8?B?UXhrejVvd0ZEcEtoSjBnQTJ0UkNnT1YvOVR6QnVlMGJMcmdqVGJRVTNZbzRM?=
 =?utf-8?B?a0crOXgwdjBPa0x6N0xXcjBFbFVGQ2pqWXhDRDV6SjJBVkZjSUtVSFBFd3BM?=
 =?utf-8?B?OERwRzhJU0tCenJXeFBTcVZHaVVvTXloa2ZpRG9icEJpRENxaTlrZXNtWWFa?=
 =?utf-8?B?RElWZzN5dlRFOG9lU0k0MHNzTndwT0hEa2dFOHFTaTNhQ3dpaXpCekVPQVVa?=
 =?utf-8?B?WEpYa3BWODVVdnA4N0pEbXc2RlZhMjRqZ0E1b1lINWNvK0oxSThQNVZiWE14?=
 =?utf-8?B?MWRVQmhnQjZxdkJHSFZNU0drc1h6ZkVwUDQvcUl4Z3RHNDFYRzZ4aklKT1ZM?=
 =?utf-8?B?RnpFMWNSWmxoVkhoVWhqSW9NVEpWU0JoYjVXTTVKL0xwNHBaTytkOTBHSzFk?=
 =?utf-8?B?UTB5RmpZM1NJZGxjczFOZDVCZllwWDhKZit5QzBhajZ5VnE1VkhKSVdlWmNP?=
 =?utf-8?B?cmZiNG0vWHpCVWExT3R2M0FMckpkZGJhc1E1VnpiTzVVVzBJZExaemoyM0lK?=
 =?utf-8?B?QllrSmRjL2pnSDFsWHVzWDZmOXhvbW9pcXFTeFJyMDNVQ3VuR291N2hUZGJp?=
 =?utf-8?B?MTA5Sng4bW9hR2Q1dllCazk5MlUvNEhibVYyajc0TFB1SFUwK1oxMk9SeUpL?=
 =?utf-8?B?d2txSzd4MHoxaHJudFJYZm1Xejl0OXZJMUxWNWV3UDhJUVkxV0x6U2VxZFBV?=
 =?utf-8?B?d2JGaE9TbVgwTUo0TXk0U2pJNmp0eUVCUzEwZVNBUTFHcWhqc2Vad3YyUGN2?=
 =?utf-8?B?cmJndlErMnR6dTZ0dGc2SExxb0M3ZEw1dWp1RDdIVlUyeHV2b3M4ekNJN1cy?=
 =?utf-8?B?MTNvbVFpMlY5c2JabWN0aG9rTzR6Z2FJYnR2VEZORm9ucGx2SEtyM0luYlo1?=
 =?utf-8?B?QW1ZSEtTVnIwTHpOQ1Z0VGR6QWkzUWFRK3ROVE93dnNBamJxdzI5c0ZLWGV0?=
 =?utf-8?B?RmxlU0NPZE9aY1lFNm9QQVRqcVdzaHh4RDJJMmRvemRnRGdXVmxEUjBKYTcx?=
 =?utf-8?B?Y0pLRlhGN29FYmhNVEEzZ0RLWmlLWUJTb3A3NjZhMXdmMW80elhrbCt6c0ZK?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f043951f-806f-4781-9353-08dc36c92c65
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 12:48:04.2921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mW6g/D/u6PhvhvI80JHJc7kloMuBoi/DXw9RyWPYIAy2liQjegO5NWNNb7EMxiOeTwKtsK7A5MUaa7wv6/vQvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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

Quoting Lucas De Marchi (2024-02-26 00:31:57-03:00)
>On Sun, Feb 25, 2024 at 01:07:08PM +0200, Dafna Hirschfeld wrote:
>>On 21.02.2024 23:49, Lucas De Marchi wrote:
>>>On Wed, Feb 21, 2024 at 11:55:56AM +0200, Dafna Hirschfeld wrote:
>>>>Since 'grouped target' is used only in 'make' 4.3, it should
>>>>be avoided. Replace it with 'multi-target pattern rule' which
>>>>has the same behavior.
>>>>
>>>>Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>>>---
>>>>v2 changes: instead of removing 'grouped target' we replace it with pat=
tern-rule
>>>>here is v1: https://lore.kernel.org/intel-xe/20240219135845.1463992-1-d=
hirschfeld@habana.ai/
>>>>
>>>>drivers/gpu/drm/xe/Makefile | 2 +-
>>>>1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>>index c531210695db..64903841fbd4 100644
>>>>--- a/drivers/gpu/drm/xe/Makefile
>>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>>@@ -42,7 +42,7 @@ generated_oob :=3D $(obj)/generated/xe_wa_oob.c $(obj=
)/generated/xe_wa_oob.h
>>>>quiet_cmd_wa_oob =3D GEN     $(notdir $(generated_oob))
>>>>     cmd_wa_oob =3D mkdir -p $(@D); $^ $(generated_oob)
>>>>
>>>>-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.r=
ules
>>>>+$(obj)/generated/%.c $(obj)/generated/%.h:  $(obj)/xe_gen_wa_oob $(src=
tree)/$(src)/xe_wa_oob.rules
>>>
>>>that means we can only ever have generated files for xe_wa_oob and
>>>nothing else (or we would have to change this line too.
>>>
>>>did you see any issue with the line I suggested?
>>
>>I checked your suggestion:
>>"
>>%/generated/xe_wa_oob.c %/generated/xe_wa_oob.h: $(obj)/xe_gen_wa_oob $(s=
rctree)/$(src)/xe_wa_oob.rules
>>"
>>which works as well. But the doc says "Always use $(obj) when referring t=
o generated files."
>>
>>https://www.kernel.org/doc/html/latest/kbuild/makefiles.html#custom-rules

Since "%/generated/xe_wa_oob.c
%/generated/xe_wa_oob.h: ..." is a pattern rule, it would
only "spawn" into a "real" rule when there are targets (e.g. as
pre-requisite of another rule) that match it.

As such, I think the real thing "referring to generated files" would be
explicit make targets or pre-requisites. So, I'm not sure the pattern
suggested by Lucas really breaks the rule quoted above.

That said, I think the "%/generated/xe_wa_oob.c %/generated/xe_wa_oob.h"
is susceptible to failure in following the rule on other places.

>>
>>So I think we rather keep it.
>
>humn... but % at the beginning is already globbing it.
>Note that the syntax I suggested is the very same used in /Makefile:
>
>        # This exploits the 'multi-target pattern rule' trick.
>        # The syncconfig should be executed only once to make all the targ=
ets.
>        # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
>        #
>        # Do not use $(call cmd,...) here. That would suppress prompts fro=
m syncconfig,
>        # so you cannot notice that Kconfig is waiting for the user input.
>        %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %=
/generated/rustc_cfg: $(KCONFIG_CONFIG)
>                $(Q)$(kecho) "  SYNC    $@"
>                $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
>
>Alternative would be to use
>
>        $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h:
>
>... that should also work (although ugly), but since the root Makefile
>skips it, I'd just use the very same pattern.

I do not think it is ugly. I like this one better actually, because it
looks more self-contained and would further avoid accidental matches.

--
Gustavo Sousa

>
>The syntax you used is wrong because then the rule matches any=20
>generated/*.{c,h}, even if the file has nothing to do with oob WAs.
>
>Lucas De Marchi
>
>>
>>thanks,
>>Dafna
>>
>>
>>>
>>>Lucas De Marchi
>>>
>>>>        $(call cmd,wa_oob)
>>>>
>>>>uses_generated_oob :=3D \
>>>>--=20
>>>>2.34.1
>>>>
