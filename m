Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916E8C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 23:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360F310E0A7;
	Tue, 21 Mar 2023 23:05:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB77310E0A7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 23:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679439943; x=1710975943;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ieKoVsXnYCkfAV5J9Bfwi17PrHRdQ0Sj9V+Wh6Fpvjo=;
 b=YIuJeI/wSTjm00TiLT0eVPmF6/M0wm3CAd0PfwuCkBkK015n456cu3Ez
 WpH5Dbif8oL1WivWAZWypVaqGPjzRu4XbVDeaVem2z5t/MoPEvy/GMBrO
 1EveXMPC9fNXkrldCPfdSAZwXjboVm0v9dWLm0I62kz0kBVLaVJEPZsee
 24RcFPvr9MwoEbo/R2BA6P1m0VHCy6SdHOz2Xzj9VwE3bcGCWXEjY0meN
 YoZ6MQtk9RZI3D7LYNogBgXMWd7tF4Bl1sWeRot42iZie3uixbGJIG1Qy
 iY4PD9mAhweNB5RXTE1SWqskJr8z8wVVIGLYls1ai+lqeT69l20dBst05 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341433968"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="341433968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="675045109"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="675045109"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 21 Mar 2023 16:05:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 16:05:40 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 16:05:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 16:05:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 16:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Se5gczyoveTqy97KrWMsQ/GQ9VG5UQTtJLvrLH787rjGxzV9JpR0pqALBpa4gubAm3p27aySjXpWbWL5ejPuZmX+nPV/myrJ1NRFlfsaIO40byiMxle2cIFeWofmwuFA7E9DQzkWQYmUMPqtPd3KPtG4pRcwxnZeAG9s344BqU1Nq6RiVVAeYc0oU3pugqi1XIMXnkKyMD46Ok2drzmj6gQDm/e8lDrHySOWpjGUgThJ/eMf0LKf493bD4x9qqtK3dEurRhgKlo5VkN93of5BLEAGynvcoxxSDB3HMJvC2yvKmxrDuv7+VtD+I8lEoxU0/CN9qCwW/UROaCel/X0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW8TqqCU3Yweff3U3kxzGEE6P1V0CLbhT+pxE3bACJc=;
 b=l4Nt/xdplwSwuS7YnixzVutrgpeptyL1ssMZ5GXFGdENfoQYonxh2O6GRrdqBZ1V9V62EazUcJ97LCZfL4fsGjmAI3NOOrvXSZWHLtBVqi+peLxlHTNlhBLXJot8wOo7e+eFpr5wfgkD0skrq3kqrJn4VqNL832ztCTwkur/5ufxO9BV0dv+uU+Sv7ySrHSXoBqtEObn7P9ypxMSkJe2fTHDw6J08ejEgX4xGJADo+VHP5fs5qJn/2hBwYc+QiI7aY7cbF/Ipt67UdUdsyTdH4bxYo9LznR3duCQjQl1P9dTdy4zCqdmC6CZi1kFnIW/EzXIKqLcLKFNoYsFiAJC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 23:05:37 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da%8]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 23:05:37 +0000
