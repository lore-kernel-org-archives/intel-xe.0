Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E9C77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 05:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D55D10E9A0;
	Thu, 25 May 2023 05:11:46 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B6610E9A0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 05:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684991504; x=1716527504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H3vtfuXJGUlIRAWHyMq8lK5rbq8I7THHo7O7KRMf2XE=;
 b=naHpJ8l6aSHTL4JCa8O9NE6Y8I94PVM0n+/qz0ElwA60vvpeIGO8CoY/
 KIUz4C5wFZRP9Gr3VmAZMdb/eFLb2JXLxNnetvWepnN/f5mNlxXrnpOvX
 bYi1D6lrR1kBDCa1gnegHcdPSBzg418bRmeEX6Q++Es8iWmU0bad55ElM
 1pSSuYGgir93tiPco3BpqRahuDyDq0Dao7Z9PCeRyeul5zs1sBA5R9Nd4
 MJqRbAHwqqIRO7kW65EXi0tX1CVgUuB8S8btUq7xXrFsjBzqm+aaAyxbg
 Sriv7Wrpsw7dlDGo4/HAjzOrvkp1extpRzr90LXJOopyCT3jyR54Zl8xK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343254983"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343254983"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 22:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034828311"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="1034828311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2023 22:11:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 22:11:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 22:11:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 22:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPVRgK9xyjWQlJvSgEcNqLwM3T/rZX0wNDse+2kIfAcapjQDT+p2F2B1xvnol9JeXjMNx1x4SeNMEqRGC8DrW1bLvfv+jjfMWMBjRQLDIM4Zcw9USkHXUveM7+xVfIhSGP+PIdsuHJtLoZSQgRANnsecgRuZypPuuuhyfHppQC7Qn0oB5NHxI2utYLnvy+hIuymXae4YkHlf5hiYJGzuzDuLtjAU8JZ5qORE9ox87HCR3cLuACjt2fFfVv92ashV6N+EO8Payg0GNRGD6cCBPhs3CM6CX1vIL32otc3TpVwboCA/dGoWWnTce4eqtkIAIWDkxkv19wX2yHVXEGs1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YATi5hFvi9i2JBqWt89YuC6a425CP/wrddvok+lvP6g=;
 b=c4O1MtA9N0vVGRjjUp5R+QI2I95cTLEK+R34vDPex/TgMei9vglJE9L16/tpcN2l9zBMpLhT0SQY/6fm0msS2RrKD05bV1u925YWl/tNDXe/NIqtby6HOOElMuO7lirvJT+4sN1dgfNZnWBotMr4lhm+CoYDM0JObLDVFE1+gcxpT/3Oq/wsoIgnFEPoFo8/99On2JFcfmJb/kS/+kHyIHKHPPGNrvybCR5cvQ+j3j3JP6omO+m3bGDBd7o2DRjaaHIQbAxj2OA3rxY5/BY5hudRHS5sAv02sDJ/rl2w8Dp5prTL4RDZOmdF9JgcnsVGtRkTPS7SDsWuXTDwxOmPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 05:11:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 05:11:39 +0000
