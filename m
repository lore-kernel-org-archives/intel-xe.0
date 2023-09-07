Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCCAEE14D0
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 09:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670B510E7B2;
	Thu,  7 Sep 2023 09:29:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670F910E7AF
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694078954; x=1725614954;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=+vlBKi/r1HYnnntlAsSiRU1pI0IT6gR/Y7X6uyjzz2U=;
 b=CZJwqZyauRC2e8IFLLQ23ZIzW+HED0J+zV7KtRQQRWrcLcpU1CngGFpB
 kZVRQwHjt2QAc3dgLIBgLuNk1DuMnyZneNzaoLNydtlr+3L5YC0Hnxl0l
 vu3pIPLcGqwgF3yM6+eJZG20KTEopSdca4kQmSEMtPswgX6oOKkYWgeWT
 ajSQv0HdiqKhWXnZKt0YDf2B3w3C0VBGXwr3zBSc1uL7/YMWGd1ALjzkz
 6L4F7C+nbmhkrOpNrG4AMiYNh+yW1OFJGaBOpYqOBKRtjVVprDJsC6CHk
 AnckxqmIYhE4wsuL5icDHR13ZMjYW9iLPW6BNn9sy2zY/JV39X3QnfDxK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356787524"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
 d="scan'208,217";a="356787524"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072817871"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
 d="scan'208,217";a="1072817871"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 02:29:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 02:29:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 02:29:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 02:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTkpN1DuvzPhyarcWzmNNvb4dNExysDCopYdTPevvsbHuCP3pvLr3EaShAGBfa0krbUX879fCPsIH969se7t8J07187OQYRfs1en1A441XvpkQLjxFGBzdibzCSsk/PpTjAtPA1wRkkaDglL+Bdrtam0QpZ3g3pKLgA0Q2ttN2n4JcnYvye++ykeBcNWvfzahqYT4pdp86BYEUgYC8EcCF2bbaqugSttuUBvnTReCCMk/TJd2ld7nhRBQbkmoJoU8cRSvL6sGT7FrhszxF6Fif/r7+t1cdgzYTRC7sY4BJoMdAgopurJvEpbd1SL+Srmm+tXZ0HGGdMjOEdBgJ3kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cg4TDDgGNaRP51GifQ+xlirYysrcPoGR5EYu17wJ7Jc=;
 b=Vpug00XWFcw4VrbJYRqUmQGVHgNr8/ZyyWnM6htojUZ9wm/g/AFZyF4a2d5G6h50Qq5l5qKHQLy5KVVmo/o8tIqIifxHLj/QiKhHgLDWM6hcbvuvVZpxkInew2AVRLBrNqkS/z1c1pwxJR8+vDfxrLn7Llvz4Drkz4nQ6D89v0kb4NmRMoe3I8VvWEHWfUmDoSGc1s/CddBm2DTtHLEYc3f10InrbhVlWZjnaztJ7P26hgQbu8Gqmu2C4nbf8LNVFtffucG9hHcTtxnUGgDv6eC4Uv4zvPNbuy6j78ruy7dXDgKTJW5aGtqbMZgK5nTw73hgIcxeHvRZe38kSmGQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 09:29:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 09:29:10 +0000
Content-Type: multipart/alternative;
 boundary="------------uHprAyHicxmRWgF1yeo4mmjn"
