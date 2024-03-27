Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8A2C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 23:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9354112164;
	Wed, 27 Mar 2024 23:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e969DRb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADE7112164
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 23:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711581635; x=1743117635;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IVm6M7e0uO6VIskbVhPnrutaN90ogLsZqsyCm2OXmBo=;
 b=e969DRb9M/TP7Eie/xqMzG+65uOJZVH8mUTKMo75jDYhwDHQYwFXmU+E
 zrvDQJ2Oftsnv1jCnFVtBVjLujGVKTHQDiSptFDm7zN3WhDQ/Jo1B9Eot
 WbTYHXJLxUwEe5G+3j4VVNCQwxyjbUjv4l1mCxVr6KVjgrPYs+/dw0E+U
 uSfdX3Vt6MV4D6N+xlF9WGuyIgBB6DVum2xlljUTDQv4rWOrIkZaXAmhp
 vLxibGMaecMY9ya6qSOOKvSG/AirqqVzcgNChN0TqqMAQGmjXBCQaBxa+
 jnU+VzmWVXuFVB4h72tZEVJdqqoeghTSZSwA8PpXWDplIExnJ0jUZWNxR A==;
X-CSE-ConnectionGUID: hzMVlEd+QVO50/WhHJaffA==
X-CSE-MsgGUID: Ft7/4pjxRDu92C1iyfIgfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17442994"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="17442994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 16:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16290149"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 16:20:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 16:20:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 16:20:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 16:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaGDgfxRJSnAsn1D86v4+7Ebb56qBB15VE5lQnIXErZY4VXwX7KejhL+v2+jBlLLvGQqYw08nQNYVFSTTmC+0TFGFBmzCSYOCfLdHEk+sNJr4BKrthywZfuPbPLv6URz0PyUXRlXzghhCVy1htRLnwtXKWfy2K6tzh9eP17pQ3VDV4zohVs76xvCc5/babu5pO0StBxPDvPQ5leqX7eDV+wlXLAMtREIwrhgIeeAo8gWizlr7EuEAuAMumFRZBzBQ9UexgPO21XzIg/bxzYijX93RQam3ReynJsDNRikLYGrsHS9Dwt9BWPIxJvEWM3p5LoqTgjiZcPwQam3ylL8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsYAbQpZOaVVCXGHu22OX5uRCJE8J6k/AwZI3w4lq60=;
 b=LlAWeHLliQ4A5nWs9TPZVYyyCoc4i9T2esKW69YFDvNDAuIeeqIFq+/lUbyCS8wZyBYsZT/DCjluUpo2Zm1JN5S9PY4vzHYiuuHE3cpGc743o5UgXO2DQ9ncTARv1vLgd3uoC3RNxuSRtMD31sS50azWTAQP8OikOmRwfXApJFLRtb2T98jfc7AVGrxtjiRu6Ba7R96POdTu/w+ML3HrQIGxkX7B/ShYVG+CSLc8VAXLN3naakNupaiAHhr6P/cekouTs931irgLFgzUnoeqXohJX6xrogajJjgqHUEs0n22/jPf7q5t/jvKd5i1V0d6B9pKx1BZdYZhvi2PFIpFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5960.namprd11.prod.outlook.com (2603:10b6:510:1e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 23:20:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 23:20:30 +0000
Date: Wed, 27 Mar 2024 18:20:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <ogabbay@kernel.org>,
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Store pointer to struct xe_gt in gt/ debugfs
 directory
Message-ID: <bf4tfv7kpysuwcftwfk3onyckah6leq55wq7tiauuuvmu6hcfo@hkamegqnrwbw>
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
 <20240214115756.1525-2-michal.wajdeczko@intel.com>
 <ZgGuAzMpdheUTPke@intel.com>
 <5a8f32d8-1321-4f71-ac8e-8e55455e59ad@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8f32d8-1321-4f71-ac8e-8e55455e59ad@intel.com>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b979898-2fc4-4863-0f9f-08dc4eb47e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1Q64Wvc3sfuaotEHg3TWKPoFyrk5SpKakn1fPMyEk+8dXDfb+rRJJi8aaHotdZ65ejXNs3VEswzTpPuQDbvS5qkUG5+5sZSqS16/YksZbuZzf0RygBVsMA5jiXMsJUymVtHP15wDzpJqkTnbkDSvAL//KUwSsuXr7txZvo396bqeimG/br+GQcVX1loP450f51NJLflgPvGSf7joeMNGggtLlJxSc9e74yXGC1w83yCj3Tm1Xi1w0iDsVhUoaCuT7jJwdvxfB1GVbwLkk7QsYj355uRS8IPAdH+X1oWM4JfI3M8P0gj9wIaIYiIUR2DnMb/vNtNK4oJcb2fzNo9aIhlTgC+c5IAdxofkkWZeuXxoTvsK7sWLplvekBdXaS/PJKB/GNwa/VlJh0zDth+GJUAebHoy6LAR2YxpfSBQ4/E/aNODZ4vfZPKEJmZ+ysBVdz8scnX87yMcP2pZZ4fcKOw5nKP7cMT6sWn88tyfajyaxxhpiuV2yAS8j4ewQXAV776Rp/tdjAEfE4EDxLimbdVWbSl3JQSxfkR/fHeXXxr4qINPKHfCSjjQLyV46ixP2+FcwcSizW78hqIN0hpiFmtsqKofspJbTH0oUb64Sp4NtYyK0LFFvM1CQ2Uz3VrFLXjtGeDlLcHcNMsUPEJRWkleyqV9oT+YdYT/57Ki9cYM0qyuEowC0nQrUXK0rbQ/qkJXHDojuDFQTGxNxxy1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rXTSZCgeVuc5478nf00pvdWOqDdLC4pK+r3p83xXoTxI6EZYVGyooYECWQ?=
 =?iso-8859-1?Q?NNrsJXTpuSxnRTkKbzy36bWZEktsszo6ZYl3p4+lyPPSRmdsgqO9gBBwga?=
 =?iso-8859-1?Q?mtNySmSZdCmP/NT1zk9q/y+vvKIW+D1WlnWzPVMkqCfztWfBxe0kjfrk/E?=
 =?iso-8859-1?Q?smou37Swuj/aFHTcAd9zwHTrl6KRhcMbgHT6MqOTPmuFJdv8jir/RBavEy?=
 =?iso-8859-1?Q?kLRecROuGMJ8bAgDeggChvdu4CLFKh9vThdbzuqOcT3cN5dJpZBRfxDt7X?=
 =?iso-8859-1?Q?0vQ0l0dLTfFXwX1dgj2oBqUHM9pXMY0XVO0V5PPggwTZP2J+oNnTgpw2z1?=
 =?iso-8859-1?Q?yJkK1yhM/I0yii0u8XYUlTA0FMdmeARn7Yt/KFl+JlwWJxp+46jD8dV401?=
 =?iso-8859-1?Q?dtXxbjyPj698pp3H3tl79AAZedJdouq57RVrrLlSdcBJxKzFJ8x+EXFc5c?=
 =?iso-8859-1?Q?8q63iEImnkl5iZzo0N6Sdqf5qNH+KkcC5AF6yO9q5prAyxRfcW8SSoMwf4?=
 =?iso-8859-1?Q?n/5OB2vXWk9Eq4jKKwP9LpKkWx9rSK4HAN2vroK0/EjT2phyEhj7FDSUOZ?=
 =?iso-8859-1?Q?o1oRlqeXZyFJvehL7wyhBTd7EfObf0BmVIYsQImmT1UgLMW9oonMaLl1HL?=
 =?iso-8859-1?Q?EJoAbZ5KXV756D7yEU3QuetpZoMr07du+owXre8UP8dWze+jCyqCvT1aJF?=
 =?iso-8859-1?Q?wDWwoAFvfKPXV6z9w16SKcFQXmq07n8WYAmk52x9DYiIrrYqsttqy1bSau?=
 =?iso-8859-1?Q?8AUBjJZb5AHyz20eASo0lBftBEH5DpZPAKJ+yu8f6JQn9z5lBSH7vPPEPa?=
 =?iso-8859-1?Q?BT/kUf8JxgUiEmITBTmpubKlXurZ7e08cpEPFpl5OPq/XDQ3QRsjuBSmYp?=
 =?iso-8859-1?Q?LKDjApDc+sYoNao0LsP5FYEhqRqnVMAICc+wn8V1uqMJh63dFajzOBvFuq?=
 =?iso-8859-1?Q?J+iKL+xvZX45arzhNEYMzKkAZETbEF7ByJkYGX7ERKLSV3ujBsd13FlMdi?=
 =?iso-8859-1?Q?JrfYMcwzEZce2/u84xQjQCzMWgBpxZgen2DLXMDbXnA2YtSYM611i/e+VZ?=
 =?iso-8859-1?Q?aClAmPrVHZYiLFPb4skbsbA/JHCwaOU+SuDYZuXCBaswuwLJrVhd8/opb+?=
 =?iso-8859-1?Q?AF34ydS8ylZfworqCFrZhP4cTBOytRxQjo4UGjeBN6L/pdC4OiYjwxI2W6?=
 =?iso-8859-1?Q?Mr/qWMnK2lRQPAi7izJKym367tmDNwGuUTswhyTw5TCvhDt3OfFJxuUIhH?=
 =?iso-8859-1?Q?pRzK8lw1nSWf6nGrCgA102DUk9rcgV6+306AZK9A4pqnebTNfx8QirmGoN?=
 =?iso-8859-1?Q?0e+FCRnW/LxCqb1PAMkHdRrqX/G4NDL4+DeDxXpAgMJpPs4Re3jZnPkzdF?=
 =?iso-8859-1?Q?PHKVqtYT8706Wpc9O4gME3QY/zChxQX2BwafX19wWH87cD3XOTwCL1tHwM?=
 =?iso-8859-1?Q?UUNaHWfDIsNORTTrSQsczqusjk/ZbxguSak5wCJmb0Xv4fEXakJcvJNDvH?=
 =?iso-8859-1?Q?BVYuZ3/NbF+juzGtTw6sID04gHp0WgIkcal+HAdltRjullPapXIYcoq+f7?=
 =?iso-8859-1?Q?/g4HKaVtSEZE5XYZEIQl42vNQZweMVTqEpzpSChYpp6Y1RBxYIRd5ml4zJ?=
 =?iso-8859-1?Q?JDTk2JSbG6SehQV1OOPFMuFwnRxuponRUtSWGVQtCM2kZXq5+mluvf0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b979898-2fc4-4863-0f9f-08dc4eb47e68
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 23:20:30.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ym7uz2sQ6eV61Jf+yWDTF2CBtGMtLmmBICZxXqcH5gJb2TmgW9u9s1aNV/J/0WDpZCHQLyLFAIol7pn8UTzJiLxZbyNydR3AIoWSiEgt7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5960
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

On Mon, Mar 25, 2024 at 06:34:01PM +0100, Michal Wajdeczko wrote:
>
>
>On 25.03.2024 18:01, Rodrigo Vivi wrote:
>> On Wed, Feb 14, 2024 at 12:57:54PM +0100, Michal Wajdeczko wrote:
>>> Attributes added under 'gt/' directories may wish to use that
>>> in case they can't obtain it from elsewhere.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> index c4b67cf09f8f..207b992f1240 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -225,6 +225,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>>  		return;
>>>  	}
>>>
>>> +	/* other attributes may use parent->d_inode->i_private */
>>
>> what did you mean with this comment?
>> if others are using, what would be the risks?
>> is this a good thing? is this a bad thing?
>
>maybe better wording should be:
>
>/*
> * Store the xe_gt pointer as private data of the gt/ directory node
> * so other GT specific attributes under that directory may refer to
> * it by looking at its parent node private data.
> */
>
>>
>>> +	root->d_inode->i_private = gt;
>>
>> At first I thought this was intrusive, but then the following
>> patches made me realize that we are already being intrusive
>> when disrespecting the data:
>>
>> include/drm/drm_debugfs.h
>> struct drm_debugfs_info
>> /** @data: Driver-private data, should not be device-specific. */
>>
>>
>> So it looks that we do need something else.
>>
>> Looking the i_private that you pointed out seems an alternative
>>
>> include/linux/fs.h
>> struct inode {
>> void                    *i_private; /* fs or device private pointer */
>>
>> it is a 'device' pointer rather then a 'driver', but I'm still confident
>> that it is the right one to use.
>
>GT aka xe_gt is more a device than a driver, no ?
>
>>
>> It looks like the debugfs_create_file functions would override that
>> anyway with the data. Also other places in the fs code where this is
>> used for other checks.
>
>the drm_debugfs will use i_private only on nodes that represent
>individual attributes, it will not touch the parent node i_private
>(which is our gt/ directory - and this where we set pointer to xe_gt)

I completely agree with this. It seems nice to be able to easily
retrieve xe_gt. I´d just double check the lifecycle if we may not end up
freeing something that's being used during unbind.

I can't do a thorough review of this and the other patches right now,
but ack on the approach in this patch.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
