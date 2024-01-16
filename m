Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6280AC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 13:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC0D10E4C6;
	Tue, 16 Jan 2024 13:12:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF8A10E4C6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410742; x=1736946742;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=/7caNFfwZkLcywkpvwGTJsl3yYYzFzqjkdCAdqxiVmk=;
 b=e7dv5AeLhVgfp6IfeHL/u4Oa7zLOFgg7CA05XH2ftgO7KiMBqnvLnU1i
 5nkYUQVOicYOFvcLyFosHuIkO7Aa5qvgLJaAqYklX3a/kTVrULWKz6zLc
 hsFPhwBd6ppbmld/Mdm8Gp28FhumipE6eis1hRZ1fYBAb4TOLiLzTau3O
 w30M8E286lU85TBfAc0EB/NMhfOArRM/GK9tm0a8rQAKRpSt7W/nLvkbU
 zoRjAaY0Y+81aoBm/ifE5Z/l/u59eqX2k2wK4xJ+Bi1eZEacGtRaPkVfe
 fYwcU2d0dosvZnR2Veff32V7HmArlqLOBwaRqFpAdm1Prj5dCOW7W9BAv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="486016090"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="486016090"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="18463129"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 05:10:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 05:10:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 05:10:26 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 05:10:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMFnM+zwi3W4GFl/v8+xDK5Ov/HIlahs6gdpQYHY1Ro67vLSbFNESB05KMxWMeTW03pTlNZ513jtqWQ52D7Ms/8rVKeNRcb7K5kOTBnL3fpq5sNVZhTifnYGEc+H6E9kuYws6Umc7yIWqkQq4hecjPO+bmuyJLVGdMJoSO9IMICZ6JswbuXCw2Rejxb66D0Wedto8DXy0RxhDzpiZBqv45Vd7BGYrkxyx/9dFiQShK/yvSRmFu5YFJQktmNos/6HDjIQquJADuJxOeKUvuNjzYE6837ANHtxiNkvKw7eYvZO0LpMK6CUmUKyGO/J/lbKD+drjoYFhfSfT1r+qeNH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDnLFdQN6bbLMemNsf7/A6fen0WCnslG9hOOz+kPmA8=;
 b=jnb0wYHdf8JxNHJmHIljXmW8OQ295bg0Xst8ApALj1lz/beWXv6lV72HL1/zAvcr7mDfmK5TINPVho6MqoCU5HCmJt/nrwVQ0IweUfPar9sZ0mo5Epn5qsjz34kCpIF7KwkcVh/H0//Hbw3IblqFVogUTeeEl4/JUsXFNQSO9kKdxhrqV/1sl6/wMMbznfQCbDpjSd+5luDppK9n3rlV17zJKfAK023OI4WWVI3+X6RCU5mKpuCvTQUqxMp+bemqSguHBFwgY6Cgji4GAnHvcGbmn1QEr/dJQlBr1fT3oBBYlt0QJTYbpMoL1XDTz3pggZ6hOtez2Thc4ppF9DEE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 16 Jan
 2024 13:10:24 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::559e:7844:adc9:7793%6]) with mapi id 15.20.7181.020; Tue, 16 Jan 2024
 13:10:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8734uxsazk.fsf@intel.com>
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
 <20240111091622.1110799-2-luciano.coelho@intel.com>
 <875xztsbrt.fsf@intel.com>
 <5de5aff06d303129a742a416ef65fea64f4f1d27.camel@intel.com>
 <8734uxsazk.fsf@intel.com>