Message-ID: <cf6b7769-d433-4c56-8b2c-ec8aed1fe8c2@intel.com>
Date: Thu, 7 Sep 2023 14:58:59 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-5-tejas.upadhyay@intel.com>
 <f02954b6-ad66-4040-bc24-ac1035d345c7@intel.com>
 <SJ1PR11MB62044B92B265221880903F5081EEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <SJ1PR11MB62044B92B265221880903F5081EEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: PN3PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 1afaa78b-c9c3-48b6-8050-08dbaf84e3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dB9gAs8w0xuGYQmYziDDMKp5GPsvKeoYCpq4oF65MgWNPCePJspVIMyuttiVFK0DagyJF3NFMDPqE5pW7vHsGiHthEpDaV+9uJYd918MHAaR+S1m9m9R2WxKJEiUr3+H3+tSUXB8xwxNXpkjmsnvP/Su+T6VRHymDkWmyrEl8UDBk7FoF8incW9d7qNHjULpB0YCeA5WFxrq2PasHQGcFsKis+cxv7DgFdZtZjrJa/wCz9Lji1lzncpw1BaIE9htEXG1JYSEkwUBHYyI3nqh6NEqWaCL3nUhYny0vWoUBI34Zc9dVLhjZWbl60dlVIz2bt7ppKx/4P8CKHSwy513pNX3Bev+P5rNX4pHgXgOmDW+lcscdlQ1ZPQIS7jZmbeJxtkrh0f/iGp+shkBpC4EesZnqMIcUnRfE1lPjTbzXD0sTd/IfyjJI+cVF7wqZDSm6hTxxTNERfw0JiJFxIXkr7mKRUxBqpAJ3030eRxF8WDd9ySEmc6cGlNZe2oYV4aUim/lXERqYiaJtBBpvTaWtjjPvig/+dZU8lqVtPoPVks8rA6I2oGQ5tCwhtnDU9+No/q6+QoogIKBVqonRkaLWnpMAS/mw0Cci99mLKCxBPvrjG643vM7wUQDOEKBn1xg5Frj42ws4pzUh+Ehuc1nQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(1800799009)(451199024)(186009)(107886003)(2616005)(26005)(6486002)(33964004)(6506007)(53546011)(6512007)(82960400001)(86362001)(36756003)(31696002)(38100700002)(316002)(83380400001)(66946007)(66556008)(66476007)(110136005)(478600001)(31686004)(4326008)(5660300002)(41300700001)(8936002)(2906002)(6666004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpSN1U2VnFTL2QvRFhYTzY0bERIRXpVejVGemtNU3BGRHorTUhyeDF0dG42?=
 =?utf-8?B?WnhhWmw0WVVGcERiRkZ1N0VZU2JqeUh1TFBkS1IzMU8xRmlzZ2hrdTV3Rjhh?=
 =?utf-8?B?K1NJcko0TzFBZ0pjanE4YnlhTHlwanpjK0NOUFcvUmlkMHR5SGxuaHF6RHg1?=
 =?utf-8?B?Y1lxTjU4ZDlwSW81YkZHQnRhSG5TK1d4enVMRUMwMllyTUM3Yk1wcW5XZlM0?=
 =?utf-8?B?OFZoZkplZlJiY2MxclU1QVNjdjJsZHdSYmZndFUxQjNKOEVlemExZlo5QUVy?=
 =?utf-8?B?cncza2M2L3I2NzF0aXdWTmZ3MDR1WXIzTmhOc29sdC9Vc09GaGdxblBucFNG?=
 =?utf-8?B?eWdBNG9CbWh5OEp0K29yRTZKUHMyVVlGRjVIclc1NFZ6bFNKZFZNNkFjY3Jn?=
 =?utf-8?B?TUo2MXZQUzhzcnQydHZSVEZKY1JoMmJhYlc2NUpuejhaUzdjSDBZLzFIbnZX?=
 =?utf-8?B?UXVPZHNSSGxndGR4SkgveWk0UWtieEhBVm5QZjQvSTBTN1ZBcnN3dWdHb3hZ?=
 =?utf-8?B?MnJKTEtpNkVMalpSL216V3dOVjkySlVmVE14QUpvSXV1dXovaFZycHdEaVFT?=
 =?utf-8?B?R0tZZFU4K2Vvd0ttZk5YN3FqWllPQ05rOSsyNnBPaXZUSDY0dEVqL3dCUVV3?=
 =?utf-8?B?dXNIams3ZjlZQXUyMHBlZCsrWXBBckxGMzZwSXFZK1BpaTJncUI3SlBwR3pF?=
 =?utf-8?B?VFVjSVVmWWdvM1BnNWVJb0VsZ3R2T2p0b1Qwb3RCQTM5ZHRKd0RJVS9JTk5W?=
 =?utf-8?B?c0RNbWpGM3hhTVEzOElHeFBrYXlGY2RGSFdPelprZFdqWkFaMW41Q0ErbU5J?=
 =?utf-8?B?Um8vZEJseWtwNjQ5ZFUySVVJeGFEajIySTgrSlZKclhqWnl6blQwVXVhL0V2?=
 =?utf-8?B?YXdZeU1zeWZjTlFRWnRoWjlMVktvWjdyOUtPemkxLzFPcHA3YlpyVnM0REtM?=
 =?utf-8?B?VSsvTEJ6NnJQY0lnZDZubVNRT0tLZ2JBUGZIejhPUHhuQkFodXdWb0hNSnE2?=
 =?utf-8?B?R3JTSHVLdHBWcTRUMzZGZHVCYkxFMHJteVRJaS9IYXNtWHN0bVNaU0Q5YldM?=
 =?utf-8?B?SU9DRmZkeHllem1RT2lXcHY3UVpsVDRabTBQQXJvOGY5SVA1M2xjYll2Q3ZL?=
 =?utf-8?B?YWgxaGpkWG5BVUFnLzJDYWpyQnNISHAxam8zMGhrWStuNlA2M09NaU9ScHJN?=
 =?utf-8?B?K1c5R1ZyNXhzZnZ5M2llbDRWLy9lS3FLM2VuT1NlM1NUV0NaQ3dWTGg4S3lT?=
 =?utf-8?B?MjB2eVhIZWVQQjlkZS81L1ptT0c2TDJFdjFpblh2enF4aDRqaVVJOHlkY25H?=
 =?utf-8?B?dW5XNW1lS2drZExQMno5THhDV0xNZnhMYWxJRFJTRFl5aVY1WnU4YVd4clF6?=
 =?utf-8?B?eFB1RVZnZXU0OXJseEk1MmtHd291WXZRWlJ3Z2ZzdDZiWWhicWF5ckwvcWxR?=
 =?utf-8?B?QnRadEFUTjc5ZFMxeWdjcEhsK1dvOW5JOWhXTW5BMG9pclFuM1ZwMWJ5Y3FW?=
 =?utf-8?B?RUF1VGZERUtvVVI4REZNaE1NK21saVJtL3NpcTNkZFVLQ0lVTTBWQkprdWJZ?=
 =?utf-8?B?OWkwbVpUQ3dQTVhJclZaYS9WMWMydnIvaDY1LzJPT2RNOU14RUZWU1R1RWVu?=
 =?utf-8?B?d3ozZ1dObWcvd3JEeUVsVk5Jdmd2YTF4Mm82QmNuZ21zVGdLeCtiNXdERXZ3?=
 =?utf-8?B?Q0k1Q2FrN1Z1c1RKZjVjcm55aWlneElqQ0cxdXZFQUVUWHgzRURFZWhyZG1S?=
 =?utf-8?B?bFUyLzN6RXlVbEQvY0JKTmhabnVVczBYNDFTWWJ0bTZ3MWNUaEMwV0VaM2Nu?=
 =?utf-8?B?UndxTTQwdXJRY3VaZTdtWFgrQWM3N1pHdFZpeGtQTzZFZmRmRU5TVHVoZytX?=
 =?utf-8?B?dG5NWURQME1vNHJ2M1ZIRDU5QVhiNHdoTmVEZ3p5U0Z2Yjk2MnlBREFZbVQx?=
 =?utf-8?B?M2lpaEsyRWN6a1dMVkw1dmxkcVp0WG93Tzhidkg5eDBZalVUNWF6VTM3SGpO?=
 =?utf-8?B?M1VwOW43SE81THg5eWJjd2lncER5eHkyM2tXRGFIQkJKRmdaZDVSQVh3TFZi?=
 =?utf-8?B?SlFnblNpbkRMOE9sWXFzajF4aVlZT2NRQm15aXdrdVF0NjBTNkNVM3dFR3pl?=
 =?utf-8?B?RDRKV2gveWJ0N2MrMnNrb2liLy9wWGxSaW5mKy9lRzgra1B5QkhJcVhXZG5I?=
 =?utf-8?Q?9TruBOBvpmQUnvyI9ClAG1U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afaa78b-c9c3-48b6-8050-08dbaf84e3ff
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 09:29:10.1864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkL13+ulaD052LZWA/h3rts1dXeh9doVWzqNQPEFHG6kZTPoKZs41XwhPWJhTDD/nU8l5I0TeZD6qcN4huUvA1L+Lp9gE3AWqvuqcrpuYz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/7] drm/xe: Record each drm client with its
 VM
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

