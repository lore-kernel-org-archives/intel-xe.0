Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77D4C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DF110E4F4;
	Tue, 16 Jan 2024 14:51:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50810E564;
 Tue, 16 Jan 2024 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416659; x=1736952659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8zjpoCcXeX/QEuS6ANFRAlIqLTOFGAV/fmziDRQFuAg=;
 b=HfzisDyFMzAKYweR87AsImpGmRojG+t6MjeLPwjmm3DPRGf3hs2Pxg5D
 afaQX0r/FqOc9IsV/55KzTjSi36eid/yktTbejp3lNiiyXHrlIx//VX2s
 4+nTtBNP4bm7iWipN0ERse4iOuN1Vwb4e36U2T+p8Jkuh+Z825uKQTZEv
 LOHftUxoI4984Xi8Xa2okUefEOfE1+iQEoVGvzdEDoQiG7Css2mi2nfpD
 xhcq/nhzfxIxtoz5dttSY7VMaPWBs08pQAUYwlvszJK58Jeh7OfBOlUOD
 0TSTSXB/oYmci0aw8aJxEGgzw/v6FBkQHR5bK2hdQOtaR7db6rEyIncFM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397040424"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="397040424"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787464012"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="787464012"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 06:50:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 06:50:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 06:50:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 06:50:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gd+Fh1pqmRxPEyVG4/cKJ2SBtXgXYa1JIs8XXHgJUlt+sKuLAG7fUvPU4fBolzlQ2fIpy8aoBJ/5FnKbE2RjSPDpLKmIqrOXFl6IEfKEOQP3dQcamA8q99lJtS5FRKBrd6HHUrRTtNeH6WslFKCTozLQ2Acf3gpHdScyjAhzT6y5BVNVpnd1MkLsQndEbOdgShsd8CDoNfX1yfZLUMmaLH5IG8U7fZlcbMgoV50MdRx6ekwRDUB/ZWlp4lc4rYKKyfZK3wGzLj0Uhbhf7v1zCVSqthhg1tffxDmzmJUW/SrBDG+QAPhTr/y7e9B2bk7cs4L6r400ANGxaRuwoe5vfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLsh6+r/z50wxv8dP+vsZL3vmtkXRMtoTZ+5oRBik7k=;
 b=CjrNfb/c5YHVfw9Es03JFka/DPPbH9nRVQzpe9W6lI+zbIDT8G7MVlRsB7nSPhcHLvOsopdhion0XrD/RsX+oPyhCZPismmzWzw/Bmrak+/VtLOegplNLQM8/TrAjZOt8yeTsL39ae9rk3G0ER1yyJ31XfoBSCpvZVg+aKDAr6kk4s1YoDMH6lykutnY3ZsjWZ8jtIivuUUBKdev+SKG8KJ7a8EwwLaOlMEyFIcvBj9LRCm0XhmKeu6ygbLR4q0NsOvW2ezbpj7kqxTx+ueIOHSGNwxWA/f9J1Io43gf+Y9wusA644j4R42+F/9sgIZ80tVM1mujUV69xDBXwchV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 16 Jan
 2024 14:50:56 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7181.022; Tue, 16 Jan 2024
 14:50:56 +0000