Subject: Re: [RFC v2 1/4] drm/i915/display: add support for DMC wakelocks
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Tue, 16 Jan 2024 10:10:17 -0300
Message-ID: <170541061777.29849.14557514938467373789@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 41359684-33c8-4bad-b522-08dc16947f67
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oooYlMzG62tvKML3Bs9ORvdMckZsFKt08pGx5xzsKYitjNR797V5uDgGI0w1iucGe5e0+1XYWLV4U05jXvyi6SQ42oTfVvbBJMwf8BOv3sXI1o+e5SD1NCLaEJDT3OpVOOqhkv/f9fzKfQ0EQfBJg6Of0ABAuqZA/46F4W2QppzO05pW/hKIuV7SFpSC8tBvcVVtX84/aCerQh4N+eudl6aXr0Pfn3PHYY2G+W5eN/OSfq4PsDY2ik2X/oj78XJ2ZRb0Na0eS+F0fYFHip/CL/esQ3sVvT0B8O1BLsKtqe+QmQVHPs5BSJtNbjhKM7cuEU/bGswLe3ufbrKlgveIMOBSgd+hNHfKC0HSuRgKg4Z0apr8xfJyDZNMVc3HOlNg5Wrgw2VAu8Vi6r/X5KK/46HX6ZF1HoMOTXzg3PQg2oG9OvdnShsLgLIJ8fEMmCQjm1tK22UM/mWEHGQoZTMByAgLkPbBMyoghyhydo++N2/Ge49VHLwZdX36ku9SF/lGHsWpfMgmHMNFguyY2lZF2O9Me0zXg5QezNLCRZIohOkXrFKRhlWke0MW9FKXDO+0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82960400001)(38100700002)(86362001)(26005)(6506007)(6512007)(9686003)(8676002)(478600001)(110136005)(66946007)(316002)(8936002)(66476007)(66556008)(6486002)(83380400001)(6666004)(41300700001)(33716001)(5660300002)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnExaGdLKzlRald3cmZsQjAwWFZDTllwNDgySFB2YlQrNVVZbG1yeitsMUNz?=
 =?utf-8?B?QkhsbHBNTC9TR2puOExuNkNzbGdLZ1VHYXZwV3FadlVscHBaSlR1UmxDSGVv?=
 =?utf-8?B?WkVOdW92c3R4NEo1V2R0RzVjRWhjM0Zya1c3R21Mb1EyRWFtQ01lSFA2Z0Nu?=
 =?utf-8?B?Z0xYUlhmVGRzQWtaRmdDdHFkeERaRUpSOGNpNGtsYU5jY0ZoUUFlaWREK3pr?=
 =?utf-8?B?Qi93cHpYSldpbnFYcjhWOUNaZmloS0lMcEhLcWwrbU5aN3cvT1BmcFdmUDd1?=
 =?utf-8?B?UWFwT2N3VmVaR1ZnM2tobGZLOUdRQ2ZmU3dEendaeGlNK1B5QUhLeE9GdWlN?=
 =?utf-8?B?UXR6cXJUR3BtbWpUaHFkbWxqRDFZYnhuQS9JenJiVEJ3dWx1WkNKeFFBdTJU?=
 =?utf-8?B?ejNueUM4eklaejFJZERTcmU4Z2tSZzYyNWx5OVoyOE1Vcm8xaXo4MlNvY1RK?=
 =?utf-8?B?VkZuakowbGkzR1B1aXRQaHVNVGtpSVhsclByR2lPYWNlNitEYm1STnduM0hN?=
 =?utf-8?B?bjBQZnovMjlQSG1LRVlWVUk1RGVsWjlseHVZYlozM3RPM0RpYjlyd3VsVVFX?=
 =?utf-8?B?Mm5jbE9kTG9TU3JmS0ZFcEhJWGtSZ1pJRE12SEtkOW1HRlZ1Umsyc2xwSDgw?=
 =?utf-8?B?a1hQN0d3UkdrOXVxNmxQTUYrVXhVU0plaUhkcVI3cHQyYktUQUNkWlp6MHEz?=
 =?utf-8?B?cndOb25rWGNCeHNDNG1FL1ErWkg4NkoydTZXOC9IYnU1ZFFwbVh1ZEszeTZs?=
 =?utf-8?B?eUJwanZydE9yZUJBWXpRcCtyR09CSnVmb2Fra3VPVHRCTDNuVXhROUp5VzFi?=
 =?utf-8?B?bExRQnYyRWJuL2NWMjhGekRNVktrYkVBb2pwajBDOHF5c2dqcmJxRkZ4Sjkz?=
 =?utf-8?B?RFEzT2g1YU1ZVENFVVlSd0ovY25icHZTQmNuVE14RkozVGdJZU1ud0dBSFlC?=
 =?utf-8?B?UGM2L3IwSHZ5TkhPY09wa2QvU1Q0VmRmSGM4Q2ZpcVREQU5JempLblhkQWlm?=
 =?utf-8?B?QmNSSXVYbXJTc2VHVE5aQ2xhbThoVVhrR1JzNVgrSTJ5VDF3cjZNQWlBMm1o?=
 =?utf-8?B?ZjVOR0pyMkdXVTgwT1JrMWRwV0dBZXl5U0dySHNwMzFucjlSWEtKTitEa1Vz?=
 =?utf-8?B?dnZ6djFhbXVYejVWNDJ1NmRIZGVSSHlveCtraWJVUlNBVHdBYm93ZStYNDlM?=
 =?utf-8?B?OEY5cEFXSHMvVjhVM0dCSTloM0pBeVN4cnhSUFhnaGhUbmQvQXA2NXVyejBh?=
 =?utf-8?B?N3JEaFZxUk4wQmlQYnplbzh4OWpqdXB6ZlJVaVlTbHcwZUhlNzQ0ZzJJRTBy?=
 =?utf-8?B?VlpWMnl3SEQyS05ZWHJ0U2pKMktVRzJES3AzdzEzMG9SZTFVVkhqSGNtdXVH?=
 =?utf-8?B?dlNkSnpMVGdsamRXdTZwbHBOYmpTRlpyb3BacElUZEpJZFZmQXJiR3VVYlpO?=
 =?utf-8?B?djdTaFlqNDNCTE1VRVJnT2RLOHUvRUNHWDRHTGtzMDdCMi9IUzhQZkw1SDNR?=
 =?utf-8?B?SGdRbnE2ZmJVcTJZSjB1QmdYOVphcjF1NnZHdVpDZ2JtbVFQNzJvU1ZCSUY4?=
 =?utf-8?B?bUErRFJiRC9BSXlXMVlWWHZkWkNCd0N2RlZYTWthUEFJM1dTNFJteVFpRUZP?=
 =?utf-8?B?RmFhSE9PbWNUOGJHa09IbGNtUW9OOEVCNHR1WmNkYkJUZU9wUnh2a3ExNnlC?=
 =?utf-8?B?SGFINHVYWWVwYnJwd1VoN2NkVTZieXY4OHVjWHJPZ1lReFd1bUM4Q1BnOEww?=
 =?utf-8?B?TDVBY3dhM3gyQmlQamg4SElONWJ3OVRyNjNLZUs1WTY5enFvcHBTUklYYUps?=
 =?utf-8?B?c0dXOVRyRjRrVmllQ2xBcHJkYS85WW9EdDMrVG03NXBMdThJMHFlL3d4VUVB?=
 =?utf-8?B?MkFjVkU3UXhlSXhJT1FZQWdoci9ZWE50VnlYcmt1T0pYcXpGWjlTRHd1S1o0?=
 =?utf-8?B?L0hwK0dzSFZHS1NxMjg5Vm9Zd2hBaktrS2lwaHFlNktnV1ovQmdEVytUaFpK?=
 =?utf-8?B?ZkZZa1h6U3pUVmVLbzJuT3dGVXp1UkFEaUN1UEd0UVo5aVdqMnBPVlVDeEpm?=
 =?utf-8?B?SXVpNXNxUkwwcEFDK0p6ZnYyQnl4VWlEVUxST0RENVVXa0VJYS9VZnZBU1NG?=
 =?utf-8?B?SHUwVjVQaW9qeVdjM2xvRDNYRlNzNmdtbWV6Z08rT3RPaWowdEdtUzlNQ0Nr?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41359684-33c8-4bad-b522-08dc16947f67
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 13:10:22.9433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWBpwKBgylvvuDe2gbsoHY4VqknlZ975OUwGD4GHAr15J58b5F3To9A2FkFYW9m87goTQA+5GSRsPbRAlAw6EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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

