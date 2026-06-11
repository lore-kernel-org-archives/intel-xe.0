Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C62DCD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 09:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D296010EDA3;
	Thu, 11 Jun 2026 09:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUqqw9pj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079DE10ED99
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 09:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781168904; x=1812704904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=opJHQL1iop/OWicor3b4qmFMzm92Jf/asVio7NoqCxU=;
 b=LUqqw9pjeQWdIZVkc9k3dvm8HCU6JYJgBTJ6Ukq6XjbNfZItEOdzE9Jz
 KjaCCG3QzuUUhHAdAkBqQBJ3jX27ZHdvjxcixRz5lNLnRYM92EIFx7K8D
 m8+LX9/yUafz1eYTqx3brnlturzS5nT+PvoY1/RhQlXF+STk3MAOTEZSt
 1lCtLyhZNWSeEEee+HagUqkixdnQsY07SsJEQ8GblJS23wCbhrDnprcBv
 2lilldTXXDY4lUJHCI03eMwB4RFX592nV07qZoZ+lZe3A0urmfouYftdP
 JVzV/Asb1JlRy8ElJiTyKNzq2ZpU4BoUSBhgC/SGy20jxaH5QS2VAfRPn A==;
X-CSE-ConnectionGUID: 09dFCEzUTRG12qYuLyXQuQ==
X-CSE-MsgGUID: XfZaFAlCQ9+uGtDnuTKqdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69521501"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="69521501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:08:15 -0700
X-CSE-ConnectionGUID: NV0shBmvTSic9bnIfbQtqA==
X-CSE-MsgGUID: KdHmn5dPTOSRBO2oyGHszw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="242282432"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:08:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 02:08:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 02:08:14 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 02:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDlLDOPsuBF3m9t2+MjJ4rnzH1NRCljv2Q18TE70bOlymacGkdy3mijHlw40ma2DDIvw1wuHTVPvup8nkd+1KXb/YElI5rcsXqAuKspWj88a2YyJanuXOZppZQLClhZYGaA7eFSKTzqecBRYPAk+V3TzBOx9Mu9tdkW3YH68nxGWVOVcIX50pWHtrjR8wGzno47gCDPTtM6M5X8PO9PQsUsyl+jhDs5qdYLWs0UlccXpOTUe/koY5IFnEdDsARYB9hqG9Jj7/z543GSp7VOnCqI5iYxOf60+WoAzzE2kk/5RUDg5alo1mxsZc3y804GSsNOsqq6y73YT/yvYbcxcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyEUtBck7SIomLM8gFuGy43YfXhuvGOCRGrAIDLN/h8=;
 b=cTd3YjzofoJ/OuYpKhaIDkZ/+HdyfcIJdYe5+dSzubOawI5+xe17CKxyHxj7IRz0wog071XRrq863ZlVuN0bdyMzO0/AyYYob/PuU6J2nfpE8Fbl/AEo06wUrfS9HsAHGoPZ7sv559zlXzxplxVYRpeoJ+EbccCldSGjcHCAawneBrumH6xCQjDmNe+akGmoER8bV36L+XF3/LHOMqxBjgHgy5aQUVP2fGoTLkxkISlQQr9OcGjD3GJ5KO97ueraklV325IMdnaxalp/uZ3daQ22qIjZbAlqTQ5zynAcN2ji0kNjkPkv4ghVyV+D+CZOpeAunhPVIRaaNux/m4whhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 09:08:10 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 09:08:10 +0000