Message-ID: <e8455532-518c-4bcb-b58a-351f174f3546@intel.com>
Date: Tue, 21 Mar 2023 16:05:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
 <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
 <20230321210349.mr5e233da5ihvv5f@ldmartin-desk2.lan>
 <20230321214858.GP4085390@mdroper-desk1.amr.corp.intel.com>
 <SJ2PR11MB7715ACCAEFE21E4288F9A230F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
 <SJ2PR11MB77157BDC838C1A64A83D7787F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <SJ2PR11MB77157BDC838C1A64A83D7787F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cf7610-ec9b-4862-3709-08db2a60c874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gyd8TW5UylI3oq7VLzmjQkapTzLPjSduInMxnTZM8awipOvZ8mbL2ffZ/g33dnN+aGiBjXyBoZFBpQTiEVg90cT/yNVaYXbclqYXYPsZQbBUHmxHk9Az7wsOUyekMCCUfoxtE7GMn1dHylj25Eao6DgLwpLUWtIudvitqiX3zyAYMQST9WQsg5XmnnSMO2TizxwWTOoxNiJn0vYW+qxmAJcN7b6d748RMmxIsKvNlaDRK9up75XA6AyrVZ0SVTrXbkGPJVf1gGfKQaKjDYe63XvafSJLkD9g3NalKmWZRr+tvEOXE7Q3sJkCS4M/WHbKEU4PzIF48R5mKCuei8pTNHaE6MCQqh3bdhdIQnlCsqjeyGy9HCC0h3CdthN5oORw0sKFRxxCw99KnRnASb0FuZ/2YcKB2b+my15oIaBQju5ZwxSA2bb5PrmABL+3+jFRwo2qeawURH8C/AiveDk4D/6mt17NKDFmrKW8eLAfRd1LDlD8g0DWzefbIY+pb8nTcwWLC6zWbMSR/OZVlTAgBY0sL8yU1ycITCQlDdTQnml18hd95QU6evYO1qEvGB6lHcQd2arkhRS4bJ7GDIzD64zgQriEgnLTm6G30eRNhYkBtuSZ8bCPDmlmpRkBaD0vu/e9R9G2JHKHyBIcZQpUj+9PzLN92qC6BWPnNUXvoE8kEnLT/30Vx8JH628CwsBC0ZlDpgw9t13e0BQITKef1vhpzTtkXUpAdEUffl1ptUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(31696002)(86362001)(31686004)(6512007)(26005)(82960400001)(2616005)(6506007)(53546011)(6486002)(38100700002)(8936002)(36756003)(2906002)(5660300002)(83380400001)(478600001)(6636002)(186003)(110136005)(41300700001)(316002)(66946007)(66476007)(66556008)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC9vcWRvcGJZZU1LaS9hYkpzZ25aNEJsSG01T1F1SjMxTFJma0RpeU01ejdC?=
 =?utf-8?B?aGRUNndzV1d3TytzV21xblhvNkZZRWpsQ3lLeXE5TXhCUy90RDJqZkl0RGU5?=
 =?utf-8?B?V1hUSG9SZHM3OVdlbWI5NTdFUTJCVERqd2RiWnF3NG1TOTRSaXRBT2F5LzJD?=
 =?utf-8?B?dkdFd2haMmVNMnI2dUF2SGxHOU1pUmlzSkVwRFZ3UGM1UFhLZGxHbi8zTzFS?=
 =?utf-8?B?bUNpRWxhNXlVejhtVktaZTRaTjVPKzVaeGNtT3FoandSL0JGRldMR20xN2ht?=
 =?utf-8?B?YldqT3pnQXk3UzU4c3duQVpod3lyZXZqMkVrblBsMmZvWWpVTDFkK0JFUTBY?=
 =?utf-8?B?NzZoRVo3ZE1aVitzNmNGTzVrRC9lZ1lxZW1PNlUwWGRyNTdVMGQvdEhEVnRB?=
 =?utf-8?B?UnQxSzg0eVNHTHRYV0hrU1IxbEQ5bEFWWEcwMzRBQVNPUkVBaVVrSkIwZFBO?=
 =?utf-8?B?TTRvS292SWFvaG9YMEorckhRbTBRRVI4c2lJRDVuak00dmdGeWd2L2FlNEl5?=
 =?utf-8?B?WGFVZlYxSjJFbDFsR2FSazBWMnh6OEllL21rV3VsS0t4bnVFaUdNb1psU0ZX?=
 =?utf-8?B?ZFZOeFlueWpVUGNWY2x6WHR4U1FUNVA4YWhleTRUb09ZdlFKRHIwMks5QXBm?=
 =?utf-8?B?T05qWVJXWVlkMndpd01EcmFVbjdpb2IzZU8wbDN1blYzM01yZnptUUMxQVMw?=
 =?utf-8?B?ZFBGbFpkTVNoVStYN2lWSXE4VTRyQWFudU9kTlNFYzRCamFiNmsrZ2NsRG1t?=
 =?utf-8?B?dDQ0Qk5RbXFwSXRhSmhLb3hDMS80ektDODNiZnJHNEJmWU42Nkl4b1VYVitE?=
 =?utf-8?B?NDg2R1hIcmxGYkxDMzB3REVCTUxSQm96T3Uvck5sZHNBT3dUQzlOWDRxblo3?=
 =?utf-8?B?eHpjcmY4MWsvcTVadk12OGZ5aFluRnQ1UGZrMDM0WmJhR1lic0JEaEVPdGZK?=
 =?utf-8?B?aG1xY0dQZHJiSkthRmJrbWhqajNtT0twY0RkRzluK08wU2F6WVpucWl0TXp5?=
 =?utf-8?B?SnY4ZzFKa2tyZThCVlJUcVFERXQxV0JiS2k2aGlIWDBUdVdNUm1TdDNCS2lq?=
 =?utf-8?B?UmtmMWF0ellWMExBM0tqcTNCd21QdThQSVpEMThmZEpvQ2U2TzF4N1dkaDNZ?=
 =?utf-8?B?bjRyRjBjdWJkZUl3TVRzL2Z1ZktFcURBSE95c2FKR0g5enJZbXpKLzA3R2Fn?=
 =?utf-8?B?ejh2T0F0VGFHRVJBKzkvSE5jbTYvU055SDVZUkk4L0xPL3Vtd1BTN2d4MTdH?=
 =?utf-8?B?eGxrTjFScnE2UG4wMU04QVJXR3hteEdueXhIcXJQcHkxWGwzTUEzVEtsRnVX?=
 =?utf-8?B?NTVtbGUzSFpLMjFVaEdIVjJNc0huMWJQWUlZdERQeFMrTVpGWmRHTEU1aHpJ?=
 =?utf-8?B?cytuSmVSWmZDR1ZMcGtzbjJ5SHVqYkNuai8wRm1YK29lcVhtSFBDcERrcmEy?=
 =?utf-8?B?TjVjL0JtQnpYaktkQ3NNMkNubXMwcTRUV2U2d3laMlcxNWZVVTdtLzQ1SkNv?=
 =?utf-8?B?dStrL0JOTFpYUUh0cndTbzlLNVc2ejhMSy9QVG9za2hRdUxCQTFzdnRwb3Z3?=
 =?utf-8?B?Sm1TUjZGQStGUWlzS2FiMEZCMXBWR3Yzc2tFOEsrYlBCUXZ6M2ZFR2VqSHRC?=
 =?utf-8?B?Mk82MG5OUStaNnRCQlJ2cHlCV2gvblVZSGRObGJIQ0Z5YkREVzVDN3lYUTc5?=
 =?utf-8?B?QU9waFI1Nkx0N1FUNzFCTE4zcVNCajBRWTF4TktUZDFUTHgwS0NkWHJ2K3BJ?=
 =?utf-8?B?OHZDOGRFZzh6WnRqWWJaK2hrK3pMbXpFNmhqeDdqT0NOcDlBUlZlOUNZS0E0?=
 =?utf-8?B?T3ErVi90SlcxR2F6NFVVdlhHQnFHUUs1bjE4UmZmVlEwOHhUUlZuY0htZmI1?=
 =?utf-8?B?ckdsdTJ3MVJnTCtEckUzNzkxRzY5WFY1c3BhYnc0YWR1eXBzbkhPSnpCMStS?=
 =?utf-8?B?RjlIUDJIalZPYzJTUjZhSS9GOHlrRHFKOGRONXJ4eTFrQk4zUDRKM1Y4NFhD?=
 =?utf-8?B?VVRQa016aGJtNGJjSVZieXJPRlpnNkpkL2xJWURyUWI2NVkrdDFRdkYwUTND?=
 =?utf-8?B?UnQyN3ZVNUtpUzNtZWpTazVkQ1R1amxkMzVXeGxoUjhaUkZwVWdtYzhkY1Y4?=
 =?utf-8?B?bkxFNWRKKzBSWUVwRTVsT2F0RFhWNlFBOE5taGp3UXJ2M3VmVmpzTGtuREp4?=
 =?utf-8?Q?CMVQoUzHygSud1a7imGM2ug=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cf7610-ec9b-4862-3709-08db2a60c874
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 23:05:37.3374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P81m7Fmiv9WkNprEtZuZgQx9Eh9R5abhUaVGu8yF/QQQgUqArwqioD8HSYM7+i7IiJk0MP9ipopnfi/RH5pcRg2B3ReeDyiYYw6i7mR/1l4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/21/2023 3:48 PM, Srivatsa, Anusha wrote:
> +Daniele
>
>> -----Original Message-----
>> From: Srivatsa, Anusha
>> Sent: Tuesday, March 21, 2023 3:24 PM
>> To: Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: RE: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
>> unversiond HuC
>>
>>
>>
>>> -----Original Message-----
>>> From: Roper, Matthew D <matthew.d.roper@intel.com>
>>> Sent: Tuesday, March 21, 2023 2:49 PM
>>> To: De Marchi, Lucas <lucas.demarchi@intel.com>
>>> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
>>> xe@lists.freedesktop.org
>>> Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for
>>> loading unversiond HuC
>>>
>>> On Tue, Mar 21, 2023 at 02:03:49PM -0700, Lucas De Marchi wrote:
>>>> On Tue, Mar 21, 2023 at 08:50:59AM -0700, Matt Roper wrote:
>>>>> On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
>>>>>> Follow the new direction of firmware and add macro support for
>>>>>> loading unversioned HuC.
>>>>>>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
>>>>>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c index e2e5f7fbe9db..3c522d970228
>>>>>> 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>> @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct
>>> xe_uc_fw *uc_fw)
>>>>>>   	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
>>>>>>   	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
>>>>>>
>>>>>> -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>>>>>> +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
>>>>> Why do we still need the old versioned filename?  Can't we get rid
>>>>> of it completely?  There's no backwards compatibility necessary on
>>>>> Xe yet so this is our chance to eliminate the version numbers on
>>>>> HuC
>>> completely.
>>>>> It's not clear to me why we're still using huc_def instead of
>>>>> huc_raw below either.
>>>> note the version is saved to uc_fw->major_ver_wanted and
>>>> uc_fw->minor_ver_wanted.
>>> I thought we didn't want to use those for HuC, only for GuC?  Since
>>> the kernel doesn't interact with the firmware at all, there's no need
>>> for us to enforce any kind of minimum version check as far as I can
>>> see.  We don't even care about the major version number, which is why
>>> it isn't included in the filename we load, right?
>>>
>> Yeah if we go down the route of wanting to load unversioned huC. Then we
>> should also override the version check for HUC like we do in i915(this change is
>> part of v2 of this patch that I was just about to send).
>>
>> Else we see:
>> [  292.632408] xe 0000:00:02.0: [drm] HuC firmware i915/tgl_huc.bin:
>> unexpected version: 7.9 != 0.0 [  292.632415] xe 0000:00:02.0: [drm] HuC
>> firmware i915/tgl_huc.bin: fetch failed with error -8
>>
>> Because it get 0 and 0 fro mthe table but it finds the 7.9 version which is actually
>> right but we should not have the check at all for HuC.
>>
>> Anusha
>>
>>> Matt
>>>
>>>> Later when we are parsing the blob we read the version that is
>>>> encoded inside the blob (rather than on the filename).  See xe_uc_fw_init().
>>>> I think the version check is still makes sense:
>>>> major should never change and minor has to be equal on greater than
>>>> the one we first started supporting.
>>>>
>>>> The version in the filename needs to be removed, however the version
>>>> in the table I believe can stay... it should basically check the
>>>> minimum version required. We could rename
>>>> s/minor_ver_wanted/minor_ver_minimum/
>>>> to clarify.  And comments on top of the macro definition to document.
>
> @Ceraolo Spurio, Daniele Any thoughts? Should the driver not check huC version at all or just not have it in the file name and still do version checks for sanity purposes?

There is no commitment for HuC to maintain a stable major version. 
Differently to what happens with GuC, we have no interface with HuC and 
therefore no agreement on what the version number represents from a 
feature/interface POV. The version is something that is handled 
exclusively between the HuC and the media driver.

This means that the only check we can do on the HuC version is that the 
version is >= to the one we started with, but IMO that's not worth it so 
my suggestion would be to just skip the version checks entirely for HuC 
after release. It might still be worth keeping the ability to do exact 
matches for early drops (i.e. before force_probe removal) like we have 
on the i915 side, but I think that is a separate topic.

Daniele

>
> Anusha
>>>> Lucas De Marchi
>>> --
>>> Matt Roper
>>> Graphics Software Engineer
>>> Linux GPU Platform Enablement
>>> Intel Corporation

