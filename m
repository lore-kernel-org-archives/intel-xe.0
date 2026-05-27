Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F538CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 13:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52A10E0FC;
	Wed, 27 May 2026 13:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fehNNCCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DF010E0FC
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779887507; x=1811423507;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dEW3sExFGk0Au2hP1eKPQKDOFET1ihRV1zmnOieH6W4=;
 b=fehNNCCBINWlcxXpDY0EFoYAgh4Kh+D4fPWsNod3YD6gCrwPstlVHyoq
 9m2OBgUiQ0Q2teyGp0ejXs4vw38mQAB5czbMnGXmQH4PNdIn3+SQGuFJl
 bWiSMuV8BlV2/F4Djv+slrVUyBDb8N3omcaNn9yg8Cgl3RyxkgIczIwX5
 o3HX7pbsZhylVbNhbC24I+S0PeWl/LGSC3ekYBXCT55aTQvObqHkhs7dF
 aieb6KPkjdd1S9PTjzF4FsY3Z85JqGDpnTrZKxK/9+lpMjK2nYvAuG5O2
 K5I7NcFftO/eM0VFEbARjNnXkqkvZ4WyCB3XOhR3qrAdxs9FFQ1j9+fs6 Q==;
X-CSE-ConnectionGUID: xm3bxxOkSmKx8QvD0C9Q/g==
X-CSE-MsgGUID: uIv4LMV6TuiCFpStRFCBSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80700690"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80700690"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:11:46 -0700
X-CSE-ConnectionGUID: mW7UJkqMRNq7AbmaEKfPNQ==
X-CSE-MsgGUID: 6LmryNDLTPiYUh9VYI9Mag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="280375093"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:11:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:11:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 06:11:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8/WPE4eQgZev9itddSSSGll377shYHyq1tRIE0qvJW+XP2w6bHypdlacIni+Tdwo6KrrpE4Z3EUQlU4gB2uAt0x48I3cYffG++HOrltSX+U//rH0ZL4Fyb3H7zOtSSxKhexxKPtYItoI/1v7QErI+F+Wx4hA3Wfh1OiZr3fLLxFZH4TzVaXZudRQvfdB5K75wBbr1jSX0F4ibP/2RexDs7X2a/mc72XiAnC2HzVLRN9eUWzC3iBRhNzTb+HYnN+8a8KHqn5X8nCbGZQxsu3nNjaNG6jaJ7LlbMwtBaz+Z3eVn8cP9ILQW+L33lTWFZvp4lucfNJDazNUeqAHOMQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z5p2ZqScyG0DLljwSrCLATMdHDcapqRp0oenSG0jzg=;
 b=xumScIyfTQXokhJwJBj+quhA657U77hnEfLfsKHBZovHjx/1fPmTLIT3zWMAK4bMJX2hmGPJwUblN2/EP8YcRsZgP/bqEXrbO4psWr1fimhSA+dpypeCvylFwyOxfHDXWkakePKTjV/Zg0aBl6h+nHO4pAZzLr+nA+pQ1/m8IzoBMBylZQnmTyTEpCy9tSOPHNIpDpZ0LiyH7pNNu/y4gf7eQK3UuxfBCU6cfxKhU+3I8bgM9VbgngMRsFJjerjlCnVHTf5BwBmrFUHfWXW9aXPt+UkSdSskDgCkCyu35d/KJUCsPkoUcO1DyggX0JpspHtW2qtIpgY9rBWVG+2aow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:11:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:11:44 +0000
