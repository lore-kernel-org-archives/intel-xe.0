Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D432C77B78
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 20:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA5110E094;
	Tue,  2 May 2023 20:41:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692710E094
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 20:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683060117; x=1714596117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=88TQKoVqxR1NQwwCKobUjwgyev8/JhiAJpIkM9NCto8=;
 b=YJq4WYVUNphCVlZ5THWGfGpw7l8Vhm04I9QR/jAdGk/4Hew6wIZxx8CT
 4gVbuRBcdwkwvbpuNmyZ3NcW0M42S9X23Yt5bbiH1aPBTzwG/N/mVSPWL
 K07I4OZ0UsBTpdCLKDVNlFydpTgxPzRvn/Mq0sdz6Uis6zsYxBitSjayv
 e5sztxVfFsuh7ZWzD3qnO373rMfO+2HI1F5zoFkSEkuWzfhsCku+pMYGW
 BgnjFCKKm4hgPg4Yu2FP+ZmksHtyGrzXgv3ltQi26ViZ255bSa/1k1tet
 IcpLcnDn5pQuceUmkNR+G4+6v1wIMkYdEBt0WQIfn43DjfLx7FOD9dR3k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348536873"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="348536873"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 13:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="699114845"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="699114845"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 02 May 2023 13:41:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 13:41:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 13:41:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 13:41:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrjoTimpW4mkz9wz/LDILXsCZfR5g5OYzdFVefAChOIG+BOAwzmHK+aptakdtGXCMt9M8XluVfYR8iAA/dsHi0oP1NbsfJNdZdYxmlFyVC6fYKbyLX0qmD0lkn+BzvVt/rFF3EDIGVbYROPkUlpVO2HEMkL5lqYmEEwo6XD99O27XXhXm9fTn/0+BBB+aECoXOyf71bYx5meS+fP0r7wfZwJEa3mAicF+WogJHuYRQVl1mQBActywFq1F62R9X4Wb36rHqHlcvjvf3W3bBiEe2J9O3ZAn89cYf3kgR7sFjR+89umDt4BnUTlxlxrkc6bUzuFml5Fmi5X+zJ5r7pDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu584C23tuJL+0nBe0S59laEn7ZE2+twxValhTChxjU=;
 b=krh+PbMcBD+JIF7gMSBpzLINSqyU9C+F2/ct03Ny8X1Zww7eNxTaABq5wlXeSVIT9An7+jfIqDQ/6bMvN3zxwkMXAHXL51jYJvc0KuwWCC8cYoW1s1tkyZny9Q2mVU9RMrlOXuKWZDxbt3/6XQvw2qtwr4J5uEGrLCWgdV4HyX4pNX9t7rosJYbvuwzvL9jag3KBy5mlmoIrSUJZ1QvpYOdgFWW2NSt6XcZuVJ7NkraQLxg4gbHMva8ijsgAbmLO/PcZAmaoszKt/ypMO/8Zb3fliuum0xvtKpyRAfVKclskExFevChY1SZ/3gKwFgeJ9yVaRJJl8fqsfKyUA7NJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 20:41:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 20:41:53 +0000
