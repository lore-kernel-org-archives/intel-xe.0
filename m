Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D604FC47073
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 19:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6DE10E1A2;
	Mon,  8 Jan 2024 19:51:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7390610E2A6
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 19:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704743463; x=1736279463;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rxRRzky4V8HYq3/nyszCKPobJJK/Os6D+/8QJoNpNJY=;
 b=iIYg9bVvhCuG+rjBCuS+TWbu1edkFEfqR8ipJvhEWp2rAzGeoMr3oO2J
 ouuc07wQhnog7utgvUpY3mbxImEMV09HE1DFhBSWL4H2ttB7q0g4nVbmw
 Zi7kWR3wCDNpNVFlPuTvenviRQYXkXF0tZV9NYi5J+FBpRAiD4Lh72YP8
 d4Qfb81gpdVHkqiwhcKE4bLL6qA5d8wbXqB4emFLQ+99XCs6Mykr4jHWy
 Pf9LU9h/msC7FFuFS/5KyODuNRSsyJrD2iFvNji8WTofQLAUj5A10R3D5
 26KsL8jsISlpuYz3HI3MYMQonkhUCBQtlYZsIIZ/mSeQKRMLMwM0u/+fp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4733417"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="4733417"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 11:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954751929"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="954751929"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 11:51:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 11:51:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 11:51:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 11:50:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8qi+GkG19uIfznukvVcRhwJFzX1fl50SuUFe1YHmmv9GiQDXjbY3PwATMYdT5XXbGdL8V3xa7hK15rektwh+VJ5uxCDzhFJYizPTCwL0M2I7EPVAiXL7m51RkJFwoSSFkkRgDGdnFJOrlD2H8ZeDMEafOhCVuxHoRkJwuSKzz9YstfCAhZrI/+Und2gKE28wDxpT5eT3Z+ou8gHXXfxPkHPcwI7i5nUxlOd6dPCQsBe82PnnleNa6KC9+AwQmidZLxIu3LKVhSdlRCvSghrMcyXB3SXYbromblnzTE+pYdvaw58hDYSgELdDq+bll+16IK3hSRt8AagRw6EL3hRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WT6lyNEONUdVde7dDPh0hsWKJCjp1EkwZoPfm378gAQ=;
 b=QH8JwLQSSY0Fl4i0EPL4d8ZyzNtRbFJz3SHyrvZ86wEGVSUv6cGKM4d2e7gJpbTIieCx0fDHoA+i2HWn/dwkEHT0Aoban5UWlYQ6d3HOWPEcN2rSmdH7vIsW86z1VS1CGEnd0XCG90R0wBIMtXfaVESo8zyPvIfV49uMTQp6X8ixDIGE51TXLlTnRDbnFdlHElVphd2H6vihYOs1x9ekahWJnb0KfN0yuMY4ENYvpRr8g94F/FTdw6KYEBO0WwPbGc10wBhaL8LnoB8fL2B4H2zJgJCftPAKNs7cv6BEH+8ZXbI1iKas50M88638K2rqjl9H/u825zlOu5d1FAWKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 19:50:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::5b8a:3861:cf39:aaa5]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::5b8a:3861:cf39:aaa5%7]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 19:50:56 +0000