Message-ID: <c6532948-f3fc-4f47-b3bc-2ab789b84b4e@intel.com>
Date: Wed, 27 May 2026 15:11:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260527111335.140000-12-matthew.auld@intel.com>
 <20260527111335.140000-20-matthew.auld@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260527111335.140000-20-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI6PEPF0000021F.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8ed) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 8327f58c-1fa2-48e1-94e3-08debbf18001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 3sBOFnZ2RcELdEw1L8PCFi+YKzAJiriz9xkUOQ330VxpsvEy0lUuzuHXkXBokGb3YM5p6IDCABljtV4KTVEaxz5kuE+lvA2Dmr8xA46L3nx+aNEFhivbvgAsdK6Ip2scX5It9hJJAjERh8ZLyNY21vBYZfdv8sT8hAO0G3BBo91+s1RTjuKB+OAFp5sLySO49d+JHyN2o3TalJTQB1R0CAVHbuCHyOaSuoQuW5afqe5Qxd4EQj2VbtANIP6nI6i8DSqJ0+Aq70jheM0nJeelIuiQ8LL95BMaqP1q86ybqU98/G2zYaAh+b16mpd6MJGmmZfZLsV/5inIYOrXtCZCwT4lo0kH3yKDyuJBwyldR+wjRjO4QS7Ej+6BAUZeFr0P/+udQKxS5J3kBp0Mu4j2awQHDQSffelzERDSdTZHACTB5SqdAzxMqkPRhjfO1TxZ5eKEsyWzlaC/LGLldrTCwVu4k2EdXtGvP7v7NkbfonNw6gsULJFW2I54EICRfzhmAgUU5dE6L5HG24gC801hqxkwVOwpWmmgcTZaJenY8k+6oYJd9a6wKFagR8gSotM+D97Zptq9YCPOYpUlL03uNe02t3iwJ4gr5DEF4poEEWbAeqvLFB7qRyaAqkak5AEJlUNS+Tif62npfp9EQ0TIwPBlTPZNgm9ygbQdjVuFqkFxmOOHbci+t/TK4PIOlhlh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0gydnJ4TUROU3JvbDY4K0tya3J3cDJ0YlQ4MUpEMzYzU3NwQjJsMkdTUHFR?=
 =?utf-8?B?RVZvWnRLQ0tZeGs3cjdZeHRURVhMNVQ2dWtDNmt6cFp2SFd3MXpVYmkzdU5I?=
 =?utf-8?B?NDQ2a1k3THM3ZlNFbGRYNFhya2FQM0hkVWFnNVZqVDh3VTh1K0VCRWVaRHlC?=
 =?utf-8?B?VG1NeWNTOVBmejd0V0h2UElNMEFnTVR4SXYvdHNMbEFleHZOZk0wQk13cnBN?=
 =?utf-8?B?OWZzanBPUnpIeHR0NTgyVW5NQlRzWkpmcEp6eGgxMiswQUgweEVvc1VZSjlz?=
 =?utf-8?B?YXNIM3B3U3EwM0l4L1dZYjJSYnV6ZkQ4dW9mZXA3dzV4dUErcncxZHI5a1p0?=
 =?utf-8?B?WDlGME13bCthMmt1MTAvR3JRVUJlbWhwclc1M0VnalpTNkpESitQTXM4MjVV?=
 =?utf-8?B?dzFYV1N5RzdwZkZIVnluUThtdmZTTEtZalF4aTBkVTluWmpjOXI0aERIa0Fx?=
 =?utf-8?B?V0YvZ1lYRlIyT2ljdUt2SzdSdFRISjY2ZVhoYWpXV1pHa3NxZW9uL2dzdWY3?=
 =?utf-8?B?OGxqRzBSTS93dWpqWHZweHJzbTNSS29YY2MxNExLQmhZaUNLa3NhcGF3TWFK?=
 =?utf-8?B?cDBkdDdVRzgrbmgycG1sUFJmUFdLY1dUV2w2U0RLdlhXT3dKN1I4QUhyZXNG?=
 =?utf-8?B?azVJL3grSVpwYmlGRXB6MDF3TXBKN05rbDBUTExsMzdnaVlndkJVUERrUytH?=
 =?utf-8?B?d1JrVnRPQXgrcmVCbDdpNUU2K08xOHVPc0xCRzd1V3Q2SE1ZT3IxbTRvcW9u?=
 =?utf-8?B?TlhwZ3FNQ2JGNWh5ZUV3QWhzc1plaU9ramV6cUt5dXoxc2pmNWVZRURrQldV?=
 =?utf-8?B?RFlTNDJsWUJhbGNqTWdpR09MamxaZ3RHN3AvZ08vdlhubDllTFdWbjNjQVFk?=
 =?utf-8?B?eVhWQ2dnUjFsY0NMWm94UE5xWG5Ib3FzdVhDSU1renlyU1o1MXplVGg4TllJ?=
 =?utf-8?B?dXI5N2pLN0VYcnY0dVhBU0VxMFVOMVM1Uzd6azlsWHFwT053YzZONmRCdTJ4?=
 =?utf-8?B?U3lodUZOUDcrbWEyWXBxNi94Tjd5Qzk5Y3lCVFMycFBGMnZVUWViU2hCU1FU?=
 =?utf-8?B?WTRPdUFrcGtGUlB3ZmExVjhtSDc5b0FDRHhGVVlJRlBZZVR3VFY2ZG5BcEUv?=
 =?utf-8?B?d2Y1Q29lVDNIV1lyNkl4K084bzRxMU4rRUtYbmIrZmk0S25nWUhsaWU1UTBR?=
 =?utf-8?B?RWM0V25TZzFRSGZueW5tRlVsZ2lhcTkxeHhoN2RKRlhJYWxGbVRnUCtXQlVr?=
 =?utf-8?B?amNpM3hSTXV6Y3lFcFRVU2JYQ0lyTFRJSWs2VEY1VXNuaXhnRjdjN0VDN212?=
 =?utf-8?B?eEEzSlVaSmJOR0RUSE9xSmFBc3VIZmpNNGluU1A4b29tWFdEZUxWN2o0MlA5?=
 =?utf-8?B?cTk2WmxobkFUQ25MRUNzVVBmZkdNdGNGUzYwQ1prYjlkdUUvaFlQb2RQeGFO?=
 =?utf-8?B?RGZMeXptK2VvRE5aYlAxdEpza1dxMXlwRDZCZWFFUEVVaFpmVDJKb0loUE5J?=
 =?utf-8?B?OWRqU2w4NFRJaFczU09GbzhtVXFzT0tSNVMwQzQzb0IrVmlDdXp4bEJZU1dm?=
 =?utf-8?B?Q296MHpZUnNybHA0RnF3azI3eEt6SEIvOGZ5YUhZbS8rRU1pc3ZFZVBMQkl2?=
 =?utf-8?B?U0FhNGVrZHBKSkk3TXp4b2tiZ2tnOU5VcVMvazBlY0Iyc0VNVzM4b2s5c3F3?=
 =?utf-8?B?KzgzcHJWTG1KbzhXQWlmdVNEVXZmZlp0L2tneFZPdmEzSFNjTFgzQ0x3N3oy?=
 =?utf-8?B?cUJ1TzFjdVQzM1RaMkdZM0xtR1J5QmVxUnJzZmxNdEtHSWYzeDdWT2RmbW5V?=
 =?utf-8?B?QVZOUjN0ZEJiRnR4QjlCbjQ0Yk5qcjVIZ0hRUFV0d1BCaGRvQzdpSi9URjBM?=
 =?utf-8?B?NUlyOWhhMGhuc0xTWDFNeVA0NXlnTVFBanM1SUtiSmpqdmJ2UTRsSG1ZajJR?=
 =?utf-8?B?WU5MM04xZ2xITHhJMnJCMUQ0M0RjQjJlSmx4Nm4venFSaVdsNDllWEthUjh5?=
 =?utf-8?B?T3gvTVpqSWZuaG8wSFh4Q0ExRm81QTZyT0VwbXoraDdJdXFDVlk1Ylhva3JQ?=
 =?utf-8?B?MzNRcVJwQ3dXSzNaWW1CRTdjbzM1UXh1ZkhGdXBJcjJIZmtWb0FuRmkzaU5V?=
 =?utf-8?B?WC83RVp3RWNxREZBRnRiWDMvdlJQZG1NRUMwa0MxK0dtd0hTTys5WnNOZVBN?=
 =?utf-8?B?T3kvMHFseGgwR1pGTDJpMm9jbWhsTnBPSFdOc2R5U05FQzZnK200Qit0N3ow?=
 =?utf-8?B?VTdaRmFrR0RGOHkzdkV3R2N3dUFvMWEyTVVRenlIamtTOXhUSUdyZk11aWt5?=
 =?utf-8?B?WUxJUEcrU3d4NkpBQ2Q1MnRac0J6S3IwMzd6NXZyR1VMbkNkekgyaG1pY2gr?=
 =?utf-8?Q?2EeO+fjZGWmc+TzU=3D?=