Quoting Jani Nikula (2024-01-16 09:45:19-03:00)
>On Tue, 16 Jan 2024, "Coelho, Luciano" <luciano.coelho@intel.com> wrote:
>> On Tue, 2024-01-16 at 14:28 +0200, Jani Nikula wrote:
>>> On Thu, 11 Jan 2024, Luca Coelho <luciano.coelho@intel.com> wrote:
>>> > diff --git a/drivers/gpu/drm/i915/display/intel_wakelock.h b/drivers/=
gpu/drm/i915/display/intel_wakelock.h
>>> > new file mode 100644
>>> > index 000000000000..a47205e1ea32
>>> > --- /dev/null
>>> > +++ b/drivers/gpu/drm/i915/display/intel_wakelock.h
>>> > @@ -0,0 +1,34 @@
>>> > +/* SPDX-License-Identifier: MIT */
>>> > +/*
>>> > + * Copyright (C) 2023 Intel Corporation
>>> > + */
>>> > +
>>> > +#ifndef __INTEL_WAKELOCK_H__
>>> > +#define __INTEL_WAKELOCK_H__
>>> > +
>>> > +#include <linux/types.h>
>>> > +#include <linux/workqueue.h>
>>> > +#include <linux/refcount.h>
>>> > +
>>> > +#include "i915_reg_defs.h"
>>> > +
>>> > +struct drm_i915_private;
>>> > +
>>> > +struct intel_display_wl {
>>> > +   spinlock_t lock;
>>> > +   bool enabled;
>>> > +   refcount_t refcount;
>>> > +   struct delayed_work work;
>>> > +};
>>> > +
>>> > +struct intel_display_wl_range {
>>> > +   u32 start;
>>> > +   u32 end;
>>> > +};
>>> > +
>>> > +void intel_display_wl_init(struct drm_i915_private *i915);
>>> > +void intel_display_wl_enable(struct drm_i915_private *i915);
>>> > +void intel_display_wl_get(struct drm_i915_private *i915, i915_reg_t =
reg);
>>> > +void intel_display_wl_put(struct drm_i915_private *i915, i915_reg_t =
reg);
>>>
>>> Nitpick, I'll want the name prefix to match the filename,
>>> i.e. intel_foo.[ch] have functions named intel_foo_*.
>>
>> Okay, so intel_wakelock_*(), specifically in this case?
>
>Yes, though my comment was rather more generic.
>
>As to the actual naming here, I think the first question really is if
>"intel wakelock" is specific enough for what you're suggesting.

Maybe intel_dmc_wl_*?

--
Gustavo Sousa
