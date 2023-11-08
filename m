Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B9C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 18:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E8610E185;
	Wed,  8 Nov 2023 18:02:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E167710E185
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699466532; x=1731002532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IoRID1ZPPuOJ/VftgQwYMWMbAiCeHiS8cHtEQXOaT/s=;
 b=HT19iiHtqQvlI/kWPGOzZRA0LLaEz/Ep8IizsJcLAuCYQzHts+xMFhYZ
 g7565veI1CR86r2SHDFZwWsq1UeeXz9J9saD1/q3ZNekpVahOo764xzKi
 zPiKESc9aepZxEQ31lNglCNApRCUtrn8HHiBza8DfBjcpMYgJNcB5grxf
 x6pWd+S/xXvVRWfeTCDfKe3KiUu74HOHn9cu7gmADBK/RhPIjduGK/vup
 GxF9vXoNrTyD7cOm8FKkr30PgJ1UXZ9lrRatz6sYaLAuarb3PpWABow26
 q1mGv2K9+sTj4Hg9TXPtW15+HhM13LlHHjuMnElCeqYaiJkACVYH8pzK9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370033516"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="370033516"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 10:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="833555604"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="833555604"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 10:01:59 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 10:01:58 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 10:01:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 10:01:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 10:01:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfZGDdIlZX2BtAeSLzLk+GV9tqmRNtfJglBRCXextaUH+5HSkJGsk1Pjz4LKRIwbPp/fa3NQs895DkeNwJwfuC1XxN7XiFXqY/E2fCUVcBHOs/3oRCeW0AZ4B4hfelmA6bwWAVLJlLtDtbxYNS5Mqd6RYneFwN3lVWceGgEMwnPJYZf5O7nbq7+uHUaFko5zrSKgDd/UgVyiRF4AiDZbiar0BrHIAzKiLNc6F2uqTMhH7qVJuhO227RNly7tbKLGrXXCXapxewy54Ju/v5YF8N+eFXyqXtMtUNvYOAVFGBS7KCEsdT++v4uJXkKqlGpy7q48bl4RKqPJDOXSw4PArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVs+C0lpC4bJPlzxkuQXMO+gYzz6HxpjyjScNBGVyH8=;
 b=mY265/CYDD0UFL+Z7CxysvE34/CE9/5efqj9DslS2rNH3rqCHQ82PxQ1xsfar+HxwdX5D3qtpd6M75eoT6UogDWYFbjP7SbSCv/NxGwnsTIKZBRMYzQkCIK8m8xp7e3rqEwzYQe5i1z63HSS+QC8ujsBPEGH1HkL6M/MIax9HS2g6dKavgPx3reQOlwPlbiUZLvKvalNlppMKBrAmsH4i9Wwsc7UhHTghCywbqCsm3arL9HySVFPZD4TgDzFDJzYu3S2gttc7XExva6/2+4haQMouumi6nuFbEZoFAh9TmOyog9T023uTvnltXFdcN5hH98EUdZ/cRQ35JiTbcwElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 18:01:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 18:01:56 +0000