Message-ID: <13c9e066-c415-4467-aa79-9650a26f0818@intel.com>
Date: Thu, 11 Jun 2026 14:38:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Avoid self-deadlock in queue destruction
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260610120945.1726638-1-arvind.yadav@intel.com>
 <aimLsPSqWY7rUjCS@gsse-cloud1.jf.intel.com>
 <aimPcuW9zjRuFOzD@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aimPcuW9zjRuFOzD@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: b2aff634-b334-4a48-43c3-08dec798f589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PrOThqlpAr4W0TggWIYOElKNSggO6VUa3fxOqlLDwp+yF+hjJbsJvHPoWM4gS/GkogWOQku+hh561BUCbxbaV30Cx8Mwe8qxQThEOih/PMnnnXp1VOZGR0O6uy35EL7Rv2BFMQ2yywEoz51c0M3Xw29O7LIHsK3UFRHczyIOOBIS8hLUuYQFh8khPFHsJPnLGIjYIIzTCF0uaOgLTBxqEWnoutMTkNgbrTL5c5SrHhSS4+7QlfPkIdARwihYlRcwPKAKouBKEsWgqO7MjzgzEqcqrATMr1uEWqkKBzYSgk9QqREY2yA6A7OtEJnGG0CmXGsdUGJAFxUtq9UwFhwsdpPOazSI6lI2kZh+LVgH120PLpMGsQvpi1jnwlSxbs79hCMVFkxjeSsA1QbTLdH551N3mngRC3WIqLwrtL/8I/QnRjUJNYLZg2sAqoxq2zvUWYu2uprev9AfnU2DnBYkiWorzM0ZQZ2gUpOA7Wh+/pHdxlRdNJX4AiOVcN4VB2tTjWK++3FFnNtzi+Wh7DGZOQrCHCIcsIMkBRQniTaO/87TSjTDKAUqdXI3Rb9YHRGkRQ5AcswYPP127S8kSFtIND3tHtsUaiFywLW5fsBxSXzoTdxQWMPvH1ucsSBMsDDqwipEhqhkEoQiA4l07J8S2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M05ja0tVMERFVjE4NDVMNVJGRFJ6clBuZGxZNU5FaUVkNnZxNW1pYzg0TlRI?=
 =?utf-8?B?RGhxZHA1RnpzSW80a0paa1hXQ3J6aDF3TWNxdU53c3RJbUlvMTZFTVB1M1ZY?=
 =?utf-8?B?cFFhSklxTTRzeXF3blpCM2FXd1BGQm5EQVFNWDBNNWZJemwrUTloclllaUFV?=
 =?utf-8?B?MlNwNktLdGxUWkhVbXJQcHNXWFkwMGtCeFdWMzdGRldpL2F5OHpybm0zNXE1?=
 =?utf-8?B?ZXFqQUx3M2tkbXhxNWhpelAwak9naHdEYmVLYTFWZ1p3NnRSb1NHbjlVUzhV?=
 =?utf-8?B?VmhPbFVJUUJiSzFtQUdlaitaQ1UvREdrem52anVNTzFaaUJoNG5nV3U5R1Vh?=
 =?utf-8?B?WkxLdDJST2VjYVJvcG5VdWNPQ1pZM3k0RlcrcUFzQXMwcUhVRUtreDQ2SHYx?=
 =?utf-8?B?MExPNC92Zk5kQTAxbW5BNXB1NnRiRWpnL2V2NWx4Y1VkV0hLa01tQlkyLzVy?=
 =?utf-8?B?ZmdDbXRNb0dhUmZvTU1IUW1WblMrLzJWRHVlQy9VblJ6dy9oVEY2K0FVR2E0?=
 =?utf-8?B?cEUwKzh2TFhHOWJzYXlxVjVJM3R2S0lrMlRrUUVYZHRJZFR0bVJTNnNrZUdO?=
 =?utf-8?B?L0UvZUtYSlgxeWQvY1JlWWQ1eWxLZEptc0NpWXQyYjVYNGlubnN4NkJsM3Ru?=
 =?utf-8?B?dTd2SWxtUGhad0I2ZDE0aDFkQzg4a1BmS2UrU3g3UTFpNTBmSmpud3YxaFpY?=
 =?utf-8?B?NmF0eWlqSGhiUXhxNGVML0s0Wnk1ZDQ5VDRTSFFxNk52SlZ1K0VlK3ZidUk0?=
 =?utf-8?B?NmMvS25xZVQ0bjRVeFRRQ1F6Kyt3Sm5YSURESnlEWVBaS3ZVQkVUWmFYOG5P?=
 =?utf-8?B?T05CSUpneGI3dXVrcjZTWnNOa0pmWDZLd1ZmV2RXdDE3enE5OGoydG5meG1U?=
 =?utf-8?B?UFlsTHY0cmIybWVCTVlmRGNDZm9xaGhKb1hVMGZhSnVMK0w3VVVSYkhRMWRs?=
 =?utf-8?B?SjFpN2tQKzh3QmhwWmJGdmdyQW1MeElJRmZQQXpEUjVEZEhmbUd1c0N1bWM1?=
 =?utf-8?B?NDF3elFUYkZvVDdrQU9xc25kd1BHUFh0R3lHQ2R6aUdqTDVsQ0NSMmFOaVhH?=
 =?utf-8?B?QnJLTWNwd1NSbG9SRjdlazRsT1g0V0FIZHM3YVdlNU52eC8wb3FKa2JuNHVu?=
 =?utf-8?B?ZkxHNHdtcE9hLzg5cmlRQ1BiZHBNUlMvb1kvR1NlM3FacExyQVJaekVWL0Jy?=
 =?utf-8?B?dFpRSFlHK2UwK05PdmJqUWtBQUMxZTBEZkFNZWVQK2xmS1NuaUMxd3M2RW1E?=
 =?utf-8?B?cDR3UlpxSlZkU3RpQkswRGRiMXFrTUF4ekVFaDNhcWZaRjM5Nk0rTDZuTXZt?=
 =?utf-8?B?TWdMS2Vva2dUdDJsTHNsOEZxaDRGMjVaY09RUVNpTnJ3ekozUllvV1FwNk9x?=
 =?utf-8?B?UFd6aVdHb2NZaEFVNlhYZDhBNS9nbG5kTUVkME5Ub3J2Nm1BcnlpbTdaTlJG?=
 =?utf-8?B?dWM5ZDNyNlRVcUo5TDRxS1d6TWlDK3BKZjVQaHBrTXY4WGJpT01YZ3FVdkJZ?=
 =?utf-8?B?c2FpS2VISE5vTjFwNTRCcmt5VThlajB5WFQ4QXVJSmZaRnFoZ2JndUlTaTZY?=
 =?utf-8?B?a2xaQ29xenN0blQ4SS83VEVvRUJpaVlnRks1VkYvSldyVjZDaW04cU1MYnEz?=
 =?utf-8?B?eENMdXpweHEvMUJoQW1zbGZOOEwyYlNtenZ6a3lKS3prSjVkTFMya2FlZW9I?=
 =?utf-8?B?SmlOWlNIL01KR2dSMldwNER2MFJueXk5UDgrZ3A2MWhJMnJ5STM5UWJ2SWow?=
 =?utf-8?B?cTVlM3dPNmtUMndHc3VoTDhrRXl0dmd0M1VDTEdKM0ZhbFMwSXdNR1JlVVQy?=
 =?utf-8?B?RklXRW43MGpLUFBRTG55dkdGMkE3d1YvMnNWVWNhU2xFU3ZWZzhLSy90S04x?=
 =?utf-8?B?REl3KzhJSDB0RVJHQXJXMGVibmNuSnQvYUJYY3NHSHR0bVNsTmZPS0dzSmtS?=
 =?utf-8?B?cDk0cTBGS1hyWmFOYkFtZ2ZwalJSckJnUU44azN1NlJoUGR6YkdiWGcrR1pO?=
 =?utf-8?B?UkFLUGc2SWN2MElScWU0L2w4bEJwZ1kxOTRPVjRjSSsyZjlOR0diclEwdkJs?=
 =?utf-8?B?UDErOE5kbmpjbS9vQ01uaDdwbmNUV0JWaWZqVVlYNC8yRjFjSzlITEdwejVG?=
 =?utf-8?B?RGE3ekRUZDNDNnN1NnVOUk80dDJ2Rk5pQlA2OSs1aW1IcVQ0TlljYWJZNlQv?=
 =?utf-8?B?UWZuVDdxc1BIRExmNEcwcm9ESjUxSDNCUnFLRktYd1BBd3NHOG1ZZ1JFREUw?=
 =?utf-8?B?T3gyOElFL0RTZUFTcXVpWHllU1VqM3hSSHRtYktWd3NhWE1idlZQcW8vZFEr?=
 =?utf-8?B?aEtmOWdSL0E2QWxGSnNhVk1xc0t6bUt1dTM3SHNmbk0xWVBZWVUwUT09?=
