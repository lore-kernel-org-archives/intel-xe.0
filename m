Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD2EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 04:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F349610E00F;
	Thu, 15 Jun 2023 04:42:20 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2247510E00F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 04:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686804139; x=1718340139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=66eBQ//rAxLwYn1JIMZAudpJ34Pgczd1nfEjBVGhhTc=;
 b=YGuIgoCqkFw9NuWVW1jICv+zC7jrVU+mDyHSVjluBmgdvq+6PxjUrq8d
 ci1ie3CixCVMAHaCTzP00OaYSSkaH/u4nEkdNk9wCHTZiENtQWHGEVGKJ
 Tj0oEKp9jgzRiyqCL7qaE16F+jIDZ7SqWXYd/LQ3SXV+bxhxPX5H/qCL6
 GgvcJNdj7cmCJEN+8orCfXwkiwLYEHooZM7M0wDlCyJzMyDRAAYtXcz+x
 dnwt2ZiRpn5hbkJ9Om/zfHXlfMo598jxC1JeO61uMjWoXtBttcnnFBGjQ
 u7FeTfLWn41q6fvewdP1D/wF1gXTxl3hDOYpnqvQ3M5xTyGSqEHVHgwA+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339156712"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="339156712"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 21:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706489377"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="706489377"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 21:42:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 21:42:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 21:42:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 21:42:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIxk2Kf8VYnW/FmVoDbqwOhpNhe+Ry53eBXl2l99dAIeoULsuZEPqpUpQC/iWvtRLagi7wvkI2+Z/JwdxLnlwuxKIm2XeLGYFB4oDY4iAqPhYtygRwFAU8ucQ5C8BXPW/2fIXZhTdZaQaSuXxfVUxMxUTA57Ec+VMZ4NMLIoH0n4vfTjqL52nHvC/4GSinaB3bRNjzhj97Gh8sZGQGkk5oelrLnNvnKBk2TBHnH2lLSJALrdc7IgU/RIPmHxJyG/0rNjvJ3wRZiULAinu36Y3G9pTDoiT/qlbz6cBMQNWHI8DyIHVrKK051fdVWbSXpRI8d+E1Ar2LdNZ5PCfZINpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWjJcA8CPOFFBfxoIP2UXZzGw6qGxjeaIheK5LJxSng=;
 b=dEQbfTM4bX4IzMwclJxCkq1LqE/mrnhg1x8F9sJTxKSy9PHcxvqlNNEkOj2irvEK7BplEZ7pnHmiblOG+fIY6kego0NyPc82Y6AqjcDAbQb2jIAiuJwEmq8YyJQ/riitZNgZ7wNwY5Bo0/csYg2HxHVwnSz9BSkMlWpl/QewQoI5A1dD0d2QJlC3iGURicWf1Xe1Qp+YdWC7NIbgx0e2qugHWHBnDn6/fn9HtseAjqeje2sW/YaxjO5q8IWDoMF4caxCIK0x23+n7PNsiy5cHdNTwwJe4ySt2XOhYKV7dEQripOP/NIJke/Dd4+dBCWM1K/XBGNO1JfhR8WeIoBjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 04:42:14 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 04:42:13 +0000
