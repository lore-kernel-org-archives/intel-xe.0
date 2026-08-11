Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B968BC5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 09:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6428110E2A0;
	Tue, 11 Aug 2026 09:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAU9c44a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E1610E2A0
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786439521; x=1817975521;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QBJcueG14J/OPgF5MQz6pah7nChae9V5XMKQcgDP048=;
 b=CAU9c44aYVEAQjxF6usC75xWCTjSLUmbomN18d2Mi8z6nGZZXkPozmem
 H8KQZFToQF4S+52N1Cr4gMEGCRLMSwCmSGS62wVim3Cnm+ZVtGRHBocRw
 8mcrucB4mIM7cJ3GEYNWW72gpErenmZK3d3munrNJ/kopixf0hBGomDpr
 ad1gz+YhInZ9RrMTCjp1klYux4agSkb/beafN1yC0rbrg7ZJ+7/S+aqcR
 T1TX60nOZUDPKAOMPvI5zHybS0T3fdLH+uir4/c757MhaS5eRP8l6CmVt
 +WgV855lMa7Qc3YIrz63MZ5GkrNrBbhYzFSzCRPpZJaa5CHrJLF2cvb7b Q==;
X-CSE-ConnectionGUID: 18lPh3cvQGigUITs4WmyIQ==
X-CSE-MsgGUID: WmTimGlhQLeP9Hu/+eRErw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98112691"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98112691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:12:00 -0700
X-CSE-ConnectionGUID: dpnI5h20S3qI41GQwiuXhQ==
X-CSE-MsgGUID: sJ7kUyzXQFWO5bhQ0z11EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="259971698"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:12:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:12:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 02:12:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh6r30Q7rqkENi3NWXlCiTGCJ6inSFmmr7pNwReWPcQ1/cNd9bEYbGLDFf+wLGfECrnuFMf0Dg+5G228+VrbjsfRmHNDBkJabM+e9sJp6ejJZwT9X58eNishPsKGVUHeWYgeVi8F6g114ojw7WZNsnmO9FjaAspdwLjhRk9AeVjq76bZsXnEQyAGVKMDlcqt8gR3/ZusDTlHUTWcdVYfh3wbmmAbqXUt/mGzExjAXY6dOpiMmxpWPKItwUxtoUIbjrsLVqB0qwqV3UwbZgzbXedPk73OeV3KKNpsLkx1D5/mLO/Z5SBjjvIAobI7v/TgbkjOaD/zm3dWemWSkNGprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYUTBlQekm3OjwPtsG8JzHGdrLCqVcCBdXzFOgVqqPo=;
 b=QUnpCkLqqm7Bs0iTN2SfrI6QL9e81o1F4EO09miD8ih4Fk3e4Of79MYuwbUIn+Adzu1EviVSUiRAedQBzKjUs+vVpODiHKdJ/p7tRfHIv7zRiOZcZAcHl/CJAHYNXILSMIUUtBbj07NIjuPwKrKPfmXItDynOaPQ4jX9ZfzuoxFIlrmRFZEu0vpcPLbVzf+JquuObtD62Di1qfkSOttD91VPgdOkNFaotZQiF237+rE7uv2QXbwyc26dv5GCZ2Bv2LdeCYvSOHQden+tux+8RIS7BAaGgeFiVpuZEBlqyEQGNlWAZ7Xv4a8MdJs68/lvaJAh+5YZXO5djsPs0QDA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 09:11:53 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:11:51 +0000