Date: Wed, 24 May 2023 22:11:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ze3ttqak4tk4pjg7jnyr4jfztvjvdvtjrl4gfuo5wc43drrgmi@2nhtta3fapor>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-6-lucas.demarchi@intel.com>
 <20230517175056.GR10045@mdroper-desk1.amr.corp.intel.com>
 <mxv4x3arjisvb77y3y4wkqqhr5zy4sy4d3fgc4m3ee7poanqlf@pvcesrduhroy>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <mxv4x3arjisvb77y3y4wkqqhr5zy4sy4d3fgc4m3ee7poanqlf@pvcesrduhroy>
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c5f774-1d58-4b27-ba06-08db5cde8547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1oppcbf6PYu/RhfEDZ0eZnIoyXGtL6autq0Yck9SWtjAyXC1tyZbO9aafp/rnEYaKG4lIOZQa1pE+HT9aaL+RWBQrUbzygfHH+cclkXV8c88NDWTcxv6Sf1qm9yGV11psM290ZcRVwzzEyNa/sYJGAtcgXeJI1VslmTFjoDN0eSkr86SVn9M3xHT+tfEolAHIt0PDaaBYfIfDVaxhH2KhnEy5BZSYIQTeMcts4xVtrRjlzp05UURtXz83hklfO/JpSjN4eOLlWc+4A+rQxhkuabf8PhG/F21+AIi8pK1H1wYnEgaH4S1NUtJoceShLyY8kwdP6cSGH47qC4kiPc732kFo881Yx5Cshaj/unp96yynXNENFRXq416mtnNycdKW4FY3JLe5IHvIUz2jN7+7Tmuuhkpth+Kw85a6y4D4DSwA1INTc1RbRCo8GCltYz2KInZoyKuM9u1rtvdvCwGt1P4VPnR6STDUjQaiATYlR2G9cZrDUlQwqRLkpR4LoKqUthAsaCQ+25EsBpfgFq2fFJkZR1yLJJAmmEe9U7/my7utT97/RVZTVflmnFfTvgt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(6512007)(26005)(186003)(6506007)(82960400001)(9686003)(107886003)(83380400001)(2906002)(6486002)(316002)(41300700001)(38100700002)(33716001)(478600001)(66476007)(66946007)(66556008)(6636002)(4326008)(86362001)(8936002)(8676002)(5660300002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJZ9/0RGcQ645ue/5qHfWrrb1N5G6qjuZtMVYAJhMm+4HpJIakX0qJEefokI?=
 =?us-ascii?Q?8+u6RCFtWvHp0yDb6Tug1mpjmNzeYlcCv8e2rqeOuZkFxCDZcaCFN3/oBfUy?=
 =?us-ascii?Q?w+EcYkmJsu9lEn3JYpHkqNouUSFZuEhjxXqQsoYEfzwFMZGFXnPpxgFMsmCN?=
 =?us-ascii?Q?igaWf5R9+GDzEbJ3+LGB4kk+kydVCji143II5GeYq+D6w9D+iQ0eXuvXSbDO?=
 =?us-ascii?Q?AjV4wxF5EEzl3Tjksp66TRvoN2COEtu6KS7166+X7/+vPNvWwbTW2VpfdfOW?=
 =?us-ascii?Q?jKqr9n/mML8MRHrFIrEYOt2kQNqpl4HqQfUTt5f+7hSj2q2xa0lDey3U8i5A?=
 =?us-ascii?Q?lnd5RyFvpVKpiv1niK6UQMzjgJMSCf+McWcj6eXakxoFPY6Fua4UHVLxEIuW?=
 =?us-ascii?Q?B1Tu+RvX/i2q9iwEPr8VvHRLc+lobAeTjymIIGmMK2hnUqWYXtl+Y0nY3h02?=
 =?us-ascii?Q?pBW2S7adjP2i3ASL3wXnjl1l9DFNwmM2oypt7ABW586CKZAAeuhw8mpq3VVP?=
 =?us-ascii?Q?6YJy0UkSMSCopEzSC2qjjhMcH3APAjO9QauY6o414rPlxJvEmPGn+0GFnfnb?=
 =?us-ascii?Q?vtJdkjBQo05aKsQGjCjQAjewVpvYcBrki/RER6ZRsiBhSInPQKGSZSjlQsdF?=
 =?us-ascii?Q?k4uzhFO5SlkOm9RlIVXQ5x0YOrT7piFRnNr/AqhBg1BR4XXKOVvoKGqb9+qf?=
 =?us-ascii?Q?zLkBkSCyk10OEGZ3giQsxytycn6oJfpeYc8CB4ljmFiT5Z1NesOv8D4dh60X?=
 =?us-ascii?Q?R2k5AiKfsOf5U/MOeKTFLEjM4wvsw8CcFglY+vkyYnIpjMWUyEii1DU30Z/m?=
 =?us-ascii?Q?HJ9ZVnS9Qy+9po/avNvdgjI0xIEglD7OnTZ/qjIwGORVXZtE+k5yYm6wspqV?=
 =?us-ascii?Q?65hq2hZr04EY9zm/vCbkVHu/1Q3ewkn2xsQ7MjBrzZVzEfLiHkt9DbF3SjWZ?=
 =?us-ascii?Q?Q4Ba2D5iwLh5VwwLootBLLVRBrkkyeuWCZIhbTjyhowwwbSMtKV2yVmVmf9H?=
 =?us-ascii?Q?EELLrhemPOPhT4EVdrjtA0Dg8ku7PL5uurnKegCC6dc70swUjXNk/iaL6d2S?=
 =?us-ascii?Q?2gTTi+RRD2cBYkzUuMaIYJtX8VoysuaGP7BHyFDEFfCFHCPZ/ETg+s7cZpSw?=
 =?us-ascii?Q?h+2+A7rackvs3vcK6HTjdmmIEBU2oMS+WKEP1264nwYkrceiw2RqWXHKH+b3?=
 =?us-ascii?Q?h9Dt0biKTVSXZEiZUaD1Pg9X72AK4FdM+7Vh5MPYAJ3PCAJDB6Tw64vEsuh9?=
 =?us-ascii?Q?M4WVFU7TJZHgmoaYiFfEbxBbCsydzAux9MKi/uuwDQMGoKmv5+6DDm84dPOz?=
 =?us-ascii?Q?+OZHaHP+fOoPKg4Ib/eT9bDdYRKBtGv5rcwRj8cq4z2J+uf7Igg9/uXjcgIY?=
 =?us-ascii?Q?n1Co/stuNDr83gMs7Sul8iz9lkqsDYkeXylgIewzJMudLXiqUYy92ncGR0d6?=
 =?us-ascii?Q?IXQEwMDFMxPypGG+7+G/XpCIiPU9mbbxhpkL2fTZH2mhlrLAubVqCIqBD5VK?=
 =?us-ascii?Q?mBV01h+OnNvDobhbE21tkd2hlGYB2yypUM3HcVL+BeN5LswjL09uxewmb/Rl?=
 =?us-ascii?Q?Vq6ddpInY9phiqxgjBaVWuAPZQ7LbzvVLnvRRQ6GQLklaX7bpwP/kf9EY4gQ?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c5f774-1d58-4b27-ba06-08db5cde8547
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 05:11:39.3870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fiE/5k2h1Vcn3aEF9CUkLdIaUv0bNk3bGxgcRMDlNNL3S9xOPcxWh/RqzoV8gFmyUfbg/f4lt9aIJUlL+UTkBwAYa+ICg4y4G5AoqtYCQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 5/9] drm/xe/wa: Track gt/engine/lrc active
 workarounds
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 01:23:19PM -0700, Lucas De Marchi wrote:
>On Wed, May 17, 2023 at 10:50:56AM -0700, Matt Roper wrote:
>>On Tue, May 16, 2023 at 03:19:46PM -0700, Lucas De Marchi wrote:
>>>Allocate the data to track workarounds on the device, and pass that to
>>>RTP so the active workarounds are enabled. For later reporting purposes,
>>>there's no need to differentiate the engine or gt in which the
>>>workaround got enabled, so just use a per-device bitmap.
>>
>>Going forward are we going to want to track these on a per-device or a
>>per-GT basis?  The workaround database has switched to associating
>>workarounds with the IP block rather than the platform since sometimes
>>they're needed by both the graphics and media IP, other times they're
>>only needed on one.
>>
>>For example, consider a couple different MTL workarounds:
>>* Wa_14018575942 -- applies to both graphics and media GT
>>* Wa_14015795083 -- applies to graphics GT but not media
>>* Wa_14016790560 -- applies to media GT but not graphics
>>
>>As we get more post-MTL platforms where these chips may get mixed and
>>matched into other platforms, I think it will be important to recognize
>>not only whether the workaround is active somewhere on the platform, but
>>exactly which GT(s) it's active on.
>
>My idea was that for tracking purposes the device-level is sufficient as
>I understand this would be more useful for knowing "is WA X
>implemented and active?" rather than if the action it takes, applying
>only to media or graphics GT, is correct. For the latter, we should
>really be checking the register-save-restore in debugfs to know if the
>bits are being applied correctly where they need to be applied
>(and for OOB workarounds  to check whatever the thing the code is doing
>in that code path)
>
>
>I may be wrong here though... need to think a little bit more or more
>time to be convinced otherwise. The change would be relatively easy, so
>may be worth doing:
>
>1) allocate bitmap per gt/engine besides the global device one
>2) run the rules together with the gt creation
>3) when reporting in debugfs optionally apply a bitmap_or() for the
>   summary view, producing the same result we have today in addition to
>   the drill down

on v4 I'm moving the WAs to be tracked per GT as per above.

Lucas De Marchi
