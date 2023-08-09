Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F79BC04A94
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 04:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E010E232;
	Wed,  9 Aug 2023 04:26:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF6E10E232
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 04:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691555197; x=1723091197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0AT55D/4m6J8DvD+6EgfSasaYqScMsLPCNJHbSafPqA=;
 b=OLaqbsCDujyuFPbYcqiwLpuDQQRGcWXA2Att7uKtqXb4lA/MaEdVq1fR
 wpX48i67/bqlXT2kmuq6XXBemPj5nOFdPLBzajSKhxfdBoLK2eeAMyAcq
 CyAV2LWexQPTAJ9BLRo3x4By9Kkd6gEIzJPReN/g+piL27ZqmTQ2lsXMd
 G637JGX+bezr66UkPSOGT56+PlkPG7hPU+g/N7xC28TYrchs2Z49ix4I6
 J7LsndjbJq41mQ+s97WAp45rSZWQeXaiNIJO0WfGJmT+4ECRXX3IYfTBX
 nNgHDBPRnLQ+VdNX7eADwt3V/x5wsfQkv6TwyhtZ4InNdijwn9FuY4Lze w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="355983481"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="355983481"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 21:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681528428"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="681528428"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 21:26:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 21:26:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 21:26:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 21:26:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 21:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI04WutHrDWViPD623aMVyP5qUWIHqFBfGnevwmwoEjRPDZjxWcnyeLANNcyuPozh7DEjn2f5jDw0jGDQp8I9VpB65pos8LLvlegvMMhPx16weq/uas1bCaO1zTc7EK3xvQf0sSPsnSC3aLJ7LjyiYhROa+kgryupOGbup8qibCu1TQ2e6zCDHKRy2a1b4K2HQSh/6JJeAoZhoqdlsxE+u0ymssxDhPhCD2pokcr5AMGAkE5AruNz14u/s2mb7CvqwJlQECbN7CVGJLqxFkHFdskZNEyc1JwgoSEMZ4PspBjAp20i7t8+Cov0vUHQxjZIlOn5mMSYkX+GfHVWLOfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc/MizYK54m1qdfUIOIKNynVBd6lkRbxSj/2lI/LoJ0=;
 b=bSx2L9sHw3qWLq6TZMhJDhbmUTqyZ3DVoXmlybZVe4wNLHVxgaOzkS/gGzrRz+pAsEaTjwSjciJDgrnKje0HBKyB4ob1LKlxq3wuv8/hY/fxcjgLnC1JGw7bUTxXhbwrnNNiWLjL4itAUXoFfOdJhIB3z2vhAi6hlp1wSHMqZPac77NWC9T+RXIGcwqXcQnUOrbwGkVGsvkgkLwJHSMZ0FC2oJR+zDcTpQ50Qx+s9m+zBvs0Bnv7mKLXGNAB1nJJYjZjhZwGZZZNy3QhfJk9Uashcfv1RwxQoFGNzuSGU6WBqsuGnirOtIfMKS7DVK98auLIW72195OxCucQT4tQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 04:26:33 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 04:26:33 +0000
