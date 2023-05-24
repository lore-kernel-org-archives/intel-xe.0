Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450C3C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 00:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73210E55D;
	Wed, 24 May 2023 00:06:40 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6110E55D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 00:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684886798; x=1716422798;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5KXUCtYk0Ynp2qJM7n86glr4NM1fF5PBzIHtMjwLFgs=;
 b=NBTCyr90PRO+BROgQM0K0zzvzrnpRpIS4IoT0ar4j1npUDj8R8EMahPV
 Sy4OZ4O0lN7eb461GAvwuL0wm4dgwcEJvuWGpHeiCyaHO9zSfbnfPdSSD
 1W1e2NQtb3mIiTZoNRAyNWIe60EE4pJnUVgS/DbjmNEa4oLmwE7ahDiqQ
 eCTFWpirevfi+rtN5YYEqdMW/J8haEQEEfxHFnl7DqPuXi/W6ikpO79Dp
 3WixXzSTpBRFSBISCZB5vZl/9GtoAmgbuNRIKClshmroGHmdvwX6/UVYA
 hJWUBfVP+dSO9CiJRS/5hGZE7782eBFFUX8UxQhKJztrJAJ+BCPR917h5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="337984800"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="337984800"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 17:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="698274431"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="698274431"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 23 May 2023 17:06:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 17:06:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 17:06:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 17:06:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 17:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kigYOBshkTbIlhyZlLu/rTRARSLqD7He9+pcu0tE60KLMi5yTUtiOeVUvNCs77ml0ZZQbnXHw0UkvA2mtFNOvn1t9teUqYHelCoXnMBymRrjP4kw73k2aLQWaV50vld9nwX9gAenfMZC+bkcoGc1xLCblAC7C7AMCamnaCvS/KQp/Hy1kz21ze8kjG6E7Gk2walyRPhbQ0yPBxTtI+xImGh9Vp+V2T1C69wfPFctMxJzt6at6feBMYQbCpqSXyY7NnT9tU9e3zqNMJGi+08n9GU6fN62ZkYaXiq4wUVE8ThYW2Cq9HqcsFFel4kYYqMPDLza7LVNvUW15b6yEZoKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vI+CkAzcDM+4ak9pKfxShWEzUhLo0u0h6iaWgXlqXZQ=;
 b=aIUj/pmdDhAv0g1zjbCjsnZm0B1T/zt7UlkhLF4051H36wqAJ0zVqvcjPse9/b6K9g2P4uCOY9PcZTIa+3PTQXfhcWlYmBXODpGVn2RHCYvsOwzFJRc2RCxtrhtZFTELGvGX+gbFOwYN+xlASemb1wgS4KmAMZ88qVj0C48JhQktHUHwoZU+5W80HqhilEXl5ygsatKmEDNUfK0V0uAhI9VSZVJSrI89iKnncFRCGu0Vt/InQsy1VbSl2kUlerKRDsbz34BBbZjNwJEsqqyqanzu8OsFUzKW9svO3h2sNQ1zeEeY1RgDkZ5eD7T0b9xyzWU+KR7CPYHrZbvEb3zOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV3PR11MB8579.namprd11.prod.outlook.com (2603:10b6:408:1b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.29; Wed, 24 May 2023 00:06:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 00:06:34 +0000
Date: Tue, 23 May 2023 17:06:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230524000630.GN10045@mdroper-desk1.amr.corp.intel.com>
References: <20230523135020.345596-1-michal@hardline.pl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523135020.345596-1-michal@hardline.pl>
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV3PR11MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a66878-440f-4a83-a05f-08db5beabc2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gIkBtVfXIEPBvXMT4aRfr9O+Q4z0/C2CfNyHtwjhIAakc3wKm/DWGdkMt3nHOOOHOPnMozqkDa/sPDn0sf87rNE1GipEEwpfNjJZAc3NhOlRy5n5EeKOdtjGFhE0v5kZD6b+mNDmVANpOckHsWUVvM0eSgADeS0dXtPilBaEdS8Uv8P2lZ1/CYA98AL5fC2VDwQq3rECXzOiofc99gjBl3sJbGElkkT9nanB8ucWplBfIk7hLXfk35DxLEGaOsnrnXcFjBpHH4whLkzOKELm/vmuaStbypH4iHxMO/gEmZx7VUH79c99YnGBNN618qWEmsqjsAKJCNECaUpQejkD6ibq9mgZnxE3NrTYWIHoJY0N2t6KtngY+hBAXGXMzY8kFXvTFrsOuff0W8yJBxWicYkSKbQNXs+iv7z5bdeRMhXyo5u36Ly+m2XdwNTOuHpPclfURHlvquvniYma/1nI53OH0zxqJLN5wpYHp/6QR5wRDpRorBeZvAyKFpXMYq2UYWbwvf6lU+W424xpUIi/hGUCSY1eIRXgVhV2jevPws+1xflKOphLJ1RPWJZzZmZN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(33656002)(26005)(186003)(1076003)(6512007)(6506007)(82960400001)(107886003)(83380400001)(2906002)(38100700002)(41300700001)(6486002)(316002)(6666004)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(86362001)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QklnZFoybGNiT3Z0TUxmUWlPekZlSkNVd1RxOTBCN3VVNU5mMHhCVWs5OGdO?=
 =?utf-8?B?ZTI5ZGJ0UFFybzU1enNwMWxYdjFlNUM4NG81djh5ZEhPN3pMUEJiY2FiWWpV?=
 =?utf-8?B?c01Iems1M0NwVTZzejBRZkpSdERoWTlZaHkxekNpYUpVOStwKythL0JMWmlk?=
 =?utf-8?B?enlCUlBWMnFGOVFRSndCMVZmNDFJK0NGcDBNb0lNQzlDWEtJWm1wU1oydWRG?=
 =?utf-8?B?UG94clVYMmR4MXRaZml6dlNKTy9kTlRLbUl4dVZkTmJCODd5a3M4ME5nRENz?=
 =?utf-8?B?cm4vYWEycXMrdFhVRjhxckJnMmlmL1g3L2JoczV5a3A2N0RSNFFhTWtMaUFw?=
 =?utf-8?B?MlgxeWlJY0p1c2dncFJVQTBrYUo3MmVQeTUxcEhLeGZEWFlMbUh0N3RXNDRo?=
 =?utf-8?B?ZHlxNytkaGI1OWRXV3hUVXBEeldOVmZraVBXZ0Q5OXB5YkRFa0JnVjZsSGZn?=
 =?utf-8?B?SnZuc1pIYldtaGVzM1V2MmNOeHFaVTlaM2N2VkRhSnVlMHlzYkhGYVNiZ0xB?=
 =?utf-8?B?SlhuUlNvaUxIdHZ4bXl4SGo1UkVqbW8rN01Fb3FHZXEyMFdMQS8rcm9iR3JY?=
 =?utf-8?B?TW1ObFh0aE4vdGlBbVM0TlByRTRnVk9wOS84OGtPSnJaeTJnM09zQ00rMmxo?=
 =?utf-8?B?ZllLTG11R2IxbkFvaUpzVEl3Q2FqK1RuRW9tS1ZnWXp6UHBxbDlDTnhQWXVo?=
 =?utf-8?B?VXZDRW55YUJWQkpXVWhMTEQwRXZhVmliV2hwZyt3eVlZWnZMNi9Fd0hVRExY?=
 =?utf-8?B?Q2N6SHZmNC9iYmlLV1pyWUtJUERuM0EwOUorYWc2Mk5ZMVRjamtTZTNHY09o?=
 =?utf-8?B?dmRwaEVRTHcyK282SHFZeXJzK21ESXY1Vld0eFY2cUUrcENtNmdBZS84Zi85?=
 =?utf-8?B?ZWNTUC9XMHh3S0lrRHhtV3VPOXRrNnhVbXNRLzNRZ3pEbHBQQ2VzWWZXeXRw?=
 =?utf-8?B?dzNIWHp0V0ZBZEMrS0I0cDJvY0xnRWdCY2dVUXN2eG1rNStTQ291cWsreCtL?=
 =?utf-8?B?LzZpZ29CdGRTMnNRSGIvaVV4dmVWN1ZORUVkZElIMWRqZ0cyUEpabUpnRkEz?=
 =?utf-8?B?SmZ5Yks4MTh4aForSmV4YkVYNDBzVDN1WkVzeEk3citLNzVRWDBiVURCSlpy?=
 =?utf-8?B?Y3h3WncwVDI4L21wNy9XVjhjS282bWRseHgxYXc2UXJ0Qk9DeEtuc1NSbzha?=
 =?utf-8?B?Y05iK083VkhtbzFDMmFGOTJobTRNZ1RzbU5VS0hmN3owa0J5dTV3YzgxK050?=
 =?utf-8?B?aXB1RFBCZFEyUW11RjdsTTFHRnVKYUVMK2lMMVhvRkMxc3E1TXBldjlWaEdN?=
 =?utf-8?B?WG5BNERPNTB1Q1lXTS9wSEZWWnZRWExXRkViMFhCeHFQN09jQzU2aWttSkVq?=
 =?utf-8?B?ekhKUmJadmJXWUtha1hUVTUzcXZocnNJZHRFeGppTjhCOHk0UXlUbzdrM2FR?=
 =?utf-8?B?NkRqOHAzTEI3U2dBNHROU0pvWE5jRXhiRlEybElJTEJmM3NhZmNSQmRqTnFx?=
 =?utf-8?B?UlNzQVpqUVRCaFFJbnBkT2VuSXNJTjJhRHZPN0NPSHdLTkhpd21teFlQOS85?=
 =?utf-8?B?UWpwSHNPWkxSUXZoTnUxRzN1Tk1YRS93MWg3K3BPcFBaTEVFdzRQWVdQZjIr?=
 =?utf-8?B?ZHpPWHNjVDdna1dUdUR5NWRLa0ttWElJblhYV1A4ZEhEemRzR0dtWHlLaTBB?=
 =?utf-8?B?UHdJamorRE9yc0FzTFF3WHZiQjNrSFpWa0hKTGYwRXh5OVhBTkU0dUdDdjdu?=
 =?utf-8?B?WDBOZ1dUaGUvT1pJSHBpL05SK01QVklPMTVaYTVsdGFxbnlEL1Ivek1pT0JI?=
 =?utf-8?B?dTlvOG0ybmpWQ01kR3RpeTRDY0JNUUJhYlU0eVlUU3NpNGN3SndwaFFmeHhT?=
 =?utf-8?B?Y0UyR1FHSXM0amNJcTA2U0ZNcFBTV1JPWE11Ui9JV0kreVBmTjVncVcvSldm?=
 =?utf-8?B?MVhTcHF6eXR4YmdWWDh0Z3VvV0h2a1NiM3lvTThLRTlQWHB2dWVTTkpibTE2?=
 =?utf-8?B?YlRnQW1PSVF6Nnl5aXQ0aUt3b0xzMzF6aGZ1TzE5YnN1ZDh6RlVzcDN2a25x?=
 =?utf-8?B?VW5lMzMydFJ2SEVwVjNiTEZOUGZleWhMaUw5RnplS2tpTm1jUm9tc3pZUjY3?=
 =?utf-8?B?dk9YRGlScHZFVTZnZTh3L3BlSDQyZHpDRXk4QjZheDZOc05HTmhvNk9YMkEv?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a66878-440f-4a83-a05f-08db5beabc2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 00:06:34.3760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87LkGT6H1KXG43XT3ygTJKyelUMrd8cXHx5ddm425cner6G9YWllClE9JmuFmcm3OXdKH+M8lzuTfhFQ/c6cxbO/QzTzbxkeHN73echkbPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8579
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Fix uninitialized variables
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 03:50:19PM +0200, Michał Winiarski wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> Using uninitialized variables leads to undefined behavior.
> 
> Moreover, it causes the compiler to complain with:
> ../drivers/gpu/drm/xe/xe_vm.c:3265:40: error: variable 'vma' is uninitialized when used here [-Werror,-Wuninitialized]
> ../drivers/gpu/drm/xe/xe_rtp.c:118:36: error: variable 'i' is uninitialized when used here [-Werror,-Wuninitialized]
> ../drivers/gpu/drm/xe/xe_mocs.c:449:3: error: variable 'flags' is uninitialized when used here [-Werror,-Wuninitialized]
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 2 +-
>  drivers/gpu/drm/xe/xe_rtp.c  | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index c7a9e733ef3b..ec82088b73f0 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -373,7 +373,7 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
>  static unsigned int get_mocs_settings(struct xe_device *xe,
>  				      struct xe_mocs_info *info)
>  {
> -	unsigned int flags;
> +	unsigned int flags = 0;
>  
>  	memset(info, 0, sizeof(struct xe_mocs_info));
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 0c6a23e14a71..86fd1025b931 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -115,7 +115,7 @@ static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
>  	if (!rule_matches(gt, hwe, entry))
>  		return;
>  
> -	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> +	for (i = 0, action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
>  		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
>  		    (action->flags & XE_RTP_ACTION_FLAG_ENGINE_BASE))
>  			mmio_base = hwe->mmio_base;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0306526b269..109a5d93be89 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3262,7 +3262,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		if (!vmas[i])
>  			break;
>  
> -		list_for_each_entry_safe(vma, next, &vma->unbind_link,
> +		list_for_each_entry_safe(vma, next, &vmas[i]->unbind_link,
>  					 unbind_link) {
>  			list_del_init(&vma->unbind_link);
>  			if (!vma->destroyed) {
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
