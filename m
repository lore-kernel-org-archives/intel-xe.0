Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF398C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 09:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695E10E8E8;
	Fri, 19 Jan 2024 09:31:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E971C10E8E8
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705656698; x=1737192698;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vfmsXkfj05f9R52ofxYXUxNhbSwAXgXo2mbDCwASwHY=;
 b=bS4Gwb81ec9uizuuILEZqsGcgSVXtHlquOfeUKRKOKDcXWWFlB/CZ15s
 lcLf/5aJOuaX+naANfVJIX58if0Ylb6Efhd+HPHki3JiN0Y0MfYMMJCdl
 KPJ3wnUTFGQ6ycBaZ5LxcCWL3K/+zaEYgYjCZ3s9o/7+bFDbTBkKvGWQc
 cTCnM9ksxUQ8LDrWe0NXlDmzEWDrk5TOiBVPsl77jMFmTM6GPUFcMEg68
 d/vh6nx3cx1hkBIhMAiZI0+EuIZQsZ8Pcio819a3TohGW0jpO9byJz8N3
 y6t1FHGzDs86Yw+MsPoA/EY9oYgDmqfBjFEBJYpZCe+xkvEsoB1DwsJNx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="467077426"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="467077426"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 01:31:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="819022675"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="819022675"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 01:31:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:31:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 01:31:18 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 01:31:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjrNyuMkm75nI8BHH+UcS3asYvyxEu/V0jaKzgZ8xHDqjLNAupni3lj+69r1gm54MwcpH5M93SuzDtQ6JcFfuMfF4PTfp1MJXU5KeXP7bXxLlsBSNh6w6Ihot3CSaQMPjmfU/l30yhV1/SXcfzAvm/+jk0PHJexPeFkSB6hmEfT/4njZUVRgShiR6sFXaztMluMXfXZuVO52E6351OTnPPhUot9zSpAwLhqqzz8baA/ID+fLIp6fubPeP6OEn7YIlkZ4kNsqK8cbCVps4bqMU0/DwWd8Ddz9K8zPBldTqyL9gZjOO7fGer9RWOGknu4wJFj58YmtFBgjEiTbrO+v3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bqe5EBsj+qu4MzegQZ8uiuNNNQI6oy4G0wJuoRWC1mU=;
 b=HMcT5yk1i80XESw72ppMGpIrc41LNLL+TnKX9wN45PaNZYeqxkiLLdzUdFXFewmcITaULrTbDFVlbd197FJ3aqn77Ds1KR3rIAXPK2KXibnO5xRxHFGss3Ee7TUGZ3+2s4XmYC63o7c7QwOLWblYcUNKBaypUPqW763zhIznyknRQC6dKiOJ3LuKUaeP5iPYdOSyVj8hOsgYAZibX1w4kIYXidLqjaQsnWrbdxVHK2zxM9ymqctceAsWTvmKZidolHy0Cdpqk8KApLkmjxV10Xw3zeSBe1lpahyLbjcTnTRy91MKZC+dCBxdrw/6HP2npN5dfLfz3MqzfE1+OAx5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 09:31:17 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 09:31:17 +0000
