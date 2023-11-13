Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADB2C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 16:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CD910E168;
	Mon, 13 Nov 2023 16:09:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475EC10E168
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699891777; x=1731427777;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=amW3YrTV9ah7kgTd+jhz6kXaP1mXSZe+fNaERD7CDAc=;
 b=iF/zJ7gxg4yfaEnLbBR2qTRfWy5ZehzsRVHRpzZjS8rzoOa4gdL+E4vU
 yR3eh+FkfTbLAjYv+gGyKATeFm/DNTBiFyibVaYnHPODp7yskAsqcaCUj
 w1zKU/MbCFJJ5etI2QEqrrib85Tx+kzdf5XpcTJgzWvPpLPTnBsi8L+jC
 bIEV4/Fqz82eaUjQKJMeKfsLYFPlE1WM7Fsc/5VDpJu/wlIl0PnIBOhkJ
 u52iRV1I3xMI6BTUpYAob+5yqoufyyUPnYbJguozdIfX+QYnzeLOsRR5J
 FaQq/KzBd1KE4THTMOlO4k+5htxTZYhaoY+IzvgHw39M38+0vd1obVv3N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="456949825"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="456949825"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 08:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="834757634"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="834757634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 08:09:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 08:09:30 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 08:09:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 08:09:30 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 08:09:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI5qgKgp1mJWlqGvsjT0EFL3BiQ92wiON+6rwUh4e098uKTs4/dAapancNKVb2Fk/PcCS9ynNHLQzv9LCduxuh3Kb2PhpIPo92Uf4sYF791JX50tA48KoLvi0dZ5h8eAz6kNYiMrM9iMj6nYsDMs6CMwtZb5DbENFNAHrqwH2y9QWIK2/fAiZjGkwxtDL7yhj+jbl1VLQOV8N/Hl9UtUkvdqD8DASnD2It2fZ0jR4iahqnpyJHWzz/ijTeWwmm6f4LyCxU7ijmaRASR+qSL56FEOl20ESeGiI6hX52IZM7kmiIl4ec84u3haJGOTVd4nXdAa+3p98kiOT3/aMzaiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlRNeAQPUXBLz2Fp37ZwVlG+n24gVMujLv6NEjuZfkU=;
 b=PvZrW06B/hA7r5Jquif8uMlNQeZ/XZJgbABRQq/Foms5h9PucMrpjXdXTo22LdYr6y45VytTonnsBsdE5EW/Il6ZIOlITcbGu/lysp6zpRaMcNJnkNv3sXsGN71Tvg2BHRmIvQLHQMJRAOZLJxhNYRvjVWrP9RoQYsAxK/52caCgEBBC2dk/gqDwo+wZfvWuGydkr3AjQmzjFC50qBkce5Dat/xhresnkDllO2/HJbpcYaKkI815lGOmk7+6CbZrrS4yOHufkylUx6AuLK2GzU865KjQOUre9JBvwWD6H1JCRoaaeBy03L1Ltub0BH5C42QxYnY46B7k8qPwRtw0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 16:09:27 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 16:09:25 +0000
