Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06572C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 08:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDAD10E29B;
	Fri, 21 Aug 2026 08:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAlS7LCV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CADF10E29B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787301180; x=1818837180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f+X8O+GOOVg3hjmhpuclw7XTJgjXqgBpZPmfVWcqZEY=;
 b=oAlS7LCV7Yd6a648E0zliPwpSHIihNnNJcTAX6FRHqbLt0p5LXbnQmQC
 NuZFC9vxzZwJqn/oqDcWFv2TCBnyxvQ73TZESMJrTOQKjR8LfxjKhboCg
 CyMeE6dwI+3P/gDq1gmj62C7GX+AHY/k0axyh0h3LWnKw9k5OHfP6alzv
 p34jL8CK1ZQI/1TsHLGH1Scadyr2bVUjAotJqMv+f/rXqwRiOvhhSJGMw
 IbP79MJlTl8YdT/4E+afBU8zotCUiV4ZLBrIDxQuXUDlukSFwl058kX+/
 9psqTyksSjDcSh2hNM2vaRiYBWGG/1g0mEvk/g7lf2M2K3uSmhjN/Fux1 Q==;
X-CSE-ConnectionGUID: MCQjOrYnTBWMkjRR+DrNfA==
X-CSE-MsgGUID: G2dqVN+NTQG56DAgIwCKxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="99002297"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="99002297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:33:00 -0700
X-CSE-ConnectionGUID: kpH/ZPYDQD6UCDD40g6pbw==
X-CSE-MsgGUID: TZQE0580QoWqdOzTsKSXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="265771604"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:32:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 01:32:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 01:32:58 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 01:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sODJjMe/otxizrVArGN2bgxqj9zKEwr+BEX5vzMgJaN+X0kt3vYiz3D/rXUCWyax8UioTm2ZL2YoTjUVhwSdc0Ycnjwab5TjROZwhzyy3khgrqK2MVQbd0dMluS/hlkP3PlnzMpbXlGkhF/7yiY/yWEvvqixqLUmVWdEdkcTXMqX0JvUXpl0hPQFOQWV+AffoRZAmk6TNHjAeaXqT9IjmtT8OGGKyCHeqUzQpOJfTCLLxJSx3IgXjENikpkMHmSWsnY6xAAJP4T4YZCEV+zsksyYD8utZOyYczSKvaAMObhClqzcUYqkPOO3bCXvYQtQCTunsLzGKa0d0HG5YtWwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1e5Uigyu2qr97xf+Ts69XLKXt+TllpbN+Qusvsa7/E=;
 b=NtpSmYPl2/N/3uP68gqSnqHQTB94UrUNp3eO23Gf7cM2mGPLHRoSL9K0ZB4fqbEu7J5nGHBEaOpboXrpHf3EEEKRKN3oD1N7nxllFHMH2Ogj5sdVN1O5UZdMVPddQDPiazznALdowj/eS6ojRiVs0mOcEQOb7ofzc7z68PZnrqkS925aXZR8jY56fbHHcg0G1u1HfkYs2xt8rBJrwNCEKGQMpxSDEeDxnDPDbIFB3USilhxucUTB5sTbPt2jYuFPzf00hZuz9FC47QN8q/fpcDF3VePOcJUX8bwDMRS7nCPXRh3CWTp52vvOTVEWowy/CL3soqKRRU5cKD0rEUettw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 08:32:51 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 08:32:51 +0000