Message-ID: <8220ad17-1624-5476-3207-0b5043b845c7@intel.com>
Date: Wed, 9 Aug 2023 09:56:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87cz0mqdpi.wl-ashutosh.dixit@intel.com>
 <f4f6c8f9-a97d-6072-cf0c-4122b3d4f93f@intel.com>
 <877cqsrg65.wl-ashutosh.dixit@intel.com>
 <875y6cqy6p.wl-ashutosh.dixit@intel.com>
 <8fd9bc04-b737-0acd-a0c9-4f163c1a117c@intel.com>
 <87351dqpcr.wl-ashutosh.dixit@intel.com>
 <42bb140d-2faf-43d3-a027-fe430b3682e5@intel.com>
 <87zg3lp8y5.wl-ashutosh.dixit@intel.com>
 <500331df-d95b-d447-18e6-d0f198570072@intel.com>
 <87o7jiy2lw.wl-ashutosh.dixit@intel.com>
 <87msz2xzky.wl-ashutosh.dixit@intel.com>
 <d2c664b8-f7de-1c66-4f5b-42358fa322d7@intel.com>
 <87il9py349.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87il9py349.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 06923bbd-16a7-4228-c1df-08db9890cf79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cpIZab8A6ujf+5cy/QfLtIFMYDKktDhMpkHMDGlx3lRigj7PvHoqSH+zGb/FPys1eP9BdUMrFWOh4ckJZ8Pg+DeMDmbrhVhgsv9JBW+kkT/8Jm8fBfrWqxV5PMlFEYXqP1mD2Gq0UtpmgKUKZLEG9n15yQk33K3lR5OCsyw3VwiMXgtg0yi2+nCnFotHltj0akIbnIU0mEZ741O8gWPHHa7Os0DHWNLGzkidiFtP0fqc0Km7MQMY4vY25KtuL/B1YGkumPb78jSfTXuCsfBfY8wuyYCWvUbnZyJDL9rLfG8KXuhS0uomB2SNuBc13G2RMrn13p3IXuxy9uDNOXpcomuqDnBmIbTVT8BMrCmeSdm0c0QUimxsdL3DSpQskDlOhCh0fUpsdS2Qj0gLayy/+ARsNueGZf8neh2t/y2aHVaj1nuxzUQ41u7RkoIQgrMBudnTsOAn3fWhVdjd/J9iAfu9cBdj5UHpeL8PpZZ29w8AsD+fEIm5V+inHA/6RDzkke6/rCD9iScougx4Cz9Uz3QiGiTP44KrEZnje3HL0bigXthJfIcrhY/xc0XIDxgzCzNBUW0pJGcxdX6zYDzJWeGZ0EvJ83b2WKm1+T505pa6yMWS1nEQ28osTqAJw8xI+LfJnAQqn0xWGxtm2LmXPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(186006)(1800799006)(451199021)(83380400001)(31686004)(2616005)(66899021)(54906003)(38100700002)(6636002)(4326008)(5660300002)(316002)(8676002)(6862004)(8936002)(66476007)(66556008)(66946007)(478600001)(82960400001)(31696002)(6666004)(37006003)(6486002)(41300700001)(2906002)(107886003)(26005)(53546011)(36756003)(6512007)(6506007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1A4RXhWRVY2U3BKcnNQNkwxeUFwYlAzZ1RHZ0gyZTdIUFFyK1k0ZTlhQmFE?=
 =?utf-8?B?eloyUWNjeFBTcjgybkMxbzkyaHM0K3NrL2ZveG9NWjNqcTEwaEZXMHE2VEVM?=
 =?utf-8?B?UmxzNWtObUlDREQrQzQ0Mk1seGUzZUc5U2s3SkhHOVFTOGJjQ3REY3JybVpV?=
 =?utf-8?B?djVvdVZQQVhVbmNHaXl3S29DTUpQQkVaRGdFQ3JrQXF3eC9LamNOWmlUdWZO?=
 =?utf-8?B?N0lGVjRqcUwzTU5OZEYyVG8xRWw4TEdJMDl3eFBWaCt4cG5kYjU5RGErOGpx?=
 =?utf-8?B?QW12dFYwS0NjaE9GSm5xTUV3enRDa3NVdzRDQkVGS01KQTc4SnRaSWVpbzJF?=
 =?utf-8?B?UmxTbFoydXNVdWppNm13YllBcjVDOTY0SWVGa0s5YW1yQ1djdS93enlyLzVG?=
 =?utf-8?B?cG9TTzJmdnlWdjFSRlZHaGd3R1lySXBSVU5JK3dZMk54K0ROL1JaYkVqZmJ6?=
 =?utf-8?B?QlZMQ0ptVDU3MkYra1RTcmJ1azdTNHVqSWtkVm9scDdZT1pqMUFRYlNEcXQ4?=
 =?utf-8?B?ZnBBcDA1Wk9YZlY5M1Y2VEcydWNrTTFmcDZPVkFrZmpaRGZoTVJuU0JTa2tJ?=
 =?utf-8?B?cW5XaitSZUxnaVFYb3haQnlDMEhJOG5JcTRqVmozb2plR0ZVc1EzMkRQelhN?=
 =?utf-8?B?Ym1JM2VnQ3AzYWllY0FMditIMHB5UXlad0lLSjZsY3dNVmdadE94Z3pwTStV?=
 =?utf-8?B?WHRvVDd4ZHVNUWJITWhSZXJ4L09JN3VBTFpwTlVqeGhMVS91QTFKSXAvOCs0?=
 =?utf-8?B?UnRPZUJRQmxwT2pYZDFFajVqNW5aUjdRT3l3d0pUYXc3dllmM2ZQay9OZU9O?=
 =?utf-8?B?RHVPc21jMU1jc3JhaTEwZnJ5YlNDaG9jMFozRlowbCtReEJtRkZzZE9lbXBW?=
 =?utf-8?B?eExjc2l5TDBlUXZRRnV1ZFo5TmJyWGZLVmV0enhqSWhmWGdsQjEzUDUrd1g3?=
 =?utf-8?B?dXZ3V0R5YjNMYWROSXV6MUpkSm56YU1kWGpLZW9CMGJYek5JanBxdWw1YXBj?=
 =?utf-8?B?OTBQbnQ2Kzg4aVpNK0hldXQzSVNUYkNJMVN6WHFwK3RIMTUwSm5Wc2FES3RH?=
 =?utf-8?B?M0RYYWZJOWZtN1JhRUtzUzNGdmY1UmtVazdqTlpPdE9sblZqNTdIbWRqMHhK?=
 =?utf-8?B?R2g1bUF5dWowSG1nemk5RzFrdUk2VndTQzZnTVJyNWdhSEZKU0JnM0pweU5n?=
 =?utf-8?B?VXE3RTFvTTNJTldxRGxWOUUxZSsxNzVWQjVaMVNXWXJVNkdPcEVENmpweVZw?=
 =?utf-8?B?SkF5RGw1R0l6cTFLS0ZScnk4YzR0L2hGQThqaFg4dFl1amMwdmdJMVdHcjFp?=
 =?utf-8?B?c3RyTzBqd2JCcjJjd09XNDAvL01WY3NmRnhtTUlMeWhidXJ6bDFFY2Q3K2VX?=
 =?utf-8?B?WkFvSFdQUnJTaVVHaERjNXV6RVY0c05qMGZsblIyd2xwSjB5R1BxVGxPYTRu?=
 =?utf-8?B?Qnc1TkkzMjlFUDNVQ3JIREc4QjFpSVpkeUFtYXJIT3BXSXNjQU5mTVFBd3Vq?=
 =?utf-8?B?RmNMd0RhMnZ2a0pKay9HbGc3T3BIdEtIM29GZ3RvWklueStoRTM1QVhqQ0N5?=
 =?utf-8?B?V0RFa1lpY3ZWdXh5dzZ0bExVOGNKeTVQanJwM2t1QTd4b1pUYzFhZWl6MWlC?=
 =?utf-8?B?L0tkY2NxTUp6WGo1dEY3dHFMdCtLRGRiUkRDc3JSYlRPaDBzeEo1K0ttRzh2?=
 =?utf-8?B?SWtqckRWVnBtbmUxMmRIRHEva3ZlQ3lpMmJvU0JhQVlFWXYzVkhRUlYrRXNU?=
 =?utf-8?B?YmtxZVRWcnJVd2t5OUUwcXlzVzRGM2VEdklPRHZuaTJldGRLQ1B6MjVKb3Vp?=
 =?utf-8?B?ZHlTQVl1SXhlN0o5QmpNNXp6ZW5wc0JOaldRdmQ4bjEwZkJvK25LRXRjS2RJ?=
 =?utf-8?B?S1NTRG9lb0pJeXBaNmNNQVFrVE0xZU92LzRhcXlpNmUzeEVlZUlHYmozb2t2?=
 =?utf-8?B?QlBNenM2QWdzcXRGZlB1bGtMYkNObkJrL0xDYStjdm1SQ3BHSXhybklQSzN5?=
 =?utf-8?B?VlJNdHhZeDRQdnNFM3hwQU9rbHBsOFd6ZHZRdldLcXhOZTNyd3VPR1FQem5U?=
 =?utf-8?B?REFFcjFCUXVNbTNsQU85bGFKNElCbk1wTzIyM2g5THZySG00dHJ1K0xLb3FI?=
 =?utf-8?B?aVdSNi9LR1dXMnltL1lGd3p3MHYrcVJucVdkR1hXVkNsRnJMKy93UjNDbmFB?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06923bbd-16a7-4228-c1df-08db9890cf79
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 04:26:33.0875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47xp4cDdZLt8UZIoW5gWqyUzKnW+1XLaEnL6asUNjyrinP1/ryEJY0xK+4Nf/HEDt8asNsO5jnZGUd+o/gxnUGLbRRZphtYf3EnDR285kKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 08-08-2023 20:48, Dixit, Ashutosh wrote:

Hi Ashutosh,
> On Tue, 08 Aug 2023 06:45:36 -0700, Iddamsetty, Aravind wrote:
>>
> 
> Hi Aravind,
> 
>> On 08-08-2023 03:52, Dixit, Ashutosh wrote:
>>> On Mon, 07 Aug 2023 14:16:59 -0700, Dixit, Ashutosh wrote:
>> I have sent a new revision, but commenting here for few comments.
>>>
>>>> On Tue, 25 Jul 2023 04:38:45 -0700, Iddamsetty, Aravind wrote:
>>>>> On 24-07-2023 22:01, Dixit, Ashutosh wrote:
>>>>>> On Mon, 24 Jul 2023 09:05:53 -0700, Iddamsetty, Aravind wrote:
>>>>>>>
>>>>>>>>> On 22-07-2023 11:34, Dixit, Ashutosh wrote:
>>>>>>>>>>> On Fri, 21 Jul 2023 16:36:02 -0700, Dixit, Ashutosh wrote:
>>>>>>>>>>> On Fri, 21 Jul 2023 04:51:09 -0700, Iddamsetty, Aravind wrote:
>>>>>>>>>>>>>> +void engine_group_busyness_store(struct xe_gt *gt)
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>>>>>>>>>>> +	unsigned int gt_id = gt->info.id;
>>>>>>>>>>>>>> +	unsigned long flags;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_RENDER_GROUP_BUSY(0)));
>>>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>>>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_COPY_GROUP_BUSY(0)));
>>>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_MEDIA_GROUP_BUSY(0)));
>>>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
>>>>>>>>>>
>>>>>>>>>> Here why should we store everything, we should store only those events
>>>>>>>>>> which are enabled?
>>>>>>>>>
>>>>>>>>> The events are enabled only when they are opened which can happen after
>>>>>>>>> the device is suspended hence we need to store all. As in the present
>>>>>>>>> case device is put to suspend immediately after probe and event is
>>>>>>>>> opened post driver load is done.
>>>>>>>>
>>>>>>>> I don't think we can justify doing expensive PCIe reads and increasing the
>>>>>>>> time to go into runtime suspend, when PMU might not being used at all.
>>>>>>>>
>>>>>>>> If we store only enabled samples and start storing them only after they are
>>>>>>>> enabled, what would be the consequence of this? The first non-zero sample
>>>>>>>> seen by the perf tool would be wrong and later samples will be fine?
>>>>>>>
>>>>>>> Why do you say it is wrong perf reports relative from the time an event
>>>>>>> is opened.
>>>>>>
>>>>>> I am asking you what is the consequence. Initial values will all be zero
>>>>>> and then there is some activity and we get a non zero value but this will
>>>>>> include all the previous activity so the first difference we send to perf
>>>>>> will be large/wrong I think.
>>>>>
>>>>> correct if we just store the enabled events in suspend, any other event
>>>>> will have 0 initial value and when we read the register later it will
>>>>> have all the accumulation and since past value we have is 0 we would end
>>>>> up reporting the entire value which is wrong.
>>>>
>>>> Ok, agreed, so we need to do "something".
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> If there is a consequence, we might have to go back to what I was saying
>>>>>>>> earlier about waking the device up and reading the enabled counter when
>>>>>>>> xe_pmu_event_start happens, to initialize the counter values. I am assuming
>>>>>>>> this will work?
>>>>>>>
>>>>>>> xe_pmu_event_start can be called when device is in suspend so we shall
>>>>>>> not wake up the device i.e event being enabled when in suspend, so if we
>>>>>>> do not store while going to suspend we will not have any value to
>>>>>>> consider when event is enabled after suspend as we need to present
>>>>>>> relative value.
>>>>>>
>>>>>> That is why I am saying wake up the device and initialize the counters in
>>>>>> xe_pmu_event_start.
>>>>>
>>>>> Afaik since PMU doesn't take DRM reference we shall not wake up the
>>>>> device.
>>>>
>>>> Not sure what you mean because PMU does do this:
>>>>
>>>> 	drm_dev_get(&xe->drm);
>>
>> sorry it was my misunderstanding here, please ignore.
>>
>>>>
>>>> Anyway I don't think it has anything to do with waking up the device since
>>>> that is done via xe_device_mem_access_get.
>>>>
>>>>> if we were allowed to wake up the device why do we even need to
>>>>> store during suspend. when ever PMU event is opened we could wake up the
>>>>> device and read the register directly.
>>>>
>>>> No. That is why we are saving the counters during suspend so we don't have
>>>> to wake up the device just to read the counters. So the issue is only how
>>>> to *initialize* the counters.
>>>>
>>>> You are saying we initialize by saving all counters during suspend, whether
>>>> or not they are enabled, which I don't agree with. I am saying we should
>>>> only read and store the counters which are enabled during normal
>>>> operation. And to initialize we wake the device up during
>>>> xe_pmu_event_start and store the counter value. Alternatively, we can zero
>>>> out the enabled counters during xe_pmu_event_start (the counters are RW)
>>>> but in any case that will also need waking up the device.
>>
>> when the driver is initially loaded there might not be any users of
>> device and immediately it might enter suspend, so at the time of suspend
>> there no event enabled, but the pmu can be opened just after suspend
>> wihtout any actual work on device so device still resides in suspend, so
>> we should not be waking the device just to read the register in
>> event_start or any of the callbacks without any real workload or user of
>> the device.
>>
>> so ideally if the device didn't enter suspend, the counter is
>> initialized in the first read when device is still awake.
> 
> Yes, I understand. But the issue is why are we reading (doing expensive
> reads across PCIe) and saving all these registers for PMU when it's
> possible PMU might not be used at all and none of these events might be
> enabled at all?
> 
> So to me the lesser evil is to wake up the device at xe_pmu_event_start
> time and initialize the counters. We are only waking the device up once at
> init time, not during normal operation. Whereas in your case, you are
> reading and saving these registers continuously each time we suspend,
> whether or not PMU is or will be used.