Date: Mon, 8 Jan 2024 11:50:40 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 15/17] drm/xe/oa/uapi: OA buffer mmap
Message-ID: <ZZxSEA5P7/q7awEl@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-16-ashutosh.dixit@intel.com>
 <464d71dd195eac4145cc5dde4ee4e8d04899387b.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <464d71dd195eac4145cc5dde4ee4e8d04899387b.camel@linux.intel.com>
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: eecd0f7b-bc7c-45b6-5edd-08dc10832125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +77tThiXGtB44GekfvQ1WtqAXUMw6m37HaESP6jdT+IQhsaeGIJFWizmxSA56O91nWD4nJF4JnX9MIlzUVu1bCqDY8ZWOcf6djCdEbpzdZdyUkazbEPMfLDOvjKpf9/R3Nky84YjvFljr7tZQumOw8cyVhn2pk9Q8f9XxLZpifk7qc61nCZ6Lcf1sIkU+fjAromw2rfRv4ROIhpWSUbWP95zy56VRC9e9jYmvn/EJ1/5UyfUZlwlS/PmpoyHQRCpSVJvX4ZgM8MZzEAH32866NqCgdy3iXmwF49ACSDHP3CLu1xD8yv2UyGkGHx58lhmUkBg0F6HJhWnwQV5ysK0ZYQQxQIMMRrER6xvaCdTYR6TOudqPOiaXp4+MiIc9v+5oDGy9w+kpwTD1A9/+8jmhwJ6yg4nzELBr2R01a7FVODVU1L8wSaswyThsUCiUfO0WxED8vGcwjo3T2wf3j/LxtUNbRcT1GOL9XDFl4Ktdfj5quX1aSWi72brixCtXw+mLDOzovIgy2gmPS8L1pJ1fhouCD963QPDpZ/Nic/pZdcEp9T3/S8/gRfaTp8yReBf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(8936002)(8676002)(4326008)(316002)(66556008)(66946007)(66476007)(6916009)(2906002)(82960400001)(6486002)(86362001)(26005)(38100700002)(6512007)(478600001)(9686003)(66574015)(83380400001)(33716001)(41300700001)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2NvYVF5SlJzRFNKUVhGc090bVJqSmMyT09qUXlIWitiVnlIWWFmZjMyU21r?=
 =?utf-8?B?TzZmTlByNkxSS0dlYWdlYlB3WUcyd3lCSEs1MENXb004K2pyaHNJSlk0UWVJ?=
 =?utf-8?B?ckZEUmJNam5lRE9xZktjditEVVphRHBrTmwwNjZ6RWhNMXdBTnVOY0pJNmtk?=
 =?utf-8?B?TUQ4RkRDdVB4SldzUFZpbG5DbHpoZmlKOGpRejloNDVzSjVyOTF2NmNIbnhO?=
 =?utf-8?B?ZTdTTmlDSTd2M0cwZUlmWTYyY3pJUVB1RitSOEd3SzhxUG9IcnQ1ejQ1ZlpX?=
 =?utf-8?B?Zm4xRkM2UCt3dE4xNEFYNkNmRlhCWitxNTRuUStDRllXUVFudDBCUngvVVh5?=
 =?utf-8?B?Q1BOVnIzNVhNN0JIWjc3bTUrVU16SWg1TEhLaUdMSkFDRktwQU52cTNJRlB6?=
 =?utf-8?B?RzBUd1pIRFkvaHN4NGg5UFRlMVlaaVAxL1FndUpobFZLRTNZdldWakxJOG4r?=
 =?utf-8?B?dnhuc1c5d1NuR1hzeFlBNm5RZW5salZCSkM0anB3bUZaUGIyWTgvclFiR1Zs?=
 =?utf-8?B?bGJEMDlPdjgwNWpXcDhMZ2wxWXAxNXhFWGpnM2dUbTFZcFpkSE1ETXFrdVNR?=
 =?utf-8?B?TFVIUWJVamhwU2phVUNtNXV6a00rTitNME9EenlBeGdhR1g4YkFacTVzUGo4?=
 =?utf-8?B?N0tDMEloeEFYZ1lKZjlURzR4aVY0VTgvQTM4eDZQbWN3ZjJ5RzdYc2d6QVJh?=
 =?utf-8?B?dFdhZ2N5Z1JmQUJiRDhiRDlpT1VsMnVNaUNNRk4rWFNQQ056UHhoMUlka1pP?=
 =?utf-8?B?T0h3aDRkVXJKRlUySkRObGo2V01TWEJoMmMvZ1MwdWlqNkNMSFlZYjhsY0VN?=
 =?utf-8?B?WU0rSkZzYkloMUM5RCsydGJCamx5Y3ZqWFZ2aVZBL0xzbUUva25wMFF5bTht?=
 =?utf-8?B?bjBIK2ZwVzRSY3oyYXhiRU81bEt0cmNLQkE5QzZ5aHlIZ0hrM1BxNi9Mbzcr?=
 =?utf-8?B?RXQ2aDgwWUpCanpnaU9TRnFzdnh2QUQwbmtpQWY5cnVCejVHUk5iWWFHNWRh?=
 =?utf-8?B?Q3RrbTFBK0R4TGhidDdNc3ZqMlk3cUM0ZjZLYmk0SUJnZHJNRU9wU1JNZWVT?=
 =?utf-8?B?bnp4amxGYXZZRU5rTWhOajNwRk4yQ3JGSUNtcmhGN2hwTUdqRlF0WVNXem5Z?=
 =?utf-8?B?dW54anBCS0V2L3BDNFp0MkpxTFFFWm1MV2JKUmxqS2NUMFl0QmZxbVU1aDJN?=
 =?utf-8?B?NGJiN2Z0UVZJbzNSYXRPaGYxYjJFTTJZblBMY01waWR0YlpxSDdnZGd3blJu?=
 =?utf-8?B?N0lSNXFJYmZzYll0a3gvNDU3SnZ2OTV6ZExtSGNBYlBOZjlXVHk5YS9mU2V5?=
 =?utf-8?B?RzVaZi9yWHFXTUxDWFMvcktBV3N6Sms0SHlXMkRhTTdvbDZNQWZSY3lNVG9P?=
 =?utf-8?B?dVNhRTh1VlZjOGtsdzRqWkFQeVo0SjhZV0VYU0FGV2hWYzlwUkQ3MXltQjU0?=
 =?utf-8?B?dm8weWt3elVBS1lkNWd4a1FINUpER1dwY1B2cTZCT1FNait1Q2pjNk93bHFL?=
 =?utf-8?B?clNrOEE0bGNqZnpGUFRRZUI3WmJUMFJ2Ui81NldLN09EV3ZZYncrY3hReTlO?=
 =?utf-8?B?TytRMmtJVTdjNXZyMmZzRXkwL0FxSzhtMzFyYkwwbUsvWk4xM2xldWp3b0ZB?=
 =?utf-8?B?U3NJSXlpK3dWeHU4RlpFY29nQUZkOWFib2FidmgzV1hpeXFaMTB1UnljWHRM?=
 =?utf-8?B?NXZXNXlBZ04vUkcvVUpINDE0TzdPd1ZVNWROaGFFRzUxSmFZb3ZxUmFva3BE?=
 =?utf-8?B?OE5DQllFTGp3VWwzTDdoVEZEcC9VRHFiT3JpYldrVzRqK0M4U3owUzVHdUY1?=
 =?utf-8?B?WlluSTh4ZTgvbWgvc0xKbEM5bGVuK01IVDIwaWNndUJIaE5sY1Y4MUVqcDdx?=
 =?utf-8?B?TG5SdFBuWU5pTUp0TVFnckFjSXNSUFdvRDNTNGRKUndXQS8yRWx0dE1MVWV2?=
 =?utf-8?B?czNWNXdZWVJ5U2FDYmRkbU9WZFl4VjZXdis4NWtWNmtONmpDOVdNWGVnSGZG?=
 =?utf-8?B?Z08xanVmRUtMT2ZXNURaR0pIRS9pY1g5eGJ1ZExGN2pmUTZ1a2RqUWVRLzA2?=
 =?utf-8?B?blg2d2NnWnFPcmhOUTMyVTBlUDNFTzJOQ1I4VVhzRzcvNTFLOFNzUmcyaS9D?=
 =?utf-8?B?Rm1PY1ZXM0pBSjQ0M0JuZyt1ZXZPdDc5SUEwREVPQWcrVEFKZThrSmp2SEF1?=
 =?utf-8?Q?mvhwXZF7A+0B/kiTdd8rH5o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eecd0f7b-bc7c-45b6-5edd-08dc10832125
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 19:50:56.4367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3fB/FjkTQBUippcul9P6DnQKe1iPbivcJVXJdb08Ngkov89YWYinqvsSgdDLU5yHe29iLSHHv5qOmLzMP2OWH6NWfdxNEBTBF6GuiNcqGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 02, 2024 at 12:16:12PM +0100, Thomas Hellström wrote:
>On Thu, 2023-12-07 at 22:43 -0800, Ashutosh Dixit wrote:
>> Allow the OA buffer to be mmap'd to userspace. This is needed for the
>> MMIO
>> trigger use case. Even otherwise, with whitelisted OA head/tail ptr
>> registers, userspace can receive/interpret OA data from the mmap'd
>> buffer
>> without issuing read()'s on the OA stream fd.
>>
>> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_oa.c | 53
>> ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 42f32d4359f2c..97779cbb83ee8 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -898,6 +898,8 @@ static int xe_oa_alloc_oa_buffer(struct
>> xe_oa_stream *stream)
>>  		return PTR_ERR(bo);
>>  
>>  	stream->oa_buffer.bo = bo;
>> +	/* mmap implementation requires OA buffer to be in system
>> memory */
>> +	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>>  	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>>  	return 0;
>>  }
>> @@ -1174,6 +1176,9 @@ static int xe_oa_release(struct inode *inode,
>> struct file *file)
>>  	struct xe_oa_stream *stream = file->private_data;
>>  	struct xe_gt *gt = stream->gt;
>>  
>> +	/* Zap mmap's */
>> +	unmap_mapping_range(file->f_mapping, 0, -1, 1);
>> +
>
>Can release() get called at all if there is a live mapping()? Meaning
>the unmap_mapping_range() shouldn't be needed?

