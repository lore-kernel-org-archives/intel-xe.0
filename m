Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DDAEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 17:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF21F10E077;
	Wed, 14 Jun 2023 17:08:26 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5F10E077
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 17:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686762505; x=1718298505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9lDwuFT+lqdOEYSjXH0En7cy2IXVxpsuWj3BvIaUOCc=;
 b=HdYqEMkc90+kB/s146wiPO/MBdhAECqIZWWswGN58bzbbVVgO7XwvkM/
 lktiuj2mSkzpGNJPqdX+GxWgsa4y45YmzCnyzuRe/0d9tGydKsvqwhsSc
 Ll2YmQLo/qLKOH1915TAgSh0uVI5CVquQHEYTdiPpUVshsRP1s3ozuGi0
 hUFnqbhErLYvsmYL5vZs/HldTZfOH2mrK51pBztJzMdZrmOgG67Ev40N+
 aUTev2NvQHVErU5+kHvbWaz0ok8PmRL+fUd0xcGlLVrQFmZJ9nV3vE/n5
 8v/Dre/v555X3sPl3J5z4quJSAholKDaRtOWYMhYcvUaTIS8HQVwu1Xa0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422276131"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="422276131"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 10:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836333465"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="836333465"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 14 Jun 2023 10:07:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 10:07:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 10:07:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 10:07:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 10:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Il7Vlo+ULBCOiFQ8oNUclPZT31KMwZsxO7GtajrsPHAj/eUVoY1LXWihO11Y4MtogTDSSjNw3rs+GlR3GXhE+Sb7LC0ipGAiOyL3lxhlzxEQWeZp6YCcqc6sieiugCIe5Z5whtN3tW/JOGSnBE+CL7/izARgCB0zoO3PIWfzF6omErUVSjTu2gVQEYmvTrsM16b132Pfa7dDJczL73xBuRxV73Cog3VyTrRTBIYtkoxBKDznm41QQhlo/5/YaaYiJaZ4g2YlSk1MKQmtW8sjuCLXPgkqGe2Di3qsE69PSpPiyuRq/N1lK/+aw/0y3vtZCRFW8eiW/WRdJIagOuxzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lDwuFT+lqdOEYSjXH0En7cy2IXVxpsuWj3BvIaUOCc=;
 b=ZoRhpmp6x/f3hOGSqC187fELg/F9KegEAMZYpXbTQUROdn+vsBkazKQfPEg6uwgjsJCmA0N2KL+hBglwMNZYa3gYirwfgW+Ahc8k+RvrDjX+ODTyA9TtTBTaNE+XcAqVG1/zLupCbRTQ7YZ7n0x4ywu7Zl7iFznpL6x7lyUSHCe6p9fh6VQ0DQe3pzOKohhvAFIsePJX88W06urhBgJpddrB7DOT9A1LaQtxAZ+gvospcWXzb3yYPAuGb+5SxDXQY0XANUewR4Ngn8j5SuguL8Jp4MDBAY+JHTqRls22c3lMJWjNiN7YohJJdDKC++0LFhMuUODJtIIxgwubVSnRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 14 Jun
 2023 17:07:27 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 17:07:27 +0000