Message-ID: <b97259c7-7cb1-48c5-a62f-060916319f87@intel.com>
Date: Tue, 11 Aug 2026 14:41:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/23] drm/xe: Report 'probe blocked' error using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-17-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-17-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW3PR11MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ffbcb6-3de7-4d4a-29bb-08def788948d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Yx4VDbZx8UIlWTXVpTRB1HvD9ih+kEtI9RQZnMHL1zXUK+8OfMzafx654M8m7nU2Hxez/mYyCwUjCevhDAFT7iuwfNNyuQQc6FU5NpTf3bxsBhm2sw/FUerYoWGIn74jUVvYoUAndv2o+JwLChgy6XlOX++xYKUdaCaXKUT/9/ccnRwn39c9jvmovtwxkHWIvbLL9WiBNncQl1TbcZWrwawK5yMNRBBbyFZ1XIw9ZZrfZUlHyGmk/o2Ae7INPcrU6QWYVvioQjvKDzHUQuAFaGkO/+WWNXKuazqzkb5b9RgBilmKv3BGAMI4kOAGnFopEGN1TUoS+5ihh4sJO//tTJ4Pe/w3ssTl6vSPWwpS/5KZdPkJYCM9Hcg2mGX6ZwwHW7tYPq02w0RWz0m27ALVnb1ucewmx8EaqqVXvQVY3ilq3AWw//jow0CunL5xn14EHMZx32rUQ9YgfKWXy+K72Gw8U/qxId8HnwHiNrFALOH1kd+2xU4zXYIgL+UiOofVJG28fh9hA07XMpRCFc7hZcNAhN0PsNCJrlcOxvX/+cWYs2AUrwIri0A89F8+nHnfdjfnfrNWbi0lh220/irnbapjfDHk7ws3h/QYNPJCtKBc1VktZZn5zpZJuIitS3qAPHr30cSMw9GvLc9rTLDlAr/Phm19QPS8GtCsNa2iTYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlZqSm5xQkRPUDg3WkJqK0ZyQTcrVk00SW00b1ArWDgyMWdxcFo3RkQ3ZTRw?=
 =?utf-8?B?VldUSDlGMGkyT1dIWTZOcXdCK283TzVhT25CL1hLd011SWVvdERvOFBsWlVL?=
 =?utf-8?B?VjV1aGdnZFdYWGE4S0dvRG9xRVBIT21pRUVjL1hUSGdCMlpFYlRwbDBjN00r?=
 =?utf-8?B?eVR4V0V1UGI1KzdUQVkxMW5HNkc5YXFEMU8vSXZsaDFkY0VTQm05QjhUWjEr?=
 =?utf-8?B?eHNyU3FUV010RkJiY1AweDEyTHZNYlQxR0VibklKTkxsYmRYU1ZrUUpvTG1Z?=
 =?utf-8?B?SzJWS0RsYUtWWXZad2xRM1ZBZkJLZGVHaGZqR0pHS3gzcWgvVitXYndsUHVl?=
 =?utf-8?B?dVBQOW9ITTNNR3NUVHFma1hMQWNMV1BkZVpMUW5jMWExTWo3Q21IMis3c1N6?=
 =?utf-8?B?L3Rxbm1XeXVSUUpsdHBETzFGaStHeWtVTHBzUGFSU0J3SEZrNkFZZG43VkhZ?=
 =?utf-8?B?MXhQQkwxUm9zUUFIRG5JZ3l5SmlDb3MvYlRWUmNlazdqZElaRzJtMVVSWDRs?=
 =?utf-8?B?RUFBL054Tlp6NWtlMjBDUnQwdFdGRVJWa3BkbWVXRjF6dEw4Z3h0aVRreisz?=
 =?utf-8?B?dVFEU0VoSi82blZiajI3MisxMWJla1hsaUFwMzEvMHdSdjVNTE96azUxTmt0?=
 =?utf-8?B?dVNzVkt3bm5sbmtydmFzYkJRaENJVG96d0xWemdoMDlzTU9zUFFhenBvNHcv?=
 =?utf-8?B?VXU3cEdXVHFCVEVaSnkzQ05GNWRhTWFseW0zbkl0S2JFbnhmM2JjQ3l6Z2pv?=
 =?utf-8?B?Nit6dVlKL3RURE5FK1NGZ1Z5dkFmaWoxdnp2dUF1K1ZRNVJnb2tab1VldnNh?=
 =?utf-8?B?TVFzd2ZvUUsxWW5Wb2dBa2Z3c01wSmFGU3k3cU5VcTFkWU10QTJXeEZzVk43?=
 =?utf-8?B?ZktCSTRHb3QrQTBkWk5UeE9RS0gxUXVibUxTZzJqY2tHOTFZQlBiM2N6enZS?=
 =?utf-8?B?cmpHUHlhOXdKODAvL0NpalVFcElDTWNCcy9SRi9JT0VpQVJmQndRUjlkck5K?=
 =?utf-8?B?U25Bd2pnVHowNGVKdWxma3dxSDM4cjN2WlBKdnRvczE5Z2RZRUZ0UTdWZjRt?=
 =?utf-8?B?eXF5QjY1RHhiMFFYa0xqUEVjVkZTSGM1bERRakt3VXdqcDZwMFNrUVpnS283?=
 =?utf-8?B?ckhUUWt6cCt1aWNOanJtckt0a1cyak96aGczN0N3cU9IVGtsSTNwZzhzN3NB?=
 =?utf-8?B?eDNuN3VXcXB3a1Vpam9qT1Z5WkxYSmVhZmpiQXNSdlhkT05SaDdjZ0hpcnB1?=
 =?utf-8?B?NEtSZ0pVcWhRTGJFZlF2UEpVbEhNSjIydFZFdjhKSnJaNldGcUdwdUhGb0hG?=
 =?utf-8?B?UEpuZzl4cjREeERud0djVmtVZUdnYUYwNlFScnU2RXI5UHVFdi8yMTdlRytD?=
 =?utf-8?B?NGZsYkIrQlB1aU5KRjB0WklaM2NiU3hBcU8vbzNBWVRmeUlaK2M0aU1UY1Qx?=
 =?utf-8?B?MFRsN0tiV1E2TVpMV2Rwa01JcldoY0d0dUVRQ3R1bkI1Z1RzT0hIWlVFZHNY?=
 =?utf-8?B?T2wrT250M1JxcFFyTFVxZE9zQitrRUxUWm1OcnRvc0R3ajZoNDVGUDdOemkv?=
 =?utf-8?B?UmJ4M09wR0h0bkNvMzZyL3FtTFRqc2MxZXArd01aOFBPSVg5WlBQMlVoTndq?=
 =?utf-8?B?TXNzTGY3VHVlblMxejZ5UnRnT202KzJoZlFjVjZVcEdqVnVYNnpadzFuWmJQ?=
 =?utf-8?B?RE8ybG9HUmFCenRVckpzeFZ6ZkN3cndhYmNpZUluVHhRbXhQUStBYzcxTjhN?=
 =?utf-8?B?RjRNZTRmUWJKOXYzRUcweitnYWNaV1ZFZERZQmIwZmNtN3p2MklSQ2xYSzFX?=
 =?utf-8?B?QW1YYmgxTTZoN0UxdW9RRVF0OHRKN3hNMitiTG5WUm8yLzVBcmNzMCtFZGpl?=
 =?utf-8?B?eTZWczRaNUZVUEErZlhFblJYdnBXS1dQRXlHODRHcEVoWVo2Z0s5ZmxZNUR1?=
 =?utf-8?B?NlNkbUpMTnpZd1RneWNac3JVOHJyeGNrZ1RnTnZ3OGF3THNpTUFnem5MZER3?=
 =?utf-8?B?RlhnSE5xMnR5WnRKZEsxZk9mSzdOQ1V0eFQrVnRzNDBFT1o4MW1MbllTZFE1?=
 =?utf-8?B?WXlRTWE1dW82YVZZcEVqakpRQVpENUo1bHVweXBjcHVQMW9ranRQaGdSc0tJ?=
 =?utf-8?B?N3FpdWw4ZEdpaGs1R2dQeVFkeDBWM2FPUkFacmVWSzdpbmJvVmhzYmJIbzBj?=
 =?utf-8?B?N244RXlldXhiSEk4djNpS3BHVktDaEFHbURHa2VLMVdjdEw4SUp0Q2ZtYjg0?=
 =?utf-8?B?VkxJYm4yaEVYOTR5c1ZpUlBVZGYyM01IT0psSUczREdySlk1NmgxUk1FWlNJ?=
 =?utf-8?B?Mjd4d1NvR1N2WEtWUjl1Vm1UeFJ6MHM4R3d2RHd0Smd0RmNTOGFiQUJGZDBo?=
 =?utf-8?Q?sUWEJ9v7Nvb/0/+Y=3D?=