Message-ID: <7589320d-07ec-41a4-b0e7-25bc29d064ed@intel.com>
Date: Fri, 21 Aug 2026 10:32:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v9,09/10] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260701083051.450259-10-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260701083051.450259-10-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0012.eurprd02.prod.outlook.com
 (2603:10a6:803:14::25) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 741f8681-d3d6-4e2f-fe69-08deff5ec9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|3023799007|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: i7HoL8P84JFJiFopgzWayXtBzt88niTXhimFBfek6iPw1dqKGnN0NV0fWbpA5ZxjtqRq2+dykUoA18QibrMMZ1NJooBtC1PtHr/SEbQzvH8WJLHNg5QzLMsz+tBB1S/YWujVGUK/mPATSkaiDvzC6K3D+qYC0Xulkv8TGDZWt0lbbzb/FyhrPEkD062Mib3Vz2ZaI+TiZ7nC5KhktVvlgEM3i5B1cmijMd6A5MHpXSKcctvQUcbz3k2/7UNMYRU1/oSnUYKuP52VepS4UvTNyrylIgB1gnxt/g669CqDKl06s3y3xARrdSb/NlOLwq/khFB/zoiJZM4DYCNOLBb2weZnBqtpcC/LAWGWCefebhVCFXiE3smjtXpHMxoi8+Uvbi/PH+EkWdmcL6JhGX7WgtXlxnqbZC5JUOeYcfZr5jLy69pb19SrB3Rv1jtHhr8SXTQB86IvBlrEcKnKeFLj/H24v2TukUWNGRmK4a63tpvtW/OLUMAVn63oG8eM1VG8D2km73w7t9vgFdUIzpmftJTOo5v6e00ZYi2an54+w/gtTtlWKBhmMZs1EpifPq3A+m9QP+QlMGm6FkeHBY8EEf9C6/nKjNN8M15FoSPCmyi7DVVVyoNGJV0KnQZZR+kZwuruI19GLT3Xj732kToutYW/Xxb8FYCFmtPvb02HGIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk13blFyRS9NdHVQSjB2R1VrTzM3WkVuK0c1T1NISW1NcmFONmZoTlpSMHda?=
 =?utf-8?B?ZXBJZjBwazF0VW1XMnZZWStpcFdDdGhHRlVhbG52RSt1d0VaSU54MzhwaXNO?=
 =?utf-8?B?Y29TL0hEZThCQ3dWS01mMFNPZmp0b1htQlZhNXlLaWgvUHVtcXZsV2diWm1C?=
 =?utf-8?B?T0ZjQkpQTmdBS05vMGUxczE2aGdLY2gwd25DM2xhN21NdFdvNFJscDVlRzZY?=
 =?utf-8?B?R3FScnRtV3J4RGJTS3VkS2N4VjRpSjBSckFqSDA5ckdBRk5aWkJjWDJ3QTBV?=
 =?utf-8?B?MmxhQXY1Y2JLUUpZT1pYMTc5YkErYy83aWQrNURDWTNFaHAybThXclROTS80?=
 =?utf-8?B?VnNOU1RWUkxmNUUyb0d3UGpuSm45dU5wVjg1MC9ZUG1OeGFYdFppRzVzS3JR?=
 =?utf-8?B?U2hpQzFDc1g4R2lCakhtek9ob2JrVllENGk4ZnJoTExKUm1FTnovTmtiUWQr?=
 =?utf-8?B?SGZZNXFxSVJMYjN3T3dnM04ycFFNdWxiQVlXeGQ0UUduUk9TWlNlaGJBUFJ2?=
 =?utf-8?B?cVNCOUdPZ3V3Y3ZnYlBaRGRPdGRkQ0hKRlFvaGZVeDQzeStZMEVMYWhDa2pm?=
 =?utf-8?B?VVc4MzF5bXNPWWpPeUpuQ3VZbWk1SWE4ZWM5VHNidGJLYTA0TFhNQ2w0akZl?=
 =?utf-8?B?c2ZBSWcvYXFSYnpCVGN0MjFzd1h6UFdkRkZzenN4VTBhYXR5OGFLMVk5KzQ0?=
 =?utf-8?B?RFovMWFSZW9tY010bDBUall0ei8vYVhxN1FKcTllM3BOaTVYczB6Wm9tZFpu?=
 =?utf-8?B?eTZWTkNyUVFMYnRSQkNvT0RueUVnaHlTRDlaY3NYNEJlcHphVFBZUFBmU3Fs?=
 =?utf-8?B?dnJCdVcxc2hhNmtwdit4M24xQXRMQjV6N1g1VTFEbWhRb1h1bEY2NG90NHov?=
 =?utf-8?B?VzhUMjYxdjF4Y0Z0Q0hSSitCb1RJaGNhU1dtMTFobU41dEVocTJ0OVQwelNH?=
 =?utf-8?B?ZWMxekFkY3hFU3daZUNrV09FRkU4YmZJa0RvQVFSaFQxMm8vOStlTUR3dEJw?=
 =?utf-8?B?V2dxQnNKL01SK2RGVDJhM2I3QzFLQnFUZlV6Vlo3YUVJbVF0dDA4Zk9NbmY1?=
 =?utf-8?B?OWhpYXdRM2dQZkRsOVMxVmFMYW8xbXJLUEp2YTJLWmhaM05rbmFvZW5BbVVk?=
 =?utf-8?B?TEtzbkkva3J6akxEVExjSGhEelBFaGQ5Q0lYVUtOUVlNREJrVklLNjg2SWtR?=
 =?utf-8?B?VXo5SUNxeWFqdmZ6R1dXY2cwN3hpYzgyVVJDOERUUHVQTTR2ZTNSMHZ5VWZP?=
 =?utf-8?B?ckhWRWFua0k1eG1IOTA4SzlGSlF4d1FZeHdpNjBVNjNjZ0R6UU5pakoyanYy?=
 =?utf-8?B?RmY0WGFMZVpqMkF5UEVHQnpYaDdtdDBBWG9lZ3Mzam1MUXFHelFCeUJkZkUv?=
 =?utf-8?B?b1Z2TUQzK3ptY1hZRWw5b1lXb00rNDFKdEZ2WmxBZStZQTJzRnZuZEdJL2I5?=
 =?utf-8?B?Zkh3VFFZOFFkU04wRDZNZys4KzBxSFVEbWc2c3ZUc1VXYzlaRnlQN1MreWNS?=
 =?utf-8?B?bzQxMkVKTTgrZWtCdFFjYzRPTURyanNnRzVJNVcxL3JTTGJmck9Jd1kvRjRy?=
 =?utf-8?B?eHJNWC93d1JwK0ZzS1BjV2hiektaRW5xNlFiZ2ZGYkQ3MXB0WFlPUVA4NnYr?=
 =?utf-8?B?TEhJSVA2cEFMU0VjTEp4NXZGbzkrdUZXSUZjeklTMGdyL3lGcWVIN29pT1Fv?=
 =?utf-8?B?Y0prWklVTmtEZnhJRHM0V0ZGLzhBVzJPTVlXMDhxTENRVnl3ZVdEMkNiMUla?=
 =?utf-8?B?cm1MSGRVVjFkNVlzaFQ4ck14S1FxRTZUclZ3MWZhbGlGck45ZVY4WHd1QXk2?=
 =?utf-8?B?cmlUc3FGdk40RGFlVDBQcDZvZXpKczhFZkd3cmNJRWw5azQ4WE12QkNtMUJY?=
 =?utf-8?B?czBJVzRsSkl1TE9RdWhqN1JjaEpkMExhMU5vMmhJaDFyd09sa0I4YytJblRt?=
 =?utf-8?B?S1F2WUsxazFRTjROTjVqSmRCVlR3ajdLZEk0ZjNqTHR1UzVCdUZ4Qks5SWZS?=
 =?utf-8?B?NWplZ2NZQk9UaDZoaDB1THlMeEY5SVpoNkpjeXZaMEV5M2pVZ1lXZHV5NzJX?=
 =?utf-8?B?VC8wcW4vcUpOZWozNEFheCtIK3JHQU84NGhUVERQdzcxc2xLby9FQWErRDBu?=
 =?utf-8?B?SVU5MHJUaVZLRzVKclh3MWU5R3NjWXdJTnQ4UEU5Tzg5ZXdCdXhFTXpqcWF6?=
 =?utf-8?B?c2dwbkZiV2N6QnpvRlFiVDc3NEVhdlFjR3lnMDRDN1l2cWE0NG9iUERlVnFK?=
 =?utf-8?B?RksrUVpsRkl5NkRTTmI0ejBnaHN6Zm9QRjVLQ0s5OVM1WWJMWE5nbjIvbFor?=
 =?utf-8?B?Q242UFFvZzJDc2xGZDZyV0dUZlY0UWhKa3NWOG5XUCtIamlULzdoQT09?=