Date: Tue, 2 May 2023 13:41:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <3gkxq6mevi2ret75y2d6p2pp4m3ymnemouh3hq6goimjgm5gig@v2mjidrcmy3f>
X-Patchwork-Hint: comment
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <871qkxyz7g.fsf@intel.com>
 <SA1PR11MB70389B5E7E0207B638A90228B3659@SA1PR11MB7038.namprd11.prod.outlook.com>
 <87y1m713aq.fsf@intel.com> <ZFFrdfwZpTizsnCf@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFFrdfwZpTizsnCf@rdvivi-mobl4>
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 73486f32-e10c-46a6-296f-08db4b4da981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /JLMN5B1FwPrxnzdSp7SEM9csJDMKWBpWG/jMyCIM3bXCVPJfzLF1hMDUHfPSUYb7fWIDIgs6gG0TZ/MT5t0doOhTtoNiJAHlvXINUY3V4ZfmMdYCgKg0rV9r30WICnhB5cAKhjKcNPoshZSEUKRApobADPLuQsSDR9w88RPeBqyo1rW6bxpNv+3l6F7jAEUA/2Frg+x0PktzMFkf9yeFjic+uCueWmXXTe+rM2scf8LpPQWVTrgLmGspPJZvoF94cMzQmjN7WaSTR7CF+V012lpI756+c1Z2UoyjPu3xQTATmf7fnsi7G7e/bueHEGr1Va/4wGP0P3w3LIMGccv88JEwcboMZMSt3tnlq1Y+TdztfLJqYKLZs9jh/Jt5C0dvti/ajYabVMXEC8gja1sBGNj6KDXEn1iikkA9aR482pTyZxgOwlq4hwaGpihonbYnmAKHeWGWnePUpv5fQYu9TSEXIT8vOQaOAA77a6cR+kkWyH/35Sb2zWUuAQ3xutLZSl8IxRrYKjn4FVckQT5OgpuAGqhrm+GutoBym5avFchT4St/Igo71BhKB4csGyP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(33716001)(82960400001)(86362001)(38100700002)(6512007)(9686003)(186003)(26005)(83380400001)(6486002)(6506007)(478600001)(54906003)(4326008)(8936002)(66556008)(316002)(6916009)(41300700001)(66946007)(8676002)(66476007)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QAoEuDQLQBLG5J4uplpiQU/P4rxVJcftex7B2pYG7EklK8sRO38YpvHE4BSk?=
 =?us-ascii?Q?g9g6zBnTvVb+1Z4sMbobwSJs1dZavGbV2vykbUOHGXpH1QhSN854i3bbO7/H?=
 =?us-ascii?Q?OHj5sId3ZmMAImMoD+0rRCHdet037HNWaGCARrDILQ+vvXLg6pSUFNfjWes8?=
 =?us-ascii?Q?LpMkYsJWmOyQAVI8+NsorkVz51DzpRPFNVOquIU92EDt2/oaRHUNcCd7gUnt?=
 =?us-ascii?Q?VvDjqHIZ8vrQSzqlgAklpMz5fqnQU+WQvXgCZazASXY6mgrGzzMrMmtUTtoG?=
 =?us-ascii?Q?hNfMwqHMvBcUmEs/cwKH2yvsUZytgRgNiAowPO/Nm5izqJAZ9hqboy1V4Ffz?=
 =?us-ascii?Q?fuo29p7ChG9WP55Az9ScBgIMfe48yKHAbjUbB9XOfkOmR227o4LzYejiRXrB?=
 =?us-ascii?Q?YHUzpPVbmXIfemteEuLWDTOA9z25JHuIM/63CAIu8eSBaXWQCGxKuzH7PLJk?=
 =?us-ascii?Q?IRIlZJbaglVl9nRIlwI/PDGTIqcsVPgHdSoFBele+LZgWjJ6q0PaPGKpoU+z?=
 =?us-ascii?Q?R52j8R34xnHAgrhgB4TI5WplEgCH72zQFmhE+45TLc1tWgTFF/lzkQ89UMpb?=
 =?us-ascii?Q?Ii/k2T8182DRuPa2698tCo+snJIvZKA4lQlkOqttYyi3VXRWF3pK6ce4L8UE?=
 =?us-ascii?Q?dNTu6RGYckaY9dIb/ZVpYEehYP+ss+pifnoGxcx3kp+ktCCSBd2amNC5Cpue?=
 =?us-ascii?Q?88MgcjLfpKKZEbDOto8Y9epGCQMjBZug/1JXVr82EvUFSxb3igKLzPxvJgQn?=
 =?us-ascii?Q?oV1xAsJInh/jMpynAatrTM9EnU0ycstVSyYkxEXb/DJVksVcpt2RlIJoYCgp?=
 =?us-ascii?Q?Ji1O2D5GzTR+7dobSxbw7bfV3j7tLa0WS4pvvhXuCha8MXT4rc0RuIH2YHvy?=
 =?us-ascii?Q?cTKKEAF1MRMBILmEaHZ++VmHA/JDxe9VXsC3KQ0HB+gGg7bpIjjABlaVpe+n?=
 =?us-ascii?Q?wmNGTOQon2dDZmE8b/XMWj6iVut7pNtnu3Cq0BlLyFoDY3AlMmGLknprEiJu?=
 =?us-ascii?Q?CoaFtxUiL42h8xNkwgu+kpjh/NIT+nxWL7C7k/qDWXAhVlJwJJ2HHWpbTpSt?=
 =?us-ascii?Q?rGFJWIyg3/3sEl8igea6vCoiCB9ThdnVIO2NMCfmRDReBppB9rMUw4TI8JE9?=
 =?us-ascii?Q?kxk7TVZakLmSTMWKPsHJM5yhCo5Wgd6cEcPdqhZz2zTTVJPxLSUJ0Q6AKb7s?=
 =?us-ascii?Q?1iK23mo1b2MLpPEpbyoYRhe+9c7jGbGv4JDuyJX/vx14TuCp71IyNZqsCRxH?=
 =?us-ascii?Q?D5j+FTJJph0TjZ9muJsNRo1/da9Bv6KTudgLpzPKkqwsmL3xv6wE+95C7pUj?=
 =?us-ascii?Q?vmQt8zMFoZm6uvjxVyFYMw7ao2lQLbYR+EzzAuyAeGwgrbb/ReI0/PiyQ/M7?=
 =?us-ascii?Q?wE19CMocpZ5CZAJynzINuBOz44kRSvGR5MOosEQjz4NdmqBaXl9U2sv1MEx8?=
 =?us-ascii?Q?8qVtp8ReWn9GM+Q5Tw/nWWB8nfU7e9fnKP7E95B+wR4JcZkKA8q3Ooqt4C8L?=
 =?us-ascii?Q?Fp3lq6F7TQ7NGxWi2eMOMLJ5felDVNmGhY2lHfQ5OMyzpAMANaILiqqhbJjq?=
 =?us-ascii?Q?V+itfO17B/xIEmbakcu274sUsQJoWqIQE2pNI8HNcSrzLZLG40yh6wdImgaP?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73486f32-e10c-46a6-296f-08db4b4da981
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 20:41:53.4466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4baqCNHTLiQ/XqB7FLZOvzj6Cx4Rd+vWOyAono/OeEdjcOMWLvFqBDb3TSb0vNtI6xc5IhsS5jxkhtDB0bYeKpw6KgkX+oOCqt8tZNnXLRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
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
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 03:58:45PM -0400, Rodrigo Vivi wrote:
>On Tue, May 02, 2023 at 12:38:21PM +0300, Jani Nikula wrote:
>> On Wed, 26 Apr 2023, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:
>> > Hi Jani,
>> >
>> > Is recommendation to create new .h file for error related registers ?
>> > Can I go ahead with adding file xe_gt_error_regs.h (GT, SOC, GSC) which explicitly mentions registers related to error handling ?
>>
>> I don't know what the best grouping for this stuff would be. Maybe I'd
>> go for grouping by hardware blocks rather than functionality like
>> errors. Cc: Lucas, Matt, Rodrigo, just to pick a few names who might
>> have a better idea.
>
>I believe the right way is to group by the IP block and/or reset domain,
>rather than by functionality.
>
>But Lucas is probably the best one to guide us here. He has some ideas
>of tools to generate the regs we use from specs and the organization
>might be impacted.

what currently guides me when adding registers is the "Graphics Register
Address Map" from bspec. Example: 53616

Note that what we currently have comes mostly from i915 after a lot of
re-organization and changes to adhere to the coding style and
conventions. But the per-file split was kept as is from i915, which I
believe was done by Matt Roper.

My long term goal is to have a tool to generate these headers directly
from the spec, but I think we are far from it as there are more urgent
things to be done.  So:

1) Don't dump everything in xe_regs.h. Just by looking at the offsets
    you can have a good idea where they should be located
2) Don't dump to the end of the header. Sort registers by offset
3) Don't add registers/bitfields that are not used in the code.
    Preferably add them together with the code that uses them
4) Follow the coding style in these files, now that they are mostly
    clean.

Lucas De Marchi