X-Exchange-RoutingPolicyChecked: q+/dIETuuM+IT0tMKm1tOu5mKD776gI1+/mkotHU/ic2dkP29rQwUYnxb6EI5NwV+lmoGStmbcjGmW0evzAWWZ/d2gRQa9upQhM8TvhV+ta4WUowamwx44DXT/PCeCdF0t/9LmQpE0qIw1rbUtLey3+xTrv1Dwe6gktyDy/8X+7tj4BFzg2knaAg8fvmN8ELWWKS3ICRLBWUHxHl68QqFpBRM6GlQNO66OEIHK9ZWOf4S6ZlNc8/IXfMWfmqGwLExQGlzo0zDnyl3HHsL7QEolYSjV6wCR/vXoFEWhOaDQ4QMkKb7xJ/J8YVkGo4ne+BvB5RUNxXHqj98Ljy4gDhag==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2aff634-b334-4a48-43c3-08dec798f589
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:08:10.4891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsfBoYCnRY372rG+y7MExeAsCfbeGoUplZtvn+ySrkBFvSOALZPJ+o2p8sS/6KRqLwA5bz2WRkxHIT4Tp2MQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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


On 10-06-2026 21:53, Matthew Brost wrote:
> On Wed, Jun 10, 2026 at 09:07:12AM -0700, Matthew Brost wrote:
>> On Wed, Jun 10, 2026 at 05:39:45PM +0530, Arvind Yadav wrote:
>>> GuC exec queue destruction can run on xe->destroy_wq. During queue
>>> cleanup, xe_exec_queue_fini() can drop the last reference to objects
>>> which eventually release the DRM device and run drmm cleanup actions.
>>>
>>> guc_submit_sw_fini(), registered as a drmm action, drains
>>> xe->destroy_wq. If the final drm_dev_put() happens from an
>>> xe->destroy_wq worker, teardown can try to drain the same workqueue
>>> the current worker is running on, causing a self-deadlock.
>>>
>>> Fix this by taking an extra drm_device reference across async exec queue
>>> cleanup and dropping it from system_dfl_wq. The deferred put work is
>>> preallocated during queue init, so the destroy path does not need a
>>> failing or nofail allocation.
>>>
>> I’m convinced an extra worker is required here.
>>
>> The teardown sequence is a mess, but in the DRM dep work [1] I was able
>> to move xe->destroy_wq into the DRM dep layer [2] (see
>> drm_dep_queue_free_work). I also called drm_dev_get on each queue
>> creation and dropped it in drm_dep_queue_free_work via
>> drm_dep_queue_free(). It all seemed to work without an additional
>> worker.
>>
>> In [3], I refactored the Xe object model on top of DRM dep using the DRM
>> worker. I was also able to drop the wait_event_timeout in
>> guc_submit_sw_fini [4] around the async release of GuC IDs, because the
>> drm_dep_get on the queue prevented guc_submit_sw_fini from running until
>> all queues had dropped their drm_dev reference.
>>
>> I do plan to respin DRM dep in the next few weeks, but given that this
>> is common DRM code, it may take a while to merge.
>>
>> That said, I don’t see why we can’t merge the DRM dep drm_dev_get/put
>> model ahead that, hook a drm_dev_get into exec queue creation, drop it
>> as the final action of guc_exec_queue_fini, and remove the
>> wait_event_timeout in guc_submit_sw_fini. I think that would work and is
>> simpler than what this patch is doing (i.e., it should only be 2 lines
>> of code for drm_dev_get/put + delete some unused code).
>>
> Sorry for the double reply—I missed a key part of this.
>
> The DRM dep worker that executes drm_dep_queue_free_work is a DRM dep
> module worker (see dep_free_wq in [1]), which is created and destroyed
> during module load/unlaod. We would need to move xe->destroy_wq into the
> Xe module as well, or simply drop it and use system_dfl_wq for the async
> queue teardown step. So I guess it’s a little more than two lines of
> code, but still relatively straightforward.
>
> Matt