X-Exchange-RoutingPolicyChecked: Rycvh9XSXFywsRat5/qekQ2+zINyLbNi7TRxymYLtRxkaOdLVgs6636cBlhBWS8yQ5X2iyWkwexngURzObBbcVfDs/NjV8NKoa+paQw5oGAirLAp8of0qsuFMZhKc0kLMcDFc4mshJ4akm+o+LPkinh1WIYE+Uj5O18i/jxtsMOiRPhUEkoRLzI73NRfy4NdVffl2OKGnN7Jjv7ElLrVH8RjR7n6nSBPN7QuRyrfchHl9tPnX8L7U6Ga2iwL3vdJHHCU0RwCtIxGLx6CXasDSPRx2Lc4/C1bsFsZNZC1vOvTNS3RtLGkrmNTCa7t4IbNUME3eWT/me9usUPulAXTNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8327f58c-1fa2-48e1-94e3-08debbf18001
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:11:44.4023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXnFzsvfH8btqK6jwX0QALmrBC4eXs7+1i6zs9axk+ORqOfyvagMZXljIX3XH03fGaaKpBgwKVF2QEendb6HC2HlP0H6m1u7+9oXeUV6NgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
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



On 5/27/2026 1:13 PM, Matthew Auld wrote:
> When host PF writes the logical configuration for the GUC PAGING engine,
> the VF is meant to query it, and mirror it. Size of N means we have
> paging logical index range [0, N-1], with N fewer normal copy engines.
> 
> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
> should be zero on older platforms, where we should simply fall back to
> the old behaviour.
> 
> TODO: Check the final GuC ABI version before merging
> 
> v2 (Sashiko):
>   - We can't call use the guc_has_paging_engine() this early in the VF
>     code. With that just unconditionally do the query, if the GuC is new
>     enough and take the value as-is. With that drop the -1 special case and
>     just let the upper layers figure out the rest.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +++
>  drivers/gpu/drm/xe/xe_hw_engine.c         | 30 +++++++++++++++--
>  5 files changed, 81 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 644f5a4226d7..608678f8b18c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -52,6 +52,12 @@
>   * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>   *      Tells the driver whether scheduler groups are enabled or not.
>   *      Requires GuC ABI 1.26+
> + *
> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
> + *      Tells the driver the paging engine configuration.
> + *      Paging engine logical instances are guaranteed to be dense starting at
> + *      index 0.
> + *      Requires GuC ABI 1.35.1+
>   */