Message-ID: <2d11c664-c802-45c1-85f0-2a04e931d349@intel.com>
Date: Wed, 8 Nov 2023 10:01:53 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20231107115559.248879-1-alexander.usyskin@intel.com>
 <20231107115559.248879-2-alexander.usyskin@intel.com>
 <98bebcf8-f997-4e32-8aed-c977fd5b1d42@intel.com>
 <CY5PR11MB63666A2A6C4DCFBDD97CF8D0EDA8A@CY5PR11MB6366.namprd11.prod.outlook.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <CY5PR11MB63666A2A6C4DCFBDD97CF8D0EDA8A@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4536ce-b7fc-4753-b846-08dbe084cbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GCd8LD7vZ3NGvXb3VYZtoEuPNMp9wnKte8p423JhHdhqWrRGKi94TBfege/VXOz/RhborlhZo6OwiSGW3YGOpPWAGY3P4dVTg+F+wHOR6Bz5Daj4QnwNzRqRvoedt+w/AkJM6SrTtzi1rL/v5yzNQU25K1tOQhYKXcFJxfwcuSRCvFO9zHM87EbIFoRVD4/dbKy2sp/oK1RrP98pdW4fitDhrf7jwAPzF9q1JMh2vnjZza5eVi///9TnufJbE2WugChgikYw5JMJPSX2XEmtT+ciWtaMAX1Vleyt5D0Ol7urI/Zrvmv5ZyR7G0EM5vlKdYrHK5P42D/91hufxlrQjoccY3WdSdFWdfKgMNoqoauNYm9FLKm+3z482feJ+IPqhH6W5buE2/Up+76CKD3pJ4G7gfP82Vou24/s1gT/6wbLP03WDB3qhIyUfSDHIuFpzf4Aa4dQBsaQJpf+xbbuGwcGq8HeR/YyZF3DkQAeG6gJzjlCZaNyYiLpr0tqHM4phhZnPP0Jpyakd+UZMiITHvxqI5ru2lCuJOGw5bDJKrAJerO0eUwHH26woRPQk4yABoeBtJTAnW5El7ERgzhZR7YM1p/4TZDWk/Sj4+IV/JwGJylR1JdbqUPEUzItFvaGCHMTqajyIzYHUyN8GOjGIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6506007)(26005)(6666004)(6486002)(66556008)(66946007)(2906002)(53546011)(6512007)(66476007)(110136005)(4326008)(2616005)(54906003)(41300700001)(6636002)(8676002)(316002)(5660300002)(8936002)(82960400001)(36756003)(31696002)(86362001)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGpiWGZlRHFCaTEzYjY0dlBrSVFGeU5PdkVaRlM5R3Ewc1hDV3pwTHdVVEVu?=
 =?utf-8?B?QlNlcjZIWlEzaytJS3VCSk1PMU5HQUZwbThRYWNrVDdVYUlKMUp1UjMzcmU5?=
 =?utf-8?B?YTZOWHZta0hJSGljRnBlUzFGS2VOVUNJTW1PdUdQcENOVm9seWMwVXoweHA4?=
 =?utf-8?B?b0lCajBHLytUNXU0eFZnQ2FReXJYYkp5QkFBaTRyeHA4Zlk0aDh5bmZ3d0Ni?=
 =?utf-8?B?QU9HOHdKR1JqRTVBQWVWZnN2NDc0ZDQvNGUyYUY2VWoxYjBKQXJnb016R09D?=
 =?utf-8?B?SE1YTzlvR0VSM1cvTWx0UEZmNGk4ckhKZzlxK1ZISkltQkV4cEljNUxOcXdN?=
 =?utf-8?B?VEFrSEZGZHFCZ1gvcmV1eUswdXUxMk94WDYwN0pHVm5seDZwVU0wL2lqNEZw?=
 =?utf-8?B?bUEyVVVTdXA2U1FVSVpVbDF1endQLzNmc0xpdlNjVFhkN1kvNHRhVmQ5RjBS?=
 =?utf-8?B?NytLRWFkSFVZeGVKKzlPaUh3cXB6ZTJsM1Izc0E3cGNQcEU2Uko2NFlucG5I?=
 =?utf-8?B?TjlBMDFEeWgzNzhaSldmYjBGc1BHalRZQVd5YUt3SGF3elNpNnJERmJ4Ylpa?=
 =?utf-8?B?bkZYcWNmYTBCc2hGTjZHNXljOG1XMzhlSWVWQkpxOUJHdzRqN0NoY3RpcG5t?=
 =?utf-8?B?bm9zK3FFWG8zcWdjNFRCRWtNYzVaQ005UjVveDRkMmFzR1ozU3BpZHNLQ2Fi?=
 =?utf-8?B?bEZIcjg1KytEQXZhYXRCYng2KzZJYk0vV2ZtRlJCYjlweWJrNGh4UmZxUFkz?=
 =?utf-8?B?WTdXRTNrUS9iRFNJNnhuVGRhQWEyY1hRTC9FZ1J5bVRFcmJ2ZElmWGgvU0Vn?=
 =?utf-8?B?M3VpTEhYTytmRG40QlBzNy9Ed3Q1bCtaazVubEFPWFJyaGRrY2s1ZEJ3a25x?=
 =?utf-8?B?cWlwMm5KZ2hoM2NmVGFtZEpSeDNyMEY3VmkvY3dzSXZ0WC9pNTV3N1lCVFU4?=
 =?utf-8?B?dHhqeGNHdSsvRkNSNEJOU01DR2gxeDM0UGNFRnQ0WEdFQzJBYm9Jdk9CNjd4?=
 =?utf-8?B?bkY0Q09KanJYWVV5S1JVZmExNnZ3RHI3T2VTa3IzbjdLZ0N3YjV5NHNjT3pM?=
 =?utf-8?B?TnJFcU9yS2xINzRoaTBPVFBnMEVidHBrVUxUeHg1WGhHTER2NWVMOExxS0Zw?=
 =?utf-8?B?cUJBRjJKTjVheCtCQWhmRkRHN3I4NkJOeE9XNldCc1lFVFg5d3kyM0txTnp0?=
 =?utf-8?B?K3N5eUg0NWUzSElRR09iZzVyN0RuN1ZJUXFBU2JTL0pJMEUzbm9EUEFQOUZy?=
 =?utf-8?B?amMvVE9abjZUcEJjcFVkdXgydUx6L0NXMjVZVVZ0OFJGV2lIak8rZDdudmhB?=
 =?utf-8?B?aEhiYURzMzVKQzh5SUd3aGNHeGNUNzlJaVlCazBCa21TQmt0UEd1YUVOTC9J?=
 =?utf-8?B?NUVkNGZBQTBHMHp6VjM3TTFmUm9ORDZHQmM1YVZjLytkVWpSWlZEREJMWWxZ?=
 =?utf-8?B?bVNIVVpSb2JkdEozUDdFOGZMa1NsSWFXdmtWbmlzYjVEaUZuS281U2podHFO?=
 =?utf-8?B?VGpFMC9kZGdzRmRRVXkvK0Q5NUFZOFpEaUJZSk9zU2pmdUNyV3NJTUlNbDBr?=
 =?utf-8?B?OEJyeDk2NDh4RTJ5Q01XY1lrYWVBaWQzUGtOQ0N0aXJCbExYUTZ3cmZvU2F1?=
 =?utf-8?B?QnR0RWJyNVpzdmxoWWtSOEs5Uy9PK0M5VWxIRUF2TWpzY0FjZXRDNGhGeis2?=
 =?utf-8?B?M3BQcVk5Rmh5TzRjcFd0R1VEc1RGd2t0ZkhMU2orTmdVQjZoYnpNOStBTEdu?=
 =?utf-8?B?L0d1QnRvaGpkSmpnOVorKzE1bG4rR24zNzhDOGdhWGtCclQxOWV6eVRSYkd0?=
 =?utf-8?B?NkR6ZllHVERaZXRpREFCM0tBSHNTOElSRnN0aGxydEVQSjhoMEdRa3d6UnN5?=
 =?utf-8?B?aXpBZm42RHp1bi8yNUlYdng2bkU0SlVyY3NEbmt6dmcyM3Q1K3FYRlF2NWEw?=
 =?utf-8?B?eC94S2RYNmRha0tUaTJzL2lBeXBEUmZkWWFrMVZSV0JqNW44UXd5VkFPUDBG?=
 =?utf-8?B?U2VJZGlmcmUrRVJJMmRwSjZra1pmWUtkZ2VHVTNKY0pXWHdqZFMrTWVzMkNq?=
 =?utf-8?B?VWpxT3ZKVjQ2UjBiU1Nxc3pTT095RFpDdGEzSkJaWTlzM1FsUWFHanFNUmpv?=
 =?utf-8?B?a2FzSi85eXExckw3YzhZQkozcmhOcUkzSjJCZDNPNHYzbG10dkYyVkI0L2J3?=
 =?utf-8?Q?fa0iZvsgpn0O/wt23fyKVYk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4536ce-b7fc-4753-b846-08dbe084cbb0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 18:01:56.2315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Nk0PEL/k8zE+FMZiaKwuAqmuASEcP3OGEgoefi4l1aQ+NVupcUer0Ig4exfdQ73VMFQ1MeLmO0r7Qq2TNzdwfgfPjw2d4O5TFZymCPA810=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/gsc: enable pvc support
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
Cc: "Winkler, Tomas" <tomas.winkler@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/7/2023 11:02 PM, Usyskin, Alexander wrote:
>>> Configure and enable PVC HECI GSC support.
>>>
>>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>>>    drivers/gpu/drm/xe/xe_heci_gsc.c  | 11 ++++++++++-
>>>    drivers/gpu/drm/xe/xe_pci.c       |  1 +
>>>    3 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_regs.h
>>> index a646d13af03a..ec9372aa739f 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>>> @@ -35,6 +35,7 @@
>>>    #define XEHPC_BCS8_RING_BASE			0x3ee000
>>>
>>>    #define DG1_GSC_HECI2_BASE                      0x00259000
>>> +#define PVC_GSC_HECI2_BASE                      0x00285000
>>>    #define DG2_GSC_HECI2_BASE                      0x00374000
>>>
>> Just noticed that these define are in the middle of the engine mmio base
>> defines. Might be cleaner to move them to a separate section, but not a
>> blocker
>>
> GSCCS_RING_BASE is not in the right place - I've been told that
> all defines should be sorted by value - it should be before BSD_RING_BASE 0x1c0000
>
>>>    #define GSCCS_RING_BASE				0x11a000
>>> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c
>> b/drivers/gpu/drm/xe/xe_heci_gsc.c
>>> index 3328ddca42d0..d8e982e3d9a2 100644
>>> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
>>> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
>>> @@ -70,6 +70,13 @@ static const struct heci_gsc_def heci_gsc_def_dg2 = {
>>>    	.bar_size = GSC_BAR_LENGTH,
>>>    };
>>>
>>> +static const struct heci_gsc_def heci_gsc_def_pvc = {
>>> +	.name = "mei-gscfi",
>>> +	.bar = PVC_GSC_HECI2_BASE,
>>> +	.bar_size = GSC_BAR_LENGTH,
>>> +	.slow_firmware = true,
>>> +};
>>> +
>>>    static void heci_gsc_release_dev(struct device *dev)
>>>    {
>>>    	struct auxiliary_device *aux_dev = to_auxiliary_dev(dev);
>>> @@ -172,7 +179,9 @@ void xe_heci_gsc_init(struct xe_device *xe)
>>>
>>>    	heci_gsc->irq = -1;
>>>
>>> -	if (xe->info.platform == XE_DG2) {
>>> +	if (xe->info.platform == XE_PVC) {
>>> +		def = &heci_gsc_def_pvc;
>> IIRC there are some power-related requirements for GSC in PVC. Is it
>> safe to use the GSC without implementing that? Or am I just
>> misunderstanding the requirements?
>>
> The RC6 workaround implementation is not planned on PVC Xe.
> RC6 will be disabled in this case.
> So, no need to implement mei workaround here.

sounds good.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>

