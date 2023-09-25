Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389B3CE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 04:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7B210E1CB;
	Mon, 25 Sep 2023 04:23:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241610E1CB
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 04:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695615785; x=1727151785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hK9iTitR7/tMMms1CQUU8ncg8UqaBTOIsosIaQmfmKs=;
 b=EIVnz5Hz5+o6kSq/W097lc8xpxgnOlTTuWmBbj14JTAp7WjZF2Uf0EiL
 sMPAksHfHXmgZHDjjcW+Yh5ZY/V87FGm4Y8zivUZLVu8EfK7jrbZ1yYco
 bytvlBW+0ELFn6d4BdcKCzQv6NhLT+/J52/VGa7D31l3QnkquKp5MvWbk
 S0JAbfHjY5/HRpukv+viOaBkt20gXZw1x0D428VkbEOmitgPAgAy7QBwY
 CsuyNfkCA9DGPUGvxsky/nWlDlul1Jr9YaRDbYwql3dtD+heDQURbpbfb
 3q+GFxa9DBhTwUpkauz2q72AXikOW3+jmVMxttqnhhrxvuBxkQbPjruBO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="381070747"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="381070747"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 21:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="863720181"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="863720181"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2023 21:23:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 21:23:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 21:23:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 24 Sep 2023 21:23:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 24 Sep 2023 21:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrBzqm91KRF0x1BRcayyjBmB1me861Uw1VUtfZ769u5ft7apUwm53mY7eWtI/HTpmKsvjF4auMtAB00PceXGmuhvXcAaca8/afozxyae0kovDg7a0vS1/XBY0q+m2GXVp1KWG9G+bxupWa0zXgo727Kmc8CRXTct3k2LDR/LcGAIm8sUFowCnP9H2vazeRU+VfUDXVC2tXzi/EMNr4uEtuYMCDY9L6F9l+w4MCX1f2sUIPwlqTsOg0YdcybG/IygXcjeto4qyBLDyGijq6xKZo60/3mGgO2Kr78rXohzZoLU+yUhyc6bOznj/2EayUOSeKQ6X2jfh9dif9A8CZCM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoiRs5Tu8Y2jLAGDY8HnnLBjcHuPvRRBTRGi3lh59kg=;
 b=Hhh3gdRIT24c+bbNtrHUxUFb2Unwq9JC8B7COpIjetGmPd4jmIh3BTwWPo0TIp5nkY07Qfpl8XmwOCwLsN3UzMccwJ2PJLRGYD2dabI2teFyD9y/o6p8zO81rqF5prjGoXbxJma8hvDAbDYietvWqcf6CKSHXJ6+Vjo42WZeMEUaBI30vroIuB5Egki5PW8ABaWVSzLtaBPCyhOMJBSYPHzG2VRVSLqAjvAVbaajVWtrAk0oSH8x2O77j9VTfYhDGMAOeAAvOJ8se5QRni5dgQU2E+Dwaw7MEn/UiMVoz1lMA+7fZ2bkfmTJnFva9LNrch9Y6yC32SrNe+t3Mu6odg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB5960.namprd11.prod.outlook.com (2603:10b6:510:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Mon, 25 Sep
 2023 04:23:00 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 04:23:00 +0000
Message-ID: <39fc7df3-546d-0adf-bb33-5442434a1fd5@intel.com>
Date: Mon, 25 Sep 2023 09:52:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
 <20230919110541.1243785-2-sujaritha.sundaresan@intel.com>
 <ZQtN7L7NzdfM0/cX@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZQtN7L7NzdfM0/cX@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::19) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa89e7a-3f69-42df-5d4f-08dbbd7f19f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koapsCyl1Bn+oczsxXaiWtlkMkBjh46dcBRJ9ZQbli9fmdYHYJ0iXqYEfGxcj8IOxLH+Y9Hbp2O+wmiBJitUMVlXBk8+148C86Nlm+AQ9Z1bikRUp58wDEUbTpc7ZkcKmCXaRy0MaVBqlyoCnC4bzireFSbAE0t/9LZrkyeEdT9KpL4BuW+ZlxB9wXjczI2+0nhJ73X9Q+yS+/CFJ0dRxtCHgaSoP8/520iTXdRxfFPev2jSE/YuudjfLAfrPAbf7Fly1Mk/yfOlCuhOfY8HjfVzlyW4uw1Icr5Fha0hHQWRAR8dAZuXahx7mP6CBYbVot3obV8HQAzOi/6atXg9M3PyTXP8G2MuS/acwdSsRKSJwm4cRxYgFiNxZ4rXjgckXxEWnP2PNEiWXseeQ/F0/CMPTk0KUWIcErH7Dyq97i/gP6OUNh32s/1CkVa6R3Ln6ay9jmyHmIdYYHdgyGYtUG8t0A6cuACAQCLq6yEIcx1qBKKEtU/PvRGIIqpoubYkPwF5D9DfIE3BeKw4BgbObTf6LAd8/1dHgS39dLCSWkcpnDGA8848KDiUHh6tQtmIte5BKJ5HXC0DZKmB561nzXGkGmO7EyraZ/MMztdJHxVVCcus78UcUs27bbZphFwCS8c71J33RPUwji87QCtnXYw/ikvfS71r6taATHQpzV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(186009)(1800799009)(451199024)(6512007)(6636002)(316002)(38100700002)(26005)(66946007)(66476007)(66556008)(37006003)(2616005)(478600001)(53546011)(6486002)(36756003)(41300700001)(6506007)(6666004)(82960400001)(30864003)(2906002)(83380400001)(31686004)(31696002)(86362001)(5660300002)(8936002)(8676002)(6862004)(4326008)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHl2TzRQRGxZbkp3RVo3NGJ0QTRWL2swNzFIRWlVOU1RTWltYXg3S0J6MUVE?=
 =?utf-8?B?YTBON2tVQmtTaEZVRFhTSHcwSklrQUsraGdqODRSODE4VW02ak9FbmJVWXFu?=
 =?utf-8?B?aTRreG1kMzBXQmJCbEpSS0xCbWdOeEZ4RVlmd0JnS1FuVm9HTzJtODZMYkVD?=
 =?utf-8?B?NlJualJXaFg5UlpqN1A0aHlxSXJsc3ZYN2o2UU1qNDJUTEd0eXVLQjdZLzhF?=
 =?utf-8?B?dGFBU29HbVZxQnV2dWNaZTR5dXhWSWU5Q2ZCRUg3Uy9JcU5VakQ1Y3UrM0cx?=
 =?utf-8?B?YlJzTlV0bHhwdk5zNDJWZTBuN0FPOG5ld0VSdTk2SGdxc2lHL3JzWGJvZnNP?=
 =?utf-8?B?bE9XZCtGNi9iVjlLWFBJWkcvZ2VydVF4SXc4RFJuR0JFVDJaU1JPMjJDeGI0?=
 =?utf-8?B?UHZZSWtEVDlLdGdSRFlORVVpWnZ6YllzSm5xZXM4OEo1ZEk3NnozTjBheWFI?=
 =?utf-8?B?c0J6b3Q2L3hvOThGSnRWSFZsWkFjKzhwVnJvK0lIeGhnL0sySlYxanRwNFM4?=
 =?utf-8?B?MzlMckRwcFUxT2c0Y1AxaFhGdGhoZkJMUkJXeTQ0T28xamIrWFFmZmphOEJ0?=
 =?utf-8?B?d2tTTkR3eDZmcHZBR25xZGE0VjNxSXpMdmNrYUJRckJsRFJpdnVJbWdoUVJo?=
 =?utf-8?B?V3NKUzZTc1FvUDVuSjNFbDhUYTk4dG9td3lzdkh6R3Zjcnl3TWVwRDJacUJh?=
 =?utf-8?B?VkFkdURpcS8wR1FaUDdzMlVvM3R6blorcTlRSHNQVDJhWWRidHYwQTNFM1Fi?=
 =?utf-8?B?WUNnMDRNUXIyNkZ4d0dvWndpUGFHZ21CWDFOV2pMQ1BIYjMyQVlyK2Q1cmhF?=
 =?utf-8?B?VS83WXRLZmZULzk2bThyNHQ3UlVGQ202S0xpeUt1SGN6T2pRTmlrNWxaMklm?=
 =?utf-8?B?UktRK2ViM25OT0dUMC85K3BPNFBIQjNERVhmdjJQQTRwcWpLeVJqTjVDeHJ6?=
 =?utf-8?B?WU5Gb2sxWFVMY3hUTkxKWWdMS1hxYThsSlZLdDFrQWFPYjljeDlPanVEQ0lV?=
 =?utf-8?B?RmlscVZYOTRncXdhaVpKcU5jbE9BY0I2T2Vlb1hKRVhHLzhraWo4aktyZlRK?=
 =?utf-8?B?OWxzOXVmc0tSUDdMMGFyYlF4SENEUFNiT3d2TitaRWJUVzExUWQ4WGxJT3lM?=
 =?utf-8?B?cjI3cGtHeERMa053blRvNXJJYmtQWGxjRnl3S1QzZklPR0UyWTl1RGVTTFVx?=
 =?utf-8?B?cWdLQ3lxdkVvQm9xU2dhaDg1a1RvNU1TK3ZFVnEwampDaGdFVGtNZkFPSXB3?=
 =?utf-8?B?THdheG43RDd3OW9PSkdCOWFqZU1HMzY3YjJXRk5razEyMlp6d3JLaEpsRlV2?=
 =?utf-8?B?enlGNWM0Ui9NWnV1bVpPbk1rRm5SMFdIMjNwbGpZQmJFUkRUWjVuVmFqb1Zh?=
 =?utf-8?B?VVRuMUFSSDJVanlyM09DUUZqSEZEOEhJek9yNCtvWWxkbzJwbGRJOE5kdzBT?=
 =?utf-8?B?eXJSSjBrYTd1cEp4ckZRNytlblBvSm84Zmhyc09pQk1FWUJ6eHFMYjErNGZW?=
 =?utf-8?B?czMzUUFBeTlENm9qZHhKenVWOXNXNnd6TjBIWEovTzJiNlhqR3BHc0JRc0NM?=
 =?utf-8?B?YmtESDRaRDhXTzJBMTlaRWdvbTd3d1hFdDRDWG9tWkUwWnBtdzc0RlNOSlZ2?=
 =?utf-8?B?NWZhbWxpR3BCUzNzbkxZS3RhWmJLbWNEOGNEWDJ0WjY5VWhSRS9yR3RuMjM2?=
 =?utf-8?B?TWRJeVVFRU1aU0NyWlFqYk05Rm44STdvcGJ5NVQxeFk3QUgrVzRZRFRKa1Zl?=
 =?utf-8?B?Skw4RlpDKyt4eXNkL0E1TXIwVEM5eWxaL3owcnl6QjZvVzBBVDdrakY1TnZX?=
 =?utf-8?B?ZWpEekw2TEhlUVc3NnRhQVRNR3o0Sy80SlY0K3VPU0lVbjNaL2JxaUs5ZGlO?=
 =?utf-8?B?bThzd3J6MWxnSHp6SG9USzRZTlY3NmNKd1IyZ0crVjNZV0VCSDRtRFhlR1hC?=
 =?utf-8?B?NDYvZzNzNHRsYnNBc2FOblJwbEMxNENTcCs5QjdHTmdEVXR3anJUQTNlVENP?=
 =?utf-8?B?M2srZGhxTGN4SGY0bUx6aktBcUovRDl5SmY2SnJmc1pSVEdHUXlzb2lISGRy?=
 =?utf-8?B?QjlDTGJaOGhiNTZNU2FDbExsa2I2bC9hY3VLVXBVODN1WWJUN1pybU05N0RB?=
 =?utf-8?B?TFFXaCtMa0JzOGV3R0RZQjRXTzhTQVRUclVXTFZCU0dXK3k4aTJENjhuNExM?=
 =?utf-8?Q?hog7++ymixepaCxR/J4I+jk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa89e7a-3f69-42df-5d4f-08dbbd7f19f3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 04:23:00.0251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wgo07tiaItkFrW32FNTGBuZk8itM2omhcHeIo7ohSx5z1sUH6tk9kaU13xEBf9e9YV0vnH1D9HUAbdLgL3qQ7dN1VXT5uNsUw4f2s/ByMlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5960
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add throttle reason sysfs
 attributes
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