Date: Wed, 14 Jun 2023 10:07:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZInzzIxdAQHJ9KGQ@nvishwa1-DESK>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230608050333.37581-4-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV8PR11MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 5831ff79-ab30-42fe-3551-08db6cf9d484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GvmgC5z1tc098elGD10GYPXNo8oARbQTyIMNQc0kfYVMZSBWJsgY+6bUEJuTS1ZKnFuOch6YOZQXx+D+JRjoRGhHckwBoeVxO4qDj5BpPMxFd8xFJOxVSN5Ow8RRpcqI3Rcl2Fa71IuMCmv3UAPQdR/sMFQ/8LhexycylAfFg0YneaZfq4J4GGFNyIJI2oQYSgBYlCJiDjuLy8PE14kWWcSnZzjR7NF7oU0Oyrt8csUYrNRS3xR6eCHl22Atdp/2vEK1Nu2p1xEpdJ7s4LlqtczvyoZ7ANWm4V0UejcJkJNHKVswIiwE8/bM8dUo+sIpDxjYpMo2WSOUOnILiLBY+22mANRHIvm6Tp1fi1wz0FsZb0BMM6w9Pzo+yIKzdEHWoYd0boAicnrCpP/Gj3LWDK/bxZcS6GpwEzkfrNVNSMe9LdccA5tbPJczfWbM1R74SZ5P4huq14014pi0rfAPe1GCvYK5HT0Dgk+4uEP8lKOSn0Qi84mGG1RssFecSYxlRln6e0dHotMzloltxHRTL6ySHwMb2eItRzeI/mQ5hnFT8Ehz0T1xbLcn+mBAsIn8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199021)(41300700001)(38100700002)(6666004)(6486002)(186003)(86362001)(9686003)(82960400001)(26005)(6506007)(107886003)(33716001)(6512007)(5660300002)(316002)(8676002)(6862004)(44832011)(4744005)(2906002)(478600001)(8936002)(66946007)(66476007)(6636002)(66556008)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+yg8PKLd44YbqVTXG5zkVuAU1Su7o0ibURxn0Kc8CDhQGQrlTB41SArD6gCf?=
 =?us-ascii?Q?P1mwPIeaf9gsK+eEAJpUUK2icP02I/P/cfYtR1zl4vYNKKsnqEZJ0hJFjHOj?=
 =?us-ascii?Q?zwVMisZfbSp14FgrG1ybetjqdFo8T31923efQK2yB42tSoVTeC798nmBbCPC?=
 =?us-ascii?Q?ZUM3eQAhqFf9fUyIWAUT/QPsjSlmjZgcktSH03Omem5uV4MERoWyEXSRmaY6?=
 =?us-ascii?Q?N5+BK8fxGzmps6pqXPlDLFjXOc1P+P1TypPGYoYDFHCA6dQafqo6Mj7esvyd?=
 =?us-ascii?Q?JbqW8VscXIlN4/8zT/eiFb/lJC7N1N3RFj+QFrgLSIhwfZ2m65CsFZKav8zu?=
 =?us-ascii?Q?vOxemlZvfS1sioqPMFZJv+zmSCUUd3hIKU1meVp/fS8Pudz6sZ/rFkMzdKBO?=
 =?us-ascii?Q?1aNJDDQMnX/W5gmfyK9WuQtnwTfPSFr+i7lOvRyNQf/KkhrAaOgJw39I2eyR?=
 =?us-ascii?Q?lyItEgIlVy0rnqi0L0S3lp4uu01A2Sw3c8AAO8u47M+Jz2DtUUCixQUs3pju?=
 =?us-ascii?Q?fSa/rfDrS1vCnjkCbXzxrByQktpDZObSARzoyElW5xCEed/VqFv2me/PeYnI?=
 =?us-ascii?Q?qnlAqv6DQUlFbIngp5ddqafjLi4W7z2ANk4/83CsOLKqhPyOPpXsUnQyZTji?=
 =?us-ascii?Q?MC/yUr56VKevbpAtCrRFbRqXFX39Kdy4eaJSYevKf7dPLikmoadCZU+GwpPY?=
 =?us-ascii?Q?VbhECwsiYSR9iee1zveM8B1eZo050F12GqSweMDXzSP20wLuKmhA23QLqIkW?=
 =?us-ascii?Q?04WVsRWwRIBi+uwZemGJq5tA45Ea9EoUD0d/QcbPa9Q9nPTrqrgvpdiajDTc?=
 =?us-ascii?Q?zjbAfRDKkZ9B5FegIoUX07tgWtKKaeJRzZf/+ZBNs+sgHwej0KfGWc1jaych?=
 =?us-ascii?Q?N54ngTzP+4Nte1a+mI7pRKCjcUxyiPn1GaexjLmzpP33RAu+2+7NpFK+GaEv?=
 =?us-ascii?Q?oRRzX899MopdGPonS2rFm5XKiczXwrK5F9QxfVY5afUNTQOnktNVIQ4OcxQv?=
 =?us-ascii?Q?9TBrwUb2QMGl1UpbA8XJYBBekL+maoBOSUcd07TtYe6PZV2QI1iKihbeia9G?=
 =?us-ascii?Q?yb5GaFuSjIsxhJnRSy4NzgHZA5V6pgKMnnwAmdYcij4Wn9U7jlo0UaUOluM8?=
 =?us-ascii?Q?+nr9halhaxsS1FIx3dOSeypZJmKa+f4LiWq+Bbdc6M/Tz4eE4NHae5roZ1GX?=
 =?us-ascii?Q?QR6TfmuWRp7nFaya+ON2zKYDd7qm+whDX1cAi9apuCEgj5c9ninrTqbczbOu?=
 =?us-ascii?Q?gi7SrlglqvdaLYhIZjPQIUNa47uUhoiEIryVT4tFV4Cbu/eM7mEp9Z5aHCqm?=
 =?us-ascii?Q?v6cNKH4e7CzDZ9FXX+lGhQF4m5TE2jzTbNzZ7wQpvlw+L47O7F/jfq84iJ12?=
 =?us-ascii?Q?QBGucmfAQ4aXu8OnqNLmj4T2p9C8p4/VF7KSXkse5KsquvIhTMdpNVOCJU6X?=
 =?us-ascii?Q?ulNVS0F3sc9qCqX1xSb1VdmEPuJCjKUBYHPGUO6K2rnVqSfHznYNVFtxYirC?=
 =?us-ascii?Q?5BsPvGF0fvpTzLrTBh9fxGJyebCSKoq/je2Jc1V3NZY505A2ktfBshmUo3je?=
 =?us-ascii?Q?vI3wiPtcnU3Am69XvQtK0nC/OgfDHAEv7YF9U5M7VzNo1arUTSIUGQhpCWFn?=
 =?us-ascii?Q?+EyI80DMW2CjWQ7xVf6c+h4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5831ff79-ab30-42fe-3551-08db6cf9d484
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 17:07:27.3270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up2GdCCR1Uzj9JhRPZ3renU93evnpxK6WDXxQhqrA9Db6g1C/wJPLB/4nQ4bWaNYReDk2M9uEm4jzZ4DYRteGcBIpUpG27z2REmQGqAXNeBvD+GD8Qjp8dFQ5pXdGPi1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: NULL binding implementation
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

On Wed, Jun 07, 2023 at 10:03:33PM -0700, Matthew Brost wrote:
>Add uAPI and implementation for NULL bindings. A NULL binding is defined
>as writes dropped and read zero. A single bit in the uAPI has been added
>which results in a single bit in the PTEs being set.
>
>NULL bindings are indended to be used to implement VK sparse bindings,
>in particular residencyNonResidentStrict property.
>
>Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Also, do we have IGT tests for this?

Niranjana