Message-ID: <81274a7d-abc8-49d9-934c-a8b630dbe869@intel.com>
Date: Mon, 13 Nov 2023 08:09:23 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <wpzk6w3emsgzf266vtcsmjxedv5mfbf7x7dchf3tswzscyoelz@7mlfe5tz2ou6>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <wpzk6w3emsgzf266vtcsmjxedv5mfbf7x7dchf3tswzscyoelz@7mlfe5tz2ou6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: de901a38-a5dd-4eba-8c6e-08dbe462e81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQ3qcrqM0iw1hf+U9VgehhSLVtRH2afajPnl0dF2G5dumEKt0XRY2gO9PiBwVY2NmDciThGKOL6KHBRkW/spkf5/qqfhpv8E3mnaeu9dYmkHTIG9c42kxuWtdF/Gb234nP3oUAJXViuR4WLfP4SGmMM8qNb+mgEmSVaeUsdPEjdzsYu93uKPYs3Dz5ouyUPOsyLl27yl0OEUxuWRd9LyHSHc55dOPz0dSaJDXWF2ZTKYVEyzx4174u1uyTHQ5HZaGN8aOCu41IxcbWBEJFqLDd/v+HQuo/SXHKnRV0eEDbDcllyqkZfWXYsK7MOlv0MadjNUZnnsG+iblzgyIho4aET1BeBok3eFBBfMYBdpc1PByFpoCzzZ5B9u2E358YSeHgGb4lSSpUpSS4F86kjnbRNcxX+dCYxmpaFd/6scKynSCyvUpDLveb95o+BjxLccc8YCPgUfnhCAEKSk3eTJk+zI0O1kpLNQumySleWYa8amuBDGscPA8X73RWcL7yI7u9b7qOOOiAY/ZS0LbRxsXF223iytwG9Pg6uUkcpODSQ7AOX1cESfuYJU/NTJnEs3XQe/2tfC+Ax5v0b7IjcFiFF6vfX76cZ1cfpTuyGNUBJ3XB8Hq4k+9kwNIqarAejFzjkfcP9+k2sR+ohWSUfqNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(4326008)(8936002)(8676002)(6862004)(82960400001)(66946007)(6506007)(66476007)(37006003)(53546011)(66556008)(38100700002)(478600001)(83380400001)(6486002)(26005)(6512007)(316002)(6636002)(2616005)(36756003)(5660300002)(86362001)(2906002)(31696002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejNpZ0lnQ3lQdWtBSDA4a2xzR0ZhSmptc0tlQ25aOEFqRks0bkROazU0dngr?=
 =?utf-8?B?V0dydU9BM2JJR3pGK1Z1UkNzdmZvK0xmaW5RZW5ZdGxvMU5FVTRHanVqdWt6?=
 =?utf-8?B?cExaQ2VINUdnM2xsdzRiUndBOStTWUpmbEExYzB0TktUbnpkSC8yejg3TWNn?=
 =?utf-8?B?Umtvbmtob3Mvazh6TXB0TWxEWE5CK1NGS01xMG5WWnJ0Z0JMamc2MFQ5ck9F?=
 =?utf-8?B?Um5CMTFSQ2F1Q2x2Mi81bHJzYnkzcmlPOC9IZG9vak9pUFlGQi9DbnJLaHpD?=
 =?utf-8?B?cXpjZGZoN0J1N0c3RUJ3aTNiNWxxZElhN3I1dXo4NkxwZmJPV21XZHlJdFYy?=
 =?utf-8?B?LzIyNFlLb2lmZEI5dlQzb2pUeUN1aDRKSWVldkZjUmhNZ2tnWTZzK3ZCeGRB?=
 =?utf-8?B?eVc2TVY4eG1jclJSOGRvSVNRYXg5Y2piclpVTG9mbTZuakttK09CblZ0dW00?=
 =?utf-8?B?UEFsL3FZejZSUlN6dlRVR3B3VEVwUk9FS1pmK1c5c1ZUeFdOQkppNCtXOTBN?=
 =?utf-8?B?QnNDZ1h2U3lvbVJqV0J4bVQrQkl0N0xMU2M2UUZqbEtNU0lsTFdobVpuaGlD?=
 =?utf-8?B?SURnRzRybGtrOGYrOVMwUmhzTm53aWpRcVI4QVQxcXNUUS9yNjcrM2QxUzly?=
 =?utf-8?B?c1N2Yk1tT2thS2Vlcm1YMngzN0QvYjQ0c0M1S1Vmb1g0akRpVlkwZzJyUzJp?=
 =?utf-8?B?VndGTTloYi84Q3N3dVNGN2FlT1pJSExHSjZ6eldwQnA2VEpBazRGRE93bUYy?=
 =?utf-8?B?cUlSdFVyVlV1akdMUE5pWWd4eUxJNXp6RkdVWXFTVnc0VGxKUXdrTEdCZ3Ew?=
 =?utf-8?B?N0hkWks1OW9NZ21ib0FIWjFKSklLb0RHd2RhWEcvcHpCK1o5ZkJxRnBUdXRE?=
 =?utf-8?B?UklRakxDZitpc0lHakRhUnVxYW1NNUFVK014RnNtTFYwQnFkT21ybjB6TUJG?=
 =?utf-8?B?ZmxQdjU5SEU1SEJ5bEo2Mk5FdWxHVUtiaGgxRS9GMFIvcXR3Yjc1cFBHNU5p?=
 =?utf-8?B?ZExwOTNRZmZrenJjWWlrbmNXSGdTMlppL1pBZzFtY3ZWWUVUZDg3bzE5NUlR?=
 =?utf-8?B?NFVoSnAwSE1ybnFRRjlZS2QyTDVmY2RoZnAzZk5saUVGcjdtNDgrdCs5TmhQ?=
 =?utf-8?B?VjV4cWREZ0VNWXdwNURpRHlkSWQzSlpuN3h2emZIa29sSXhHZ3QzWFVsN0hI?=
 =?utf-8?B?cDF6NWxzRE41LytQVGMvMGs4R3NzL2tGcVdPODIrbTR1cXIwVUN3WDQvSGp3?=
 =?utf-8?B?dVNFZ0VYakltQ0RtM0J5WXF0TEgzNTB5NWNkSDdzc0FGdXVDa01QbDYzdE0y?=
 =?utf-8?B?S0VKVnlIVWllV3c4bHc3V0E4d3JPaFhWL3BLUHhrTGpsT0tPeHd6dHNsY0V1?=
 =?utf-8?B?Y2szU0g4TC9VTm5hcnRicGxLZXVKd2YzbTNDK2tsRWFVckovZk1aelhzeS9z?=
 =?utf-8?B?cnpXKzZqMmpJQVNzbFVIYjFDb3poQVJoQnR0MmNsR09QUEZGRWNJQnMvTnM3?=
 =?utf-8?B?ekYvUEJKVEk2VDlvMFpBOHhPVmM1SXl1UzZhUXl3NndFc2hkcDVsQm4ydXYv?=
 =?utf-8?B?K1ZuU1ZhUlN1UjBFNmp1Y1Z5dEFlckljbklGcEIxbGR5WVMxelFQb3pxbFhx?=
 =?utf-8?B?Z2RWbThDeWhIa29aVTFCUDZyeHNhWnUxeFVKMXJrcDBwN05nQ1VyTk16Y1l2?=
 =?utf-8?B?N3dpa0lFYlc3VkpjcFFZckhkOTNORm5nQkZXcFNHdFFHam9qK0wzUDN2STJo?=
 =?utf-8?B?T0FVelB1ZkhwcFhpV2JNVlZiaVovSGtFK0x5ejd1QVpMOVE4UGlubmhaT1Bx?=
 =?utf-8?B?U2hZSXpnM3NOd1VQOGlOMVZRWEZhTHdyWE9jRGxPM2IwQnpvSlZGME85b3RQ?=
 =?utf-8?B?WUNVVHY0bnBKelpOUU5OUDhsdmFaOUV1eHlLSndnY3Blc1cwRXk4NGgxZ0hS?=
 =?utf-8?B?WTFEM1EreFNMTy9BMHZUSDhuNXRaV3VuWGwvYk03YWEwZURGY3hRK3ZQRkI1?=
 =?utf-8?B?VlBEYmRSZU9lMFpLRitXbUpuaUI3c0dxbEVMUzZtSnVMRDh3bGR5ei9weTIw?=
 =?utf-8?B?U0pmelloczRSdFhyemF6VjVXY2VNNDM1LytEN1JWNGNqWERSaHQwdXNJSVFT?=
 =?utf-8?B?UjAyeXl3cjVxeVQ0UTViVFpKTEJGUVFRL1gxZnVtOE9VbDJ0Um5UOXR3d1Fh?=
 =?utf-8?Q?6jh5grdvNqo8Ip0UR0YyVjo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de901a38-a5dd-4eba-8c6e-08dbe462e81d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:09:25.6975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE5+BFgnJcn0VeDG146ckKMOO8xwDC863OFKPww786m0zR7U43hgE+nLqzBsdFwPuMpNWMiya6yGJ0vjYl3wjM4A3sirVXHzGOk6NOT7gcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/12] GSC FW loading
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/13/2023 8:05 AM, Lucas De Marchi wrote:
> On Fri, Oct 27, 2023 at 03:29:14PM -0700, Daniele Ceraolo Spurio wrote:
>> the GSC (Graphics Security Controller) is the root of trust for content
>> protection operations (PXP, HDCP), so loading the the GSC FW is a
>> prerequisite for those features. Loading the FW is required to turn off
>> the GSC forcewake well (which we must turn on to enable GSCCS idleness)
>> and therefore allows MC6 entry.
>
> Regarding this last part, I wonder if we could simply put the GSC
> forcewake if we detect the problematic situation: GSC fw not being
> loaded and platform requiring that for proper MC6 entry.  Would that be
> possible?