--------------uHprAyHicxmRWgF1yeo4mmjn
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-09-2023 14:19, Upadhyay, Tejas wrote:
>
> *From:*Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> *Sent:* Wednesday, September 6, 2023 3:18 PM
> *To:* Upadhyay, Tejas <tejas.upadhyay@intel.com>; 
> intel-xe@lists.freedesktop.org
> *Cc:* Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> *Subject:* Re: [PATCH 4/7] drm/xe: Record each drm client with its VM
>
> On 31-08-2023 14:35, Tejas Upadhyay wrote:
>
>     Enable accounting of indirect client memory usage.
>
>     Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>  <mailto:tejas.upadhyay@intel.com>
>
>     ---
>
>       drivers/gpu/drm/xe/xe_vm.c       | 1 +
>
>       drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
>
>       2 files changed, 3 insertions(+)
>
>     diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>
>     index 9cbf2f63d641..f5f832c8ed42 100644
>
>     --- a/drivers/gpu/drm/xe/xe_vm.c
>
>     +++ b/drivers/gpu/drm/xe/xe_vm.c
>
>     @@ -2057,6 +2057,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>
>              }
>
>       
>
>              args->vm_id = id;
>
>     +       vm->xef = xef;
>
> shouldn't it be applicable only if |CONFIG_PROC_FS is enabled ? |
>
> Tracking VM is not dependent on proc fs so it does not give relation. 
>  Adding bo and FDINFO read/parse is only dependent on procfs otherwise 
> dummy calls. So I do not think it is necessary. Please let me know if 
> you think otherwise.
>
> Thanks,
>
> Tejas
>
Do we have any other use case in mind for vm tracking ? If yes let it be 
as it is, otherwise making it procfs config dependent is better.