Message-ID: <d4620fae-0316-4881-ac03-cb4d6f99b01b@intel.com>
Date: Fri, 19 Jan 2024 15:01:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
 <CY5PR11MB621172B0F827E4FD706646DB95702@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB621172B0F827E4FD706646DB95702@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA0PR11MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acacbfe-540c-4e5b-eb4d-08dc18d162ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/Eaq53I3tnz6o6/wijWSHcUipOzKVaj7m6zumSF/TtE2j3O6Ac3WkoY0d2fZz1yWo2ouneRwmHflI3D00dNJ+ZsrORpu96VESFKKg5OK4C8vvcwmOb+AA4y5WIDYp1lBB7lCinzwV3d22/xT3RfTIEcyz5m6q2iuHPv8+R9zWFAa9FWylTkA4a3c/IJ9IgZdMTO7U94NsswmtgzJGw4T6UoAqZt8mEul0naKmFdbfaEwMC0GVfEsTXIeVjc2MsVsM1JzWOgTimEySC6L2S0+4367hmGpoK9LrtY4tGo72W5UNto32ItNGmdXr2VIbkHAldc1WfinApW/8MFPoh32Gf9aXZGJiw8J+yvKFenZOv6OdycQfDQFzW3bzKsGSuZaXMr3XwsL+vJoKH4u16B0rEwoXAXcc5/xuBuC9YitYOGOH6tk6Irxrb36JgyGDp8BSrMPPt8p0BtYCi7gv61xqIEUxdaywdj5X2UQs3z2PpEw3n2r2C++KTVRkqZvbyf8Xry2TLa60STbOnZ9+FoX03+omuXXJ9FbRHif4S5Oipr7axxLt7n2LpH2uQ+a5JsG/ggdjM9smecs56E8920bz9WUXkv2a6NL6r6KmoDXN9kpI6rpNhP90VSLnFbLa5yAuVQCBbCa5CGe4wzJHsiNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(86362001)(31696002)(31686004)(41300700001)(8936002)(6512007)(8676002)(4326008)(2906002)(316002)(36756003)(66946007)(66476007)(54906003)(53546011)(66556008)(6506007)(83380400001)(107886003)(110136005)(2616005)(82960400001)(478600001)(6486002)(26005)(38100700002)(6666004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smo4d2pKNTA3Vjhza3p0UDRkdG5BRXIzZjdyb3VJbStqZXBpd2I0RXh5enkx?=
 =?utf-8?B?Q2ZvckJOSHBxRXpWSmQ4eW15TDBFU3d5VXh0Wk9DelRORmt1Vnowbk5CUFFB?=
 =?utf-8?B?NVBoa2pNMERJTVpJQ1B6d3dWZTVFVHlkck1MbGUzR2RTZTdOcHNsY2d2UXow?=
 =?utf-8?B?bFF3Ym1tdkt4djkzL2M1R2NqU2lqR1hBcU5Wd2RGK25JMnV1Z1VsVy9heHZR?=
 =?utf-8?B?TkwvUjhiOWJCRnJXK2tjdDVaNUdjdmZrRDNud25aNVpxblRmRUxZdGgvVnZx?=
 =?utf-8?B?aFZ5VFdKcnRLdXl6SjlwTEI4dUswMVFoNlhIOVh6VVl3ZEVOTkxjRUJCdU05?=
 =?utf-8?B?YXBDRWhTbTNEQ2ZMZDJZbzVLZjRwejNxZnpLSXlLcUlmeE0vVHJsR0NMdWQr?=
 =?utf-8?B?YVF5WFpuVHV0ZzdqRG4rQzlkUHFEVytjTEJwb29BS2IxRHRnRVJOazRjMUF2?=
 =?utf-8?B?QnRnSjU2a05RNE9UMFRYcGQyVHlHNDdLZlI1VnpZeUJFc1A1dlk4alQrNUhU?=
 =?utf-8?B?UjNKZDhDaDlOdDlHSHhWczVCT0VTR3E2MkFiSDBjc2hMZGdrd2pQWDE0YTRw?=
 =?utf-8?B?N0RNNjlVVDhadldldDVQa3pRRHlYdkVpbWFDVGQ4T3VhaUQ2SEZEaEVocFpr?=
 =?utf-8?B?NFlBZjhkV2gxbUN0TlMzMkpGOXlKTW1MMnd4encvMkQrWitxbmlsTWNJZE51?=
 =?utf-8?B?QmJPd2lWZUR6bFlrWkd2dnJPVHFEMkRCY1VCSkpscXhmSUpQTG0xRWZVa3hL?=
 =?utf-8?B?aERtUU9GYkdKQlBqd09lN09wc2VPNEE4UGFid1dOOUxHbE9OWk1CTmd2TW1n?=
 =?utf-8?B?STFlZm90U2FZUVc2d1JQK0U4c29ieEVzQ3FtYlMvODZ2Qm1mdGlTOHRCYzU5?=
 =?utf-8?B?TWJFdmpxZDl3UnVjL3Jjd09vV3BBOGtvNC96YXowT3U3alFJcVJITWVsbnJy?=
 =?utf-8?B?dmFEdWlPaEdYdjBoTHA0ZThMcjE2R1ZyK2N4QXhOZHJWK085T0xmQVZEdmJK?=
 =?utf-8?B?clB5WUtPZ0E2WXpoZmhMSUNNWUdUbWdEejdFSFUwbnhCOU1uRXNpN1psM1J5?=
 =?utf-8?B?TjRrOVoxVnoyNVV3NmVsYVpPMzJUdksrTTlaZU5KQ1hJRHFNZ1czaGUxWDJW?=
 =?utf-8?B?V0t5ZmkxYlA4VU56NFMrNWNLeGFVMVgzZG1jUzl0QS9oZmNsa2tnanNzOGVD?=
 =?utf-8?B?cEdnNXVOcmgzVXZWc1Y5aE92dkxyMU55eGZVR1RzTk1RZkdtVGNENDdoQzhM?=
 =?utf-8?B?eERjaGRrMkNkMnJEMS84OUpYcTZMalB3Vmowd0JITTFveklQaERRWXBvTzdt?=
 =?utf-8?B?ZW9UYU1vc3BxQVNtZGRXQktJU3krMmQ4TGRZL1FNMklUbzgxK3FpVGxGUnZs?=
 =?utf-8?B?ZGhzTUpTNHJqcVlZdFNyOHhQempQazU4TG9qNldPMkpUaVJpSWZJbVA2alJt?=
 =?utf-8?B?NXdNeTdJZ01xVzNwQUl6N3hNYjdPcGFPRDNUdXowTFNRMHBWbS9pcmc2T09t?=
 =?utf-8?B?RGZuZFdYcUdXRzM1Sk93aDVhT3F1Tk9MeTNEWWJ6MkxMQ0YrcFVYMCt4OCtI?=
 =?utf-8?B?MlRBUmE1dC9OUktPd0ZLUDN4d2srSFRGT1d2dWs2eENpOEJ3L3U5dHh5MGVj?=
 =?utf-8?B?NlFwNHdqK2wrQkdtM04zWEFwUkg3L3lCN0FqQ1ZQKzU0OXk0ajBQMTYzSTBu?=
 =?utf-8?B?U0RxSG0yVjQzd2hsOTFBMXpGVHA3dU83NEE2QzdaUllTMFhmMTNoMkx3S2dY?=
 =?utf-8?B?eFgvUURzdXBLZ2VxY1Uzam52QlJtWXVvUTRsMmxxNW8rNWZFcTZCN2ZWc0o1?=
 =?utf-8?B?N3h6QVpybTVRQ1VucmxqKytTaHN5eHB4RnNBdUFGeXpUTUxqaERJeDNhWVlw?=
 =?utf-8?B?cm5DRXQrVzU1M1I1c2JEOTA3VDQzbzRzeWNMV25vQjYrVFlCaFhWbzlTK2d6?=
 =?utf-8?B?WmlJRUkyZ0JFcG9MckQybGhsS1ErNjg1ZlVEbmo5ZDBhQkFjWjBtNkdwb1JN?=
 =?utf-8?B?K0NPUXJJUmtjaUFtQ3JMS3BWL3pnczg0Skd3TEc4VEY3QlZmM2p3Wmt2UGp4?=
 =?utf-8?B?UnpGenA4LzhxS2VGMHV6T1hZM0d5Z0tkbzBhSjdvMk42NzN2UkExTmFNdEJh?=
 =?utf-8?B?WmhCVzVtVHQxbjNmQldrQUV1SDZiY2hjRWhRdDAxQ0FMSVNYQ3dlVTZCMzN2?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acacbfe-540c-4e5b-eb4d-08dc18d162ff
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 09:31:17.1537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+K7son6TqrkEjpqm42VR+EB1w32XbWQqhLevhVENZKQRmM6GnYxihewv63TY+X+ByhJM289/7Z8mvB8Fee2Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19-01-2024 14:58, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Friday, January 19, 2024 1:49 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
>> Dixit, Ashutosh <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
>> <vinay.belgaumkar@intel.com>
>> Subject: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
>> support
>>
>> Expose debugfs entry to check if platform support GuC PC (SLPC) feature.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>> b/drivers/gpu/drm/xe/xe_debugfs.c index c56fd7d59f05..2f474bf0e7c7
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct
>> drm_info_node *node)
>>   	return to_xe_device(node->minor->dev);  }
>>
>> +static int is_gucpc_supported(struct seq_file *m, void *data) {
>> +	struct xe_device *xe = node_to_xe(m->private);
>> +
>> +	return (int)!xe->info.skip_guc_pc;
>> +}
>> +
>>   static int info(struct seq_file *m, void *data)  {
>>   	struct xe_device *xe = node_to_xe(m->private); @@ -67,6 +74,7 @@
>> static int info(struct seq_file *m, void *data)
>>
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"info", info, 0},
>> +	{"is_gucpc_supported", is_gucpc_supported, 0},
> Above debugfs is per device.
> We need this debugfs for each gt.
The field skip_guc_pc is device specific so kept debugfs device specific.

Regards,
Badal
> Thanks,
> Anshuman.
>>   };
>>
>>   static int forcewake_open(struct inode *inode, struct file *file)
>> --
>> 2.25.1
> 