On 9/21/2023 1:24 AM, Rodrigo Vivi wrote:
> On Tue, Sep 19, 2023 at 04:35:41PM +0530, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/
>> Currently there is one overall status and eight reasons
>> attributes.
> I wonder if the xe_freq should come before this component here.
> and maybe 'freq' deserves its own directory under 'gt<n>'?!

I would suggest keeping the throttle directory as is for now. Frequency 
can maybe

be a directory but that can maybe be discussed in the context of the 
xe_freq patches

that are upcoming.

I am creating a frequency directory there but I would prefer to keep 
throttle outside of that.

>
>> The new sysfs structure will have the below layout
>>
>> device/tile<n>/gt<n>
>>                 ├── gt0
>>                 │   └── throttle
> I was going to suggest that 'throttle_reasons' as the name of the directory
> would be better, but then I read the doc below and saw the status field.
> So I agree with you that simply throttle is a good call.
>
>>                 │       ├── <throttle_reasons>
>>                 │
>>                 │
>>                 ├── gtN
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>
>> v2: Fix review comments (Riana)
>>      Move init call (Matt)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>>   drivers/gpu/drm/xe/xe_gt_sysfs.c              |   3 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 281 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>>   .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  15 +
>>   drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>>   7 files changed, 334 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cc95a46b5e4d..7e1c4be0ab7f 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -63,6 +63,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> +	xe_gt_throttle_sysfs.o \
> maybe we should call this component simply xe_gt_throttle (without the sysfs)?
Sure. I can change that,
>
>>   	xe_gt_tlb_invalidation.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index e13fbbdf6929..f9ba57c3bc4b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -410,4 +410,17 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>>   
>> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> +#define   PROCHOT_MASK				REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
>> +#define   RATL_MASK				REG_BIT(5)
>> +#define   VR_THERMALERT_MASK			REG_BIT(6)
>> +#define   VR_TDC_MASK				REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
>> +#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..d4839ade7240 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "xe_gt.h"
>> +#include "xe_gt_throttle_sysfs.h"
>>   
>>   static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>   {
>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>   
>>   	gt->sysfs = &kg->base;
>>   
>> +	xe_gt_throttle_sysfs_init(&gt->throttle);
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>   	if (err) {
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..0dc9c7cada5a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,281 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/throttle/status - Overall status
>> + * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due to PL1
>> + * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due to PL2
>> + * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
>> + * device/gt#/throttle/throttle_reason_thermal - Frequency throttle due to thermal
>> + * device/gt#/throttle/throttle_reason_prochot - Frequency throttle due to prochot
>> + * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due to RATL
>> + * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency throttle due to VR THERMALERT
>> + * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle due to VR TDC
>> + */
>> +
>> +static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +
>> +	return &kobj_to_gt(kobj->parent)->throttle;
>> +}
>> +
>> +static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
>> +{
>> +	return container_of(throttle, struct xe_gt, throttle);
>> +}
>> +
>> +u32 read_perf_limit_reasons(struct xe_gt *gt)
> when a function is not exported in a header file it should be static.
>
>> +{
>> +	u32 reg;
>> +	if (xe_gt_is_media_type(gt))
>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +	else
>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +	return reg;
>> +}
>> +
>> +u32 xe_read_status(struct xe_gt_throttle *throttle)
> if you are not exporting the function you should use static,
> if you are exporting the function it should have documentation,
> in any of the cases, the namespace of this function is confusing.
>
> xe_read seem something bigger on the xe driver as a whole...
>
> in general do not use 'xe_<component>_' for static functions...
> although we have many cases out there already.
> But when you export then you need to make that very specific in
> sync with the component name... in this case something like
> xe_throttle_
>
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +	return status;
>> +}
>> +
>> +u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +	return pl1;
>> +}
>> +
>> +u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +	return pl2;
>> +}
>> +
>> +u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +	return pl4;
>> +}
>> +
>> +u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +	return thermal;
>> +}
>> +
>> +u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +	return prochot;
>> +}
>> +
>> +u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +	return ratl;
>> +}
>> +
>> +u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +	return thermalert;
>> +}
>> +
>> +u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +	return tdc;
>> +}
> it looks you have many functions to make static and remove the 'xe_'