If user closes the fd, but has not called unmap, then release will not 
get called. If unmap_mapping_range() doesn't do anything extra compared 
to unmap(), then I agree that we coud drop this.

Umesh
>
>/Thomas
>
>
>>  	mutex_lock(&gt->oa.gt_lock);
>>  	xe_oa_destroy_locked(stream);
>>  	mutex_unlock(&gt->oa.gt_lock);
>> @@ -1184,6 +1189,53 @@ static int xe_oa_release(struct inode *inode,
>> struct file *file)
>>  	return 0;
>>  }
>>  
>> +static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>> +{
>> +	struct xe_oa_stream *stream = file->private_data;
>> +	struct xe_bo *bo = stream->oa_buffer.bo;
>> +	unsigned long start = vma->vm_start;
>> +	int i, ret;
>> +
>> +	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> +		drm_dbg(&stream->oa->xe->drm, "Insufficient
>> privilege to map OA buffer\n");
>> +		return -EACCES;
>> +	}
>> +
>> +	/* Can mmap the entire OA buffer or nothing (no partial OA
>> buffer mmaps) */
>> +	if (vma->vm_end - vma->vm_start != XE_OA_BUFFER_SIZE) {
>> +		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must
>> be OA buffer size\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Only support VM_READ, enforce MAP_PRIVATE by checking for
>> VM_MAYSHARE */
>> +	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED |
>> VM_MAYSHARE)) {
>> +		drm_dbg(&stream->oa->xe->drm, "mmap must be read
>> only\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
>> +
>> +	/*
>> +	 * If the privileged parent forks and child drops root
>> privilege, we do not want
>> +	 * the child to retain access to the mapped OA buffer.
>> Explicitly set VM_DONTCOPY
>> +	 * to avoid such cases.
>> +	 */
>> +	vm_flags_set(vma, vma->vm_flags | VM_PFNMAP | VM_DONTEXPAND
>> | VM_DONTDUMP | VM_DONTCOPY);
>> +
>> +	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
>> +		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
>> +	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
>> +		ret = remap_pfn_range(vma, start, page_to_pfn(bo-
>> >ttm.ttm->pages[i]),
>> +				      PAGE_SIZE, vma->vm_page_prot);
>> +		if (ret)
>> +			break;
>> +
>> +		start += PAGE_SIZE;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  static const struct file_operations xe_oa_fops = {
>>  	.owner		= THIS_MODULE,
>>  	.llseek		= no_llseek,
>> @@ -1191,6 +1243,7 @@ static const struct file_operations xe_oa_fops
>> = {
>>  	.poll		= xe_oa_poll,
>>  	.read		= xe_oa_read,
>>  	.unlocked_ioctl	= xe_oa_ioctl,
>> +	.mmap		= xe_oa_mmap,
>>  };
>>  
>>  static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
>