No, the GSC ROM itself holds the forcewake ref and AFAIK the CPU can't 
directly touch anything ROM-related. When this first came up and we 
discussed it with HW architecture they said that the only option on MTL 
is to load the FW.

Daniele

>
> Lucas De Marchi
>
>
>>
>> The GSC FW uses 3 separate versions: release, compatibility and
>> security. The compatibility version is the one that dictates whether the
>> driver knows how to interface with the binary so that's the one we match
>> against, but we also fetch the other two for debug information.
>>
>> The GSCCS is used to both load the FW (via the GSC_FW_LOAD command) and
>> to send heci packets to it (via the GSC_HECI_PKT command).
>>
>> Note: the flr patch from Andrzej is being reviewed separately, I've just
>> included it here because it is a dependency.
>>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>>
>> Andrzej Hajda (1):
>>  drm/xe: implement driver initiated function-reset
>>
>> Daniele Ceraolo Spurio (11):
>>  fixup! drm/xe/guc: Report submission version of GuC firmware
>>  drm/xe/uc: Rework uC version tracking
>>  drm/xe/gsc: Introduce GSC FW
>>  drm/xe/gsc: Parse GSC FW header
>>  drm/xe/gsc: GSC FW load
>>  drm/xe/gsc: Implement WA 14015076503
>>  drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
>>  drm/xe/gsc: Add an interface for GSC packet submissions
>>  drm/xe/gsc: Query GSC compatibility version
>>  drm/xe/gsc: Define GSCCS for MTL
>>  drm/xe/gsc: Define GSC FW for MTL
>>
>> drivers/gpu/drm/xe/Makefile                   |   4 +-
>> .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++
>> .../gpu/drm/xe/abi/gsc_mkhi_commands_abi.h    |  39 ++
>> .../gpu/drm/xe/instructions/xe_gsc_commands.h |  36 ++
>> .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>> drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |  39 ++
>> drivers/gpu/drm/xe/regs/xe_regs.h             |   7 +
>> drivers/gpu/drm/xe/xe_device.c                |  78 ++++
>> drivers/gpu/drm/xe/xe_device_types.h          |   3 +
>> drivers/gpu/drm/xe/xe_gsc.c                   | 389 ++++++++++++++++++
>> drivers/gpu/drm/xe/xe_gsc.h                   |  16 +
>> drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 ++++++++
>> drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++
>> drivers/gpu/drm/xe/xe_gsc_types.h             |  39 ++
>> drivers/gpu/drm/xe/xe_gt.c                    |  46 +++
>> drivers/gpu/drm/xe/xe_guc_types.h             |   9 -
>> drivers/gpu/drm/xe/xe_hw_engine.c             |  20 +
>> drivers/gpu/drm/xe/xe_module.c                |   5 +
>> drivers/gpu/drm/xe/xe_module.h                |   1 +
>> drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
>> drivers/gpu/drm/xe/xe_uc.c                    |  21 +-
>> drivers/gpu/drm/xe/xe_uc_fw.c                 | 257 +++++++++---
>> drivers/gpu/drm/xe/xe_uc_fw.h                 |   3 +
>> drivers/gpu/drm/xe/xe_uc_fw_abi.h             | 113 +++++
>> drivers/gpu/drm/xe/xe_uc_fw_types.h           |  40 +-
>> drivers/gpu/drm/xe/xe_uc_types.h              |   3 +
>> drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
>> 27 files changed, 1329 insertions(+), 89 deletions(-)
>> create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>> create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
>> create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>> create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
>> create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
>> create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
>> create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
>> create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>>
>> -- 
>> 2.41.0
>>