please also update xe_guc_klv_key_to_string()

>  
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
> @@ -60,6 +66,9 @@
>  #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
>  #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
>  
> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY	0x3003u
> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN	1u
> +
>  /**
>   * DOC: GuC Self Config KLVs
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0cd9d77f3351..5c1581c9e432 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -658,6 +658,41 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static int vf_cache_num_paging_engines(struct xe_gt *gt)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_uc_fw_version guc_version;
> +	u32 value = 0;
> +	int err;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 35, 1))
> +		return 0;
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
> +					    &value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt,
> +				"Failed to obtain the number of paging instances (%pe)\n",
> +				ERR_PTR(err));
> +		return err;
> +	}

can we do some sanity check here?
maybe at least compare with BCS_INSTANCES if not zero?

> +
> +	gt->sriov.vf.runtime.num_paging_engine_instances = value;
> +
> +	xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
> +	return err;
> +}
> +

missing kernel-doc

> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)

and move this function down below the xe_gt_sriov_vf_query_config
to keep xe_gt_sriov_vf_query_config and all its helpers together

> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +
> +	return gt->sriov.vf.runtime.num_paging_engine_instances;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> @@ -694,6 +729,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	if (has_gmdid(xe))
>  		vf_cache_gmdid(gt);
>  
> +	err = vf_cache_num_paging_engines(gt);
> +	if (unlikely(err))
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 79878f21b1da..d171a8242a34 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>  bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 80562ffadb16..21cb9bc1a341 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>  		/** @regs.value: register value. */
>  		u32 value;
>  	} *regs;
> +	/**
> +	 * @num_paging_engine_instances: number of configured paging engines.
> +	 */
> +	u32 num_paging_engine_instances;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 31aa6dec0a48..9cdd3e64235c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -652,7 +652,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	return err;
>  }
>  
> -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)

nit: maybe it can be 'int' from the beginning?

>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int num_copy_engines = 0, num_paging_engines = 0;
> @@ -669,6 +669,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>  	if (num_copy_engines && xe->info.has_usm)
>  		num_paging_engines = 1;
>  
> +	if (IS_SRIOV_VF(xe)) {

maybe this should be:

	if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {

so VF will either trust the value received from the PF,
or share the same logic with the PF otherwise

> +		u32 vf_num_paging_engines;
> +
> +		/*
> +		 * PF could in theory reserve multiple paging engines, which
> +		 * internally the submission/scheduling backend can load balance
> +		 * from. Not something we currently expect, but we are at the
> +		 * mercy of the PF, so we just need try our best to mirror the
> +		 * paging configuration.
> +		 */
> +		vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
> +		if (xe->info.platform >= XE_NOVALAKE_S)
> +			num_paging_engines = vf_num_paging_engines;

then we will not bother if received value match the "num_copy_engines && xe->info.has_usm" case

> +		else
> +			/* This should only be non-zero on NVL-S+ */
> +			xe_gt_assert(gt, !vf_num_paging_engines);

and this assert will be obsolete

> +	}
> +
> +	if (XE_WARN_ON(num_paging_engines > num_copy_engines))

use xe_gt_WARN_ON(gt, ...) instead

> +		return -EINVAL;
> +
>  	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>  
>  	/* FIXME: Doing a simple logical mapping that works for most hardware */
> @@ -690,6 +711,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>  			}
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static void read_media_fuses(struct xe_gt *gt)
> @@ -908,7 +931,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>  			return err;
>  	}
>  
> -	hw_engine_setup_logical_and_paging_mapping(gt);
> +	err = hw_engine_setup_logical_and_paging_mapping(gt);
> +	if (err)
> +		return err;
> +
>  	err = xe_hw_engine_setup_groups(gt);
>  	if (err)
>  		return err;