Sure will fix the function naming.

Thanks,

Suja

>
>> +
>> +static ssize_t status_show(struct device *dev,
>> +			   struct device_attribute *attr,
>> +			   char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool status = !!xe_read_status(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool thermal = !!xe_read_reason_thermal(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool prochot = !!xe_read_reason_prochot(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool ratl = !!xe_read_reason_ratl(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +					 struct device_attribute *attr,
>> +					 char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static const struct attribute *throttle_attrs[] = {
>> +	&dev_attr_status.attr,
>> +	&dev_attr_reason_pl1.attr,
>> +	&dev_attr_reason_pl2.attr,
>> +	&dev_attr_reason_pl4.attr,
>> +	&dev_attr_reason_thermal.attr,
>> +	&dev_attr_reason_prochot.attr,
>> +	&dev_attr_reason_ratl.attr,
>> +	&dev_attr_reason_vr_thermalert.attr,
>> +	&dev_attr_reason_vr_tdc.attr,
>> +	NULL
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, throttle_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	kobj = kobject_create_and_add("throttle", gt->sysfs);
>> +	if (!kobj) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>> +	err = sysfs_create_files(kobj, throttle_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>> +		return;
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
>> +	if (err)
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +}
>> +
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..809213c3bba1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>> +#define _XE_GT_THROTTLE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_throttle_sysfs_types.h"
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>> new file mode 100644
>> index 000000000000..5ee0d45d0a9f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_gt_throttle {
>> +};
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index d4310be3e1e7..7829bbeeb5d8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "xe_force_wake_types.h"
>>   #include "xe_gt_idle_sysfs_types.h"
>> +#include "xe_gt_throttle_sysfs_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -299,6 +300,9 @@ struct xe_gt {
>>   	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>>   	struct kobject *sysfs;
>>   
>> +	/** @throttle: frequency throttling reasons in GT */
>> +	struct xe_gt_throttle throttle;
>> +
>>   	/** @mocs: info */
>>   	struct {
>>   		/** @uc_index: UC index */
>> -- 
>> 2.25.1
>>