X-Exchange-RoutingPolicyChecked: o1Kzn7J9TGg90XC/S1kAb2QMAb1JTNFbqlpuDiNzBExw53bqF/Q/8BclHdjrXHUU4u0+rjFTIojE0GeeK1hfKOjMFpHQTnMlnwIv3d6Z6R4eU4kUWljGv8Pvus1x6O4SbZsUmbxWXPX9Oh0tAyu2zs8X5v/lof0G2MIejdkpVdplBtgad1FpmC7gtMydVTOSxTsAu2Ni/9fIZeN3bcFixfnZzGc4oxJxDi3JiMNRvlGstX4Cnkvkl0tefrh+UtJES3+1Q9K7wG7EXUeMnPyLd8JpOEL1/DlzdGOxOUmfYzppmxdw2KvbWV7sA5zUo6mIXQreEbzWXBc45kNfZ2o7Ww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 741f8681-d3d6-4e2f-fe69-08deff5ec9de
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:32:51.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aozctI+m1MhT7lEQByWm9tx/dfFKp/DXdplOter3szl1oFGdzBy7dMiRNTfBGjhCQR9KQoIjec/otLJW1bOKaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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


On 7/1/2026 10:29, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) support which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: Spell out Function Level Reset (Jani)
> v5: Prevent PM ref leak for wedged device (Matthew Brost)
> v6: Add PCIe FLR documentation (Daniele)
> v7: Refine PCIe FLR documentation (Daniele)
>      Introduce xe_pci_reset_skip() helper (Lukasz)
> v9: Add 'Xe' prefix to document title (Rodrigo)
> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>   drivers/gpu/drm/xe/xe_pci.c          |   1 +
>   drivers/gpu/drm/xe/xe_pci.h          |   2 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 129 +++++++++++++++++++++++++++
>   5 files changed, 136 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e7b146880f4..3c001b2a4aec 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_error.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 80fa60821a47..3ccfa8af482c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -480,6 +480,9 @@ struct xe_device {
>   	/** @pxp: Encapsulate Protected Xe Path support */
>   	struct xe_pxp *pxp;
>   
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 03362480e3e0..d11188790eca 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1353,6 +1353,7 @@ static struct pci_driver xe_pci_driver = {
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> +	.err_handler = &xe_pci_error_handlers,
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b..24e51a71a959 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -8,6 +8,8 @@
>   
>   struct pci_dev;
>   
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
>   struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..544005af4d3f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_printk.h"
> +#include "xe_sriov_pf_helpers.h"
> +
> +/**
> + * DOC: Xe PCI Error Handling
> + *
> + * Xe driver registers PCI callbacks which are called by PCI core in case of
> + * bus errors or resets.
> + *
> + * Currently only Function Level Reset (FLR) callbacks are supported. PCIe FLR

This is outdated and needs to be updated.

> + * wipes the VRAM and resets the state of all the hardware units. Therefore, the
> + * contents of all exec queues and BOs in VRAM are lost and the hardware needs a
> + * full re-initialization. The way Xe driver handles it, is pretty much similar
> + * to system suspend/resume flow with a few notable exceptions.
> + *
> + * Prepare phase:
> + *
> + * - Temporarily wedge the device to prevent userspace access
> + * - Kill exec queues which signals all fences and frees in-flight jobs
> + * - Stop the scheduler and all submissions to GuC
> + * - The fact that FLR is needed is because hardware could be in corrupted state
> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
> + *   contents
> + * - Remove all memory mappings since VRAM contents will be lost
> + *
> + * Re-initialization phase:
> + *
> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
> + * - Restore kernel queues which were killed in prepare phase
> + * - Reload all uC firmwares
> + * - Bring up all hardware units
> + * - Unwedge the device to allow userspace access
> + *
> + * Since VRAM contents are lost, the user is expected to recreate user memory
> + * and reload context.
> + *
> + * TODO: Add PCIe error handling callbacks using similar flow.

This is outdated and needs to be updated.

> + *
> + * Current implementation is only limited to re-initializing GT. This needs to
> + * be extended for a lot of components listed below.
> + *
> + * - Proper re-initialization of GSC and PXP for integrated platforms
> + * - SR-IOV cases which need PF and VF synchronization
> + * - Re-initialization of all child devices registered by Xe
> + * - MM corner cases
> + * - Display
> + */
> +
> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> +{
> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (xe_pci_reset_skip(xe)) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		return;
> +	}
> +
> +	if (xe_device_wedged(xe)) {
> +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
> +		return;
> +	}
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	xe_device_wedged_get(xe);
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> +	 */
> +	if (xe_device_suspend(xe, true)) {
> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		xe_device_wedged_put(xe);
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (xe_pci_reset_skip(xe))
> +		goto out;
> +
> +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
> +		goto out;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to system resume flow, except we'll also need to recreate
> +	 * kernel bos and restore kernel queues.
> +	 */
> +	if (xe_device_resume(xe, true)) {
> +		xe_err(xe, "Re-initialization failed\n");
> +		xe_device_wedged_put(xe);

I'm not sure if we should bother, but it introduces a small window where 
the device is unwedged while still broken.

Lukasz

> +		goto out;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	xe_device_wedged_put(xe);
> +	xe_info(xe, "Re-initialization success\n");
> +
> +	return;
> +out:
> +	/* Most likely the device is unusable and there's nothing we can do about it */
> +	xe_device_declare_wedged(xe);
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