X-Exchange-RoutingPolicyChecked: K7A8PcnIWlqpMyEc+/ARV13fT6NknuSPZFV3P4QG9jVjcw/kxafMBMYfP1d9+IdsRx1s+u7iKOQpPpLcpyaDKO0Zz8RwuM1xKuszBvV3WvvpqdNv6tw67Q/uAU2OIbM7P9PAreQS7iplr3D2ZKruSQCgA34LnW4GwN3On3k/HAzLSqnUM/MZPWf4adNAi02TQa4cnYlA3LieEb7nv6p+eWsHXURoPXQbFy2QHvgXjOOhC7EpR47W1/TZQWKzZZ/Y5uCuaCLIEMprF0KNCHEj0wn/O/DV9eJ4M0Ftwa0cM+ud1vE6B4ixW1tNeEgE6F4VQ5bey2AmGL9rYZTNjFAllw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ffbcb6-3de7-4d4a-29bb-08def788948d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:11:51.7763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovGy2fpHTkHQ85z+fcXsW8zO1J4xmFdZ/R1nawzLJSdEQFSUlsoysAqyBjiBDBBTaP8I0/fesCMEQ5CbGO2fabun9IPcOacykUpJp5KwsdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report 'probe blocked' error using xe_log_info() helper.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: use info severity (Aravind)
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 36d62927b969..a3c4046b56cf 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -25,6 +25,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
>   #include "xe_pci_error.h"
> @@ -1172,8 +1173,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	}
>   
>   	if (id_blocked(pdev->device)) {
> -		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
> -			 pdev->vendor, pdev->device);
> +		xe_log_info(pdev, PROBE, "Probe blocked for device [%04x:%04x]\n",
> +			    pdev->vendor, pdev->device);

Please drop Probe from message.

Thanks,

-/Mallesh

>   		return -ENODEV;
>   	}
>   