Thanks Matt, For this suggestion.
  I agree this is cleaner than adding a separate deferred 
`drm_dev_put()` worker.
  I will take a `drm_dev_get()` when the GuC exec queue is created and 
drop `drm_dev_put()` during final queue teardown. I will also move the 
async destroy work off `xe->destroy_wq` and use `system_dfl_wq`, so the 
final queue put cannot run from the workqueue that 
`guc_submit_sw_fini()` drains.
I will keep the `guc_submit_sw_fini()` sequence unchanged for now and 
only revisit the `wait_event_timeout()` cleanup separately if it is 
clearly no longer needed.

Thanks for the pointer,

~Arvind



>> Matt
>>
>> [1] https://patchwork.freedesktop.org/series/163245/
>> [2] https://patchwork.freedesktop.org/patch/711933/?series=163245&rev=1
>> [3] https://patchwork.freedesktop.org/patch/711937/?series=163245&rev=1
>> [4] https://patchwork.freedesktop.org/patch/711934/?series=163245&rev=1
>>
>>> This keeps the final drm_dev_put() out of xe->destroy_wq while preserving
>>> exec queue teardown ordering.
>>>
>>> v2:
>>>     - rebase
>>>
>>> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  3 +
>>>   drivers/gpu/drm/xe/xe_guc_submit.c           | 62 ++++++++++++++++++--
>>>   2 files changed, 59 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> index e5e53b421f29..b5dfc9c9092d 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> @@ -13,6 +13,7 @@
>>>   
>>>   struct dma_fence;
>>>   struct xe_exec_queue;
>>> +struct xe_drm_dev_put_work;
>>>   
>>>   /**
>>>    * struct xe_guc_exec_queue - GuC specific state for an xe_exec_queue
>>> @@ -35,6 +36,8 @@ struct xe_guc_exec_queue {
>>>   	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>>>   	/** @destroy_async: do final destroy async from this worker */
>>>   	struct work_struct destroy_async;
>>> +	/** @dev_put_work: deferred drm_dev_put worker to avoid self-deadlock */
>>> +	struct xe_drm_dev_put_work *dev_put_work;
>>>   	/** @resume_time: time of last resume */
>>>   	u64 resume_time;
>>>   	/** @state: GuC specific state for this xe_exec_queue */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index b29cc08e6291..d1ae4339f375 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/circ_buf.h>
>>>   #include <linux/dma-fence-array.h>
>>>   
>>> +#include <drm/drm_drv.h>
>>>   #include <drm/drm_managed.h>
>>>   
>>>   #include "abi/guc_actions_abi.h"
>>> @@ -47,6 +48,11 @@
>>>   
>>>   #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
>>>   
>>> +struct xe_drm_dev_put_work {
>>> +	struct work_struct work;
>>> +	struct drm_device *drm;
>>> +};
>>> +
>>>   static int guc_submit_reset_prepare(struct xe_guc *guc);
>>>   
>>>   static struct xe_guc *
>>> @@ -1674,6 +1680,8 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>>   	xe_sched_entity_fini(&ge->entity);
>>>   	xe_sched_fini(&ge->sched);
>>>   
>>> +	kfree(ge->dev_put_work);
>>> +
>>>   	/*
>>>   	 * RCU free due sched being exported via DRM scheduler fences
>>>   	 * (timeline name).
>>> @@ -1681,20 +1689,55 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>>   	kfree_rcu(ge, rcu);
>>>   }
>>>   
>>> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>> +static void xe_drm_dev_put_work_func(struct work_struct *work)
>>>   {
>>> -	struct xe_guc_exec_queue *ge =
>>> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
>>> -	struct xe_exec_queue *q = ge->q;
>>> +	struct xe_drm_dev_put_work *put =
>>> +		container_of(work, struct xe_drm_dev_put_work, work);
>>> +
>>> +	drm_dev_put(put->drm);
>>> +	kfree(put);
>>> +}
>>> +
>>> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q, bool defer_dev_put)
>>> +{
>>> +	struct xe_guc_exec_queue *ge = q->guc;
>>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>>> +	struct xe_device *xe = guc_to_xe(guc);
>>> +	struct drm_device *drm = &xe->drm;
>>> +	struct xe_drm_dev_put_work *put_work = NULL;
>>>   
>>> -	guard(xe_pm_runtime)(guc_to_xe(guc));
>>> +	if (defer_dev_put) {
>>> +		put_work = ge->dev_put_work;
>>> +		ge->dev_put_work = NULL;
>>> +
>>> +		put_work->drm = drm;
>>> +		INIT_WORK(&put_work->work, xe_drm_dev_put_work_func);
>>> +
>>> +		/*
>>> +		 * Avoid running the final drm_dev_put() from xe->destroy_wq,
>>> +		 * since guc_submit_sw_fini() drains that queue.
>>> +		 */
>>> +		drm_dev_get(drm);
>>> +	}
>>> +
>>> +	guard(xe_pm_runtime)(xe);
>>>   	trace_xe_exec_queue_destroy(q);
>>>   
>>>   	/* Confirm no work left behind accessing device structures */
>>>   	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>>>   
>>>   	xe_exec_queue_fini(q);
>>> +
>>> +	if (put_work)
>>> +		queue_work(system_dfl_wq, &put_work->work);
>>> +}
>>> +
>>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>> +{
>>> +	struct xe_guc_exec_queue *ge =
>>> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
>>> +
>>> +	guc_exec_queue_do_destroy(ge->q, true);
>>>   }
>>>   
>>>   static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>> @@ -1706,7 +1749,7 @@ static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>>   
>>>   	/* We must block on kernel engines so slabs are empty on driver unload */
>>>   	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>>> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
>>> +		guc_exec_queue_do_destroy(q, false);
>>>   	else
>>>   		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>>>   }
>>> @@ -1914,6 +1957,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>>   	if (!ge)
>>>   		return -ENOMEM;
>>>   
>>> +	ge->dev_put_work = kmalloc_obj(*ge->dev_put_work, GFP_KERNEL);
>>> +	if (!ge->dev_put_work) {
>>> +		kfree(ge);
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>>   	q->guc = ge;
>>>   	ge->q = q;
>>>   	init_rcu_head(&ge->rcu);
>>> @@ -1989,6 +2038,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>>   err_release_id:
>>>   	release_guc_id(guc, q);
>>>   err_free:
>>> +	kfree(ge->dev_put_work);
>>>   	kfree(ge);
>>>   
>>>   	return err;
>>> -- 
>>> 2.43.0
>>>