I'm not sure which is costly saving the registers during suspend or
waking the device on even_init we shall remember that the same event can
be opened by multiple listeners so that will make the device wake up
multiple times had the device got suspended in between opening those events.

and suppose if we do multiple PCIe reads are you suspecting it will
affect any timing requirements if the suspend has any and I have little
doubt there if PCIe reads will take so long to miss any timings atleast
in this case. But anyways as you said we can take this up later, if we
know we will be adding more such counters in future.

Thanks,
Aravind.
> 
>>>> So this way we only wake up the device for initialization but not
>>>> afterwards.
>>>>
>>>> Since this is the "base" patch we should try to set up a good
>>>> infrastructure in this patch so that other stuff which is exposed via PMU
>>>> can be easily added later.
>>>
>>> After thinking a bit more about this, though I think this needs to be done,
>>> I won't insist that we do this in this patch, we can review and do this in
>>> a subsequent patch (if no one else objects).
>>>
>>> So let's skip this for now. So if you can generate a new version of the
>>> patch after addressing all of the other review comments, we can review that
>>> again and try to get it merged.
>>>
>>> Thanks.
>>> --
>>> Ashutosh
>>>
>>>>>>>>
>>>>>>>> Doing this IMO would be better than always doing these PCIe reads on
>>>>>>>> runtime suspend even when PMU is not being used
>>>>>>>
>>>>>>> we have been doing these in i915 not sure if it affected any timing
>>>>>>> requirements for runtime suspend.
>>>>>>
>>>>>> Hmm i915 indeed seems to be reading the RC6 residency in __gt_park even
>>>>>> when RC6 event is not enabled or PMU might not be used.
>>>>>>
>>>>>> @Tvrtko, any comments here?