BR

Himal Ghimiray

>       
>
>       #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
>
>              /* Warning: Security issue - never enable by default */
>
>     diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>
>     index fd2178dbde3a..db8523d81d0f 100644
>
>     --- a/drivers/gpu/drm/xe/xe_vm_types.h
>
>     +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>
>     @@ -336,6 +336,8 @@ struct xe_vm {
>
>       
>
>              /** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>
>              bool batch_invalidate_tlb;
>
>     +       /** @xef: XE file handle for tracking this VM's drm client */
>
>     +       struct xe_file *xef;
>
> Same comment as above.
>
>       };
>
>       
>
>       /** struct xe_vma_op_map - VMA map operation */
>
--------------uHprAyHicxmRWgF1yeo4mmjn
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-09-2023 14:19, Upadhyay, Tejas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SJ1PR11MB62044B92B265221880903F5081EEA@SJ1PR11MB6204.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}code
	{mso-style-priority:99;
	font-family:"Courier New";}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span lang="EN-US"> Ghimiray, Himal Prasad
                  <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
                  <br>
                  <b>Sent:</b> Wednesday, September 6, 2023 3:18 PM<br>
                  <b>To:</b> Upadhyay, Tejas
                  <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a><br>
                  <b>Cc:</b> Iddamsetty, Aravind
                  <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH 4/7] drm/xe: Record each
                  drm client with its VM<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p><o:p>&nbsp;</o:p></p>
          <div>
            <p class="MsoNormal">On 31-08-2023 14:35, Tejas Upadhyay
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Enable accounting of indirect client memory usage.<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Signed-off-by: Tejas Upadhyay <a href="mailto:tejas.upadhyay@intel.com" moz-do-not-send="true">&lt;tejas.upadhyay@intel.com&gt;</a><o:p></o:p></pre>
            <pre>---<o:p></o:p></pre>
            <pre> drivers/gpu/drm/xe/xe_vm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 +<o:p></o:p></pre>
            <pre> drivers/gpu/drm/xe/xe_vm_types.h | 2 ++<o:p></o:p></pre>
            <pre> 2 files changed, 3 insertions(+)<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c<o:p></o:p></pre>
            <pre>index 9cbf2f63d641..f5f832c8ed42 100644<o:p></o:p></pre>
            <pre>--- a/drivers/gpu/drm/xe/xe_vm.c<o:p></o:p></pre>
            <pre>+++ b/drivers/gpu/drm/xe/xe_vm.c<o:p></o:p></pre>
            <pre>@@ -2057,6 +2057,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;vm_id = id;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm-&gt;xef = xef;<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal">shouldn't it be applicable only if <code><span style="font-size:10.0pt">CONFIG_PROC_FS is enabled ?
                <o:p></o:p></span></code></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Tracking VM is not dependent on proc fs
            so it does not give relation. &nbsp;Adding bo and FDINFO
            read/parse is only dependent on procfs otherwise dummy
            calls. So I do not think it is necessary. Please let me know
            if you think otherwise.<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Thanks,<o:p></o:p></p>
          <p class="MsoNormal">Tejas </p>
        </div>
      </div>
    </blockquote>
    <p>Do we have any other use case in mind for vm tracking ? If yes
      let it be as it is, otherwise making it procfs config dependent is
      better.<br>
    </p>
    <p>BR</p>
    <p>Himal Ghimiray<br>
    </p>
    <blockquote type="cite" cite="mid:SJ1PR11MB62044B92B265221880903F5081EEA@SJ1PR11MB6204.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <div style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
          <p class="MsoNormal"><o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Warning: Security issue - never enable by default */<o:p></o:p></pre>
            <pre>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h<o:p></o:p></pre>
            <pre>index fd2178dbde3a..db8523d81d0f 100644<o:p></o:p></pre>
            <pre>--- a/drivers/gpu/drm/xe/xe_vm_types.h<o:p></o:p></pre>
            <pre>+++ b/drivers/gpu/drm/xe/xe_vm_types.h<o:p></o:p></pre>
            <pre>@@ -336,6 +336,8 @@ struct xe_vm {<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @batch_invalidate_tlb: Always invalidate TLB before batch start */<o:p></o:p></pre>
            <pre> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool batch_invalidate_tlb;<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @xef: XE file handle for tracking this VM's drm client */<o:p></o:p></pre>
            <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_file *xef;<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal">Same comment as above.<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre> };<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&nbsp;/** struct xe_vma_op_map - VMA map operation */<o:p></o:p></pre>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------uHprAyHicxmRWgF1yeo4mmjn--