Date: Tue, 16 Jan 2024 08:50:51 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <2utfb2ntlzox27wcrqtdzoojj5r6idhkxjhbgur6wnlmh5qpb4@rtlje3o72eit>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
 <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
 <87mst7rri8.fsf@intel.com> <20240115205207.5b491e3e@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240115205207.5b491e3e@maurocar-mobl2>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM3PR11MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8828ee47-79e8-414b-aaa6-08dc16a28b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6yc0WMRuA099f88+84lO5ybY4PfSwl6eVADZHf4RqGnSOyiPqN74NaK8aIddxGYPnSQ5g8t3Hc+qVsUuyPpaUtjqMYn5Bv3nVuWbLC7I45NUMqq7VgVaXMVH+7If3t8MbnCjqqAnDqnlHvaI/t4rj4C/4rU6xXOqx/SFlzyCOuNa6UHLzvT3o2ObAwrtmHrotYfNHkEmAJpRzvFHy8T5M1xr2ELSdOI79vo+lFuFL3uLMpSdXl07Rj0Mp900t/0vv5K0kbSX2rLXblcGMbsg38MjNy3mpP6yNuwZ5GgaHNKSAad5myLFZb0jw5grOc106GJ2WYchAV0z5kHfghIKO26gXThKBZn6U6Jo8JnDEm/pP4Cla+SaZVxior6W1/1uYGcHlPFqRxDeWmOwoK7Kuv5pI/nSr4EPL6GVbOoJWB9a6sekznhOo774fxt7lOiuPNHuKdh61YhslT1iXDeFC+r/ZAdulxoX1R76EJ7DU+RuB0lAA/C2jCebH+2Ko0Zmud6wMt7mWMQXWqVpkf0J4QcUGGSfo+pW2byXSE89F/mdHc66SxgjFbvFuZ/mSEA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(346002)(39850400004)(366004)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6506007)(6666004)(478600001)(5660300002)(33716001)(86362001)(6512007)(9686003)(6486002)(66476007)(83380400001)(8936002)(6916009)(66946007)(53546011)(26005)(38100700002)(66556008)(316002)(41300700001)(82960400001)(8676002)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izk+jofmevzY/I1zxqWACoPJS9DQ7esZUpizj9Jwzpt4fAvAQcmm3LbQ94/T?=
 =?us-ascii?Q?G8jDt5hjE+gcxWXy2BpxjgKSi98hEPUllPchPI09jpYLOeQZUrBeNdrI+GQc?=
 =?us-ascii?Q?ErijqtLEsdktt3bB8Q4I9INOKdjbOyinip/kQ9iSIGezXiy7wMIoQJT49eKw?=
 =?us-ascii?Q?YIO95SSAtJ50yiaJsXah+QZpqNFlsIUZJq58Hm3K53xiZxDyNMOuUVAXHKO7?=
 =?us-ascii?Q?RTftW3qN9FTYEPtZAieJocsEWsnOi6+L3LTlG6UOr+kIYJ+so20MTE54OGlb?=
 =?us-ascii?Q?yhfKJZatSuYMT3LgqaoaQJRq3QRrigRDrAEM41hhHX2VDE4G3MziiVrxfDfi?=
 =?us-ascii?Q?Yp7Vkc53m8QyCv2XGBmOPgpXItnoizn82105IysHCaW66S3rp7V+RJuMkNzw?=
 =?us-ascii?Q?Bo82TB8ughPGujoGQM6LpvJhJtbDiz5EaHRKYB4VbQIbd49MmktZOgmW5YAM?=
 =?us-ascii?Q?Edlz9LYLD3IkPGWNlTpYBvVYRLQa2zMbWPfC7/Aagn3l5VyZLhE3Akal/KPZ?=
 =?us-ascii?Q?HZuBjBRL6cEi1nc3aaRxHjUkjkVRndnWkiPPSauSZ6tza8ReBtqUdqQ6Be/m?=
 =?us-ascii?Q?HxNF7u9Oatj6Vjfg9auJMM7N12EnllodImtWAOlbhrylFhyjBb8HytHSFB5k?=
 =?us-ascii?Q?FdFkmopKmLIr7fDsIKl11wY3Zav1F+OjLves1e6n6mmTnr8GKQ3hiQMV34yB?=
 =?us-ascii?Q?rNmwgEx5vK1Xa32MB47Kw2l1GL/MhDCepr2Y8W5hC79v8m1ar11HbT/akBaC?=
 =?us-ascii?Q?qEaQG6h9wgX3UuV0N9UaZlBOV7F+DRcZskReIhXtcD3a4wJ6/rfEBluN0qcP?=
 =?us-ascii?Q?4pcDsb8nAhgj0E+Qkk3V6zg+5zPlhVivu+nOrt4/ia1tfQzbi/WyKe2aIeUk?=
 =?us-ascii?Q?ju03OeIIlp5JY0W1NzearGeLd8QDibfMVUieZQNulDlxtxzt2V/OW/AHp89T?=
 =?us-ascii?Q?uY8BPXLBsuwUVypi3GPTbjuAeL9grx4cn1OiMszeOkrnzP0NR7gRQNsJK96t?=
 =?us-ascii?Q?GdaS8e9lHYIsAeKnNW1UJjRRM65L5zDxpuWrXnKCGy53qvkV0x+d4iE8LGQ5?=
 =?us-ascii?Q?DM6yPpQr54vtLPK2T4IbCjA5gV5Eh/OBxz5VmllMh9H0uH2uEWhjadii31P5?=
 =?us-ascii?Q?q6RcaYzOLMPqE9uPd9tVp2uwhwpq116gZKXnNsmwyB6oumiC6JhmCXIikzWt?=
 =?us-ascii?Q?QGvpvu16SlVHtjtsEo0vkUKjp2kKcTtJ5AI1laMWf2DsREGscYqb2RGIfYfX?=
 =?us-ascii?Q?exMzYPebkCh3ELldIfrX0y8pNdHFYZNl4vf1ETa7q8pJ/gZzuj92ICq3veMJ?=
 =?us-ascii?Q?rMFGzq0S9JKDpmj1i5QmNHLG8x09M6dSFcsVYKm1M1yjyf2xkYfKRvNVrjTg?=
 =?us-ascii?Q?PVtSB2KVtoN+9C/XGgW+3+jOWJYV0fYbuFMijL1jaq/ZUk1eTI9MU1nedkwd?=
 =?us-ascii?Q?DKfKGzFzRJ6cBBgQG6fO3ld4K2a1S79JigaCJ0wGSujuhTnI5TRNxpzZeL8N?=
 =?us-ascii?Q?XZgDA73PFGiPXiFA61yX7G5mB7XGYQbg/1+eF1YGyNoYhTGgGrxukJeW0k23?=
 =?us-ascii?Q?5GKuVa8uPHaGnoFbHQIeMJ4D1wVkW13WC17tGIzPb8PG7+kkzZPVMA0Oa1jn?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8828ee47-79e8-414b-aaa6-08dc16a28b4b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 14:50:55.9528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1r+BJV9VjrLG4SO3qcyn+bJjNRExNcX3wSs+pLtyPHhFtpsH6KnkXF0QIYWuqepqWCODST7ZsRD+2UEOlVltoThwIK31wRMhcO3/+WfB6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 08:52:07PM +0100, Mauro Carvalho Chehab wrote:
>On Mon, 15 Jan 2024 09:21:35 +0200
>Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> On Mon, 15 Jan 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
>> > On 1/12/24 15:29, Lucas De Marchi wrote:
>> >>> On such case, you should document kunit_debugfs at Documentation/ABI.
>> >>
>> >> debugfs is not part of ABI.
>> >
>> > That's arguable. Check Documentation/ABI and you'll see several debugfs
>> > nodes documented there.
>>
>> I guess you could argue documenting your debugfs under Documentation/ABI
>> makes it ABI, but I'd avoid doing that. Usually we use debugfs precisely
>> to avoid the burden of ABI and all the baggage that brings.
>
>Placing things at debugfs "precisely to avoid the burden of ABI and all
>the baggage that brings" sounds a bad practice to me, but you can ask
>others at LKML and see if this is a acceptable.
>
>My understanding is that, if userspace tools rely on what's there at
>debugfs, and a change break such tools, there is a high chance that
>such change will end being reverted - at best, it will surely provide
>some flame wars.
>
>I remember we had some troubles related to trace logic in the past,
>due to something similar: even not originally meant to provide a stable
>ABI, and being under debugfs, there were some changes breaking userspace
>which caused lots of discussions. Can't remember anymore if the changes
>were reverted or not, but at the end ftrace ABI was considered as stable.

ftrace provides a way for you to read the format of the tracepoint and
use it (API). If you did it otherwise and hardcoded the format (ABI),
you are on your own as tracepoints in the kernel keep changing.
Try grepping "tracepoint" in the last pull requests.

>I have an userspace program which depends on it (rasdaemon).

if there's a real tool that needs the info, then it should _not_ be in
debugfs.  I'm not sure what how kunit handles that, maybe ask them as
this is getting very off topic here.

Lucas De Marchi