Message-ID: <80105db9-e10e-aec7-73b3-aa780f9d0fb5@intel.com>
Date: Thu, 15 Jun 2023 10:12:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230613094232.3703549-1-riana.tauro@intel.com>
 <20230613213941.GH6953@mdroper-desk1.amr.corp.intel.com>
 <20230614175403.GI6953@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230614175403.GI6953@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 87dc7324-0a0e-4ae1-9a71-08db6d5ae319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +NV3s8GxHNi12qMlWZgS4Ty3INr6PrEOpxR+ev8vS0F7ZIKAg0UTx5H+hUKxYpV7Mk66pjf9Ax1Ia1lwWcqHnVNkOU/F+aApkORNtj3hkSSc3OX3pM29NtnU8Fp2jskGBb7D8rqcNx3ZlYKEG5QBSrNrD20uR7/uQ5HBYCYwjDnMO0O5Ek10KEVtqRVID2oT7Nt9jMauN8C2UAKnNO/brqc1AI2DTVvwqIEEw4tEBSdLvIbiRWvHUoGTBLEY4xpqEI9RPM/7WPl+vY2/tQmd+xZx/0/MRS3MePkf33B4D4Z4oCLBYSUNa121DykjdD8KkRnmEQfZF68mWemzzqBsmxP52ys8n/8L6TGHGb+Zm51aDcPMTfB4BL4vd8lCHKAf2froKslggULJJcbB2yLoe9QUGZH6jczAtZwGqCD4IyiMIpIcBipRLjge/fJPQ1ACn2ZyKyE+6WRqOpCS6R432jEVSvdKloD4zussy4syCaAvxpExTGzPZ3kP0hlSdZK/U/MET78UzdLDqQWO9eMomWteFy0/YORFnc9SSWEHmtxDRABpIepU7tZfNxhPCffPF2pieQv+9T76Co0FFScJF1ljZfK4Dvs/TDKNV6Js9SgnIFTNd8wmcXd4lhItydFCjsToBSpU5Vmvozauahz3lA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(5660300002)(2906002)(6862004)(8676002)(8936002)(31686004)(66476007)(66556008)(44832011)(37006003)(6666004)(6486002)(66946007)(4326008)(6636002)(26005)(6506007)(6512007)(53546011)(41300700001)(316002)(186003)(82960400001)(478600001)(36756003)(83380400001)(2616005)(31696002)(38100700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3dMQ0xXeWYyYndJVnlHU2dTcEVUeUQ3cXE4VGc5Z24vRU5udFJsU1JvbS9q?=
 =?utf-8?B?ejlmYk9hYklNbU1hUytGVWdVNGpCRWxRVktQdE84M2R2bEg1SG1Sd2ppdFVi?=
 =?utf-8?B?OUtjL3ozSW9TNndFbGNReitoSUVlNy9OUmRpbEpKL1NBRGdYeDB3dTNIZlU2?=
 =?utf-8?B?dXM0S0R2SWNuQ1JUTHFqR3dZSEVXREtUUDlOUmJCN1JycjJUcjUveTQwdm9q?=
 =?utf-8?B?NHZqcjVISjNRblEzTndWQ1FLbzhJeFR1OVU0RzJya1hwSkFMQ3VZUktsa01D?=
 =?utf-8?B?NFFmTEtOdjhDYW9kcXBPNmc4WVVVdjU3TWwvK1JtRE5GNlRYZVpQM3IwTHlo?=
 =?utf-8?B?UW9Lb2kweWprVjYvSkxuY0hWbmxES3lyYTNDOElUNTZNTU4xWmxrMXp3NHY2?=
 =?utf-8?B?WGxjbGYyZE1JMXZSbitmZnhhZ1ZMaEtFcGYrQnBtR2JnVVJld1I1TUhMWS9Q?=
 =?utf-8?B?N1lWbVBGU3NzZ05kTkpMdXVqMkNZTEM1ZkZDbEc4RW9BcUExbW5KUXJsUklv?=
 =?utf-8?B?NUpyZDROeVhGc1hqV3NTSGhwYWFUV0tEWlVDMWdtcnZhZWZKVHVnaW1nSW9k?=
 =?utf-8?B?VlZ1YmpjZkpoa3ZMMlV0NDZXbDVaN0xBNUNjc0tPZm9uMDJzNFlvNDVIcTFL?=
 =?utf-8?B?TmhkNitwRHpwTEhWQ29nK0tHRUQ3WGV6WVFkVWt1cHIrSnB1eksxb3JESkhy?=
 =?utf-8?B?WEg0RzNNS1F2b3JDbzhkQTYyOXJ6ME95UTdKcEE5d0lRcklrclZ3Wmw4NGlr?=
 =?utf-8?B?NWh3c1NLdzlWRG5UUmlyb0F2c09QY2Y1RjV3bkxERUQ0b28xYWdXdk5JRGp1?=
 =?utf-8?B?MmpVWGJjbmFyQVgxOGNLOThWMVE5YzI2NjgrQkxFLzZpSXQxam45R1ZrNmdh?=
 =?utf-8?B?bmFEallqbWozTjV5eDBwM0pTYkJFTVlxM3pmbnJHRFUxcy96NlV5NGwydXpK?=
 =?utf-8?B?eVQ0WGJjNUJ1RnBoVytqMDhLUjZyMDdoRkZMQTJsMkJIZndFSE1XVHZUMm4x?=
 =?utf-8?B?SjE1WU1oNGFQMVJ3dzIxUDdJUGF6T3RBUjdLUnpST1ZMUXlKWFBLS29kVnhX?=
 =?utf-8?B?OFF2bFdiL0tXN0phRlJyQnlXQi84eS9NNU81UDRTRmxSYkR6aVkydmZ4eEw5?=
 =?utf-8?B?bjhhN3I1bzlKL3pzanZudm9sazhCSXdBaXBIYlhZVzd3NGRHNHp4NXF1Q2NM?=
 =?utf-8?B?SGZ3dlYwbndRbUN1OFVKcjhxSWdkd1JDTjlZbVl1cndwdTlGM2g5M2g0c1hy?=
 =?utf-8?B?UjVKRUhsTndjMjNzcSs4UVlEZXNYY0pTTzd0VEllMngxSTF4bGo5NlRKdmtx?=
 =?utf-8?B?UGpYZDR3V1RQUDVRRDUrOTBlbjJ2U0tYbXFSUFJKODV2NVNMSmV2MEh6NE84?=
 =?utf-8?B?cEs1Q2xLSmVTcElRc3dCYVdVR0pDaytzeGxpeGdlL3lNOFVYS2tFZUlTakNX?=
 =?utf-8?B?TFhtMVZBUXJMMGdLNzd6VEF3UXhSb2lKbnZOYURhM2FQdSsvUFY1NGt5Qjh1?=
 =?utf-8?B?ajFTaWRnM2tsYklRY2orOFpRKytiSlB0VDZJTjFHTVZkL3FZYmZsRWJWT3Zx?=
 =?utf-8?B?MmgwZERaZ2RZdDVoMnU5SjdIZXpBa1JoM2ovc2NTZWFTQjE3ZzU4eGhtK2ho?=
 =?utf-8?B?UU0vRlNhbFBXd3JFU2ZyN1NBdlZIMHVEMTNjUXNWYXQ1KzhjNC9NRDN4R0hi?=
 =?utf-8?B?bkJIcWZxWmZ6U3VONFp2Y1dxdVFHdFJvWDRPV1hOL2JSV21wendkdmtmYXo0?=
 =?utf-8?B?cTJVNVV5TWY2OUw0aURic2pObnNKTWJzdWVwL2ZTbVg1K3dBM3p3YWxhVCt1?=
 =?utf-8?B?bFhzVzNHNEM0Q2ZTNlhzeGE0ZStDcWhMYmx0dTUyZWJKV2tIUzMvL2VHMnFh?=
 =?utf-8?B?Um94L2ZpQkFRdW5zQjRRNkp5QUZYR2lxNU9pMTNmOW9XTmE0NHAvSzBCOTdM?=
 =?utf-8?B?NC92amI0ODNQa1lUTmJtbmZCN3B6K0toTmdQVGJPME5GUGNzaHlzQWxrZUhw?=
 =?utf-8?B?bGRPYnV0MHFoOGpnWXVuUTZWNXZyUzVSZzdQQ0ZuSzJVb1FKUUE5UlovUHNT?=
 =?utf-8?B?MFg3dmxJdXIvVmVmZTg4ak5VS1N5VXRxeFJRTjFTVm5tU1d6MSsyWGhuWU83?=
 =?utf-8?Q?f/dwX16S1hFsXf8P/nA179xDL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dc7324-0a0e-4ae1-9a71-08db6d5ae319
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 04:42:13.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QF+t6U/slwvHgqw1HyJWoES5QYEdwVJSLR5PX4nYNenPKypInyarxfSGG2PPTQeRUBRA5hknO6oucjPrGvgB2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe : Fix GT looping for standalone media
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



On 6/14/2023 11:24 PM, Matt Roper wrote:
> On Tue, Jun 13, 2023 at 02:39:45PM -0700, Matt Roper wrote:
>> On Tue, Jun 13, 2023 at 03:12:32PM +0530, Riana Tauro wrote:
>>> Currently the id of primary gt is set using gt_count and not
>>> the media gt.
>>>
>>> set gt->info.id of media gt using gt_count
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index bd1f59b49928..2991cf5365d5 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -590,7 +590,7 @@ static int xe_info_init(struct xe_device *xe,
>>>   		 * up with platforms that support both together.
>>>   		 */
>>>   		drm_WARN_ON(&xe->drm, id != 0);
>>> -		gt->info.id = 1;
>>> +		gt->info.id = xe->info.gt_count++;
>>
>> 1 is always correct today since MTL is the only platform with a
>> standalone media GT, and it's a single-tile platform (so the GTs are
>> 0/1).  This will also be true for any future single-tile platforms with
>> standalone media.
>>
>> If/when we eventually have a platform that's both multi-tile _and_
>> multi-gt, we need to decide how we're going to identify GTs.  Since no
>> such platform exists today, we also don't know for sure whether every
>> tile will have both GTs, or whether only some of the tiles will have
>> multiple GTs.  It's not clear that using gt_count++ will necessarily be
>> the right thing to do; maybe we want to make primary GTs 2*tile and
>> media GTs 2*tile+1 (i.e., intentionally skip IDs if some of the tiles
>> have both and others do not).  We may also want to adjust how we
>> approach GT identification in the uapi in general --- maybe we don't
>> even want to give GTs a global ID anymore and instead want to move
>> toward identifying GT with a (tile_id, gt_id) tuple where gt_id is an
>> intra-tile number (i.e., 0=primary, 1=media).
>>
>> The current GT and tile series aimed to just preserve the existing uapi
>> without changes, and using an ID of 1 for media (with all the FIXME
>> comments in the code) does that for now.  But sometime soon we do need
>> to make a formal decision on exactly how we want to work with tiles and
>> GTs in the uapi, going forward and that needs to be something that we
>> loop in our userspace partners on; we can't just make the decision
>> ourselves on the kernel side.
> 
> So looking at this patch again, the important part isn't actually the ID
> of the GT (that's already being set correctly); what's important is that
> we need to bump the GT count again when initializing the media GT,
> otherwise gt_count will stay "1" forever, even when it should be 2.  So
> with an updated commit message that focuses on the gt_count rather than
> the ID,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
Thanks for the review Matt

Sorry for not being clear in the commit message. for_each_gt remains 
stuck at 1 and the media gt was not getting initialized causing an error.

Thanks
Riana
> I can make that tweak to the commit message while applying; no need to
> re-send.
> 
> 
> Matt
> 
>>
>>
>> Matt
>>
>>>   	}
>>>   
>>>   	return 0;
>>> -- 
>>> 2.40.0
>>>
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
> 
