Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53479C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 17:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA6610E0A2;
	Thu, 11 May 2023 17:12:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB9E10E0A2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683825165; x=1715361165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vMAKYQcaMYas45oFUxgizIXDbezoQLXUnRPUVRTsBuo=;
 b=W5K9XdRfn+sqdeiO3aP/lba2fEg5buW74ZhzFid05vmulGnwx6Myr7Wy
 rxmB8nt6aKWb7Ce4FFayQ49ZFxiyJxAjBb40TRiepApX6UD2O1e3SKxkV
 5SQk2E0iDVYTNweYPWZEA5BZelBkW8eLFsP0IJ667gzn0sAk4kWSx/1eH
 fU+Dy7irEp+CAVrdx9qkTcrSRnzdfpZJ0+9wcweLE4K7IwXOj+gBtBgmr
 2VUYhOyAjhQs5nT98+Zb+dqFMK9FVdV1W7KOKGPxl3GjbMVobVmuqHMVL
 WlRMjjIAt5AS1p0HR/SNUEgAwv97vs5tAa/jLdZsRvpx6N2ClOTEZVcQc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="436902213"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="436902213"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 10:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874046925"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="874046925"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 11 May 2023 10:12:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 10:12:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 10:12:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 10:12:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 10:12:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFvHiaoV+rFckhv0eYgKkCCP5tIEfWt5c+8UAPqZRATW4IMGaGiX67Q2pAfRACLmAUFritCb6rL6TVBYz1Elo/QdRw8jugpE406H1uU0bHa0szeAPp9JrRtlc79blmynnrUVmNR9bZhPowt3Io7U8oUsZFWUzEAo9p4OUk6CHGUXIB7k0hIAxrneTGYrWmg+k7TTm0bzt8wy0e7wpdF+y+vc3dsjK+VDWJZ8mc4JSLED9wdf9vd1ErudC06WO7ud2y5HOJ3JB6ChZGsXmIRid5qpAjgBT4TghSrKBJKWlk3G/vCqOvhGEdiFFC5nxTxqD3ihpr+9nnPHIP0o2CyeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMAKYQcaMYas45oFUxgizIXDbezoQLXUnRPUVRTsBuo=;
 b=gUA1NKQzcysCx3QLH8rzaFZT6S2N62KI2Pe+mdckCwPeOsuacFXR7KYW2Yehkmbd6gOKYMNRKK9V68YlUgutuiWVZNEWLGqN4LSmj9J0u2cV6NqAA/aK4ULREvbQuV6Yh09gEi3JcYfYacHZ6SsBUtxbWQPP87eyVwkusAH+h7jqiRtu7QVzYNIrP2UTDKwct1DehPV2D0qb51ZXkeSzTsmKYNAXU/Bi1WOkVjzqmpE62AMZklMnz1PoV8wFqnZgoiQj6TjlA74gYSzyxqZgjkN5CxkkU6TZwQQpVsgj1VCDo2pXn+bzBnFDv+JA5Mr+VDrpkCrGwaukFsKifxTK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5626.namprd11.prod.outlook.com (2603:10b6:510:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 17:12:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 17:12:41 +0000
Date: Thu, 11 May 2023 10:12:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <cj6yaewo3b4f536tiblkyvkiluud4e2ddpojuasteae2x6ndjg@pl6ooxagmrgy>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
 <87cz36lw4p.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cz36lw4p.fsf@intel.com>
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: dd13da8e-0b56-4c32-0a1a-08db5242ed93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46UJOg1srV5AT7tkyTRKS/lzkPVpeoXuKHEPu0SZxubYKC3D0UMXfiTjE9CpbinYf7xF9DUgOooWe0sMmTvWnXGv8vbB0qiqZs7RKUTQ8g9FQNaGlJr/aK6ecl2Enw/ZIVZHbrcI6KmZRsGGT1WsQs9mFIUKgnDwBE/8XqDOBcICQs+blpYh+1E0yVF6enydf3S9hawB/M1/+WVobHUmifSXUPXllfb0aiCDEkicZEMsWgF4t2BLBJ4ZPOpJNWwfHn6rjdWODkzR8Yr4XydiAJ5fb3NZsTX5j6HGO9AJsHEQY7CAm+WrQRbXhWiAIyVPO098Yvn0iRCLnAdaE8QCDnrrRub907J0VvgiymglNXsYANhV/qvsTkwU3Nfn9LOc3rcgN+Y3anYnihuJOnIPpDlyjQkhbU8a/Caf+auUQFgSrddkhdGkUOiMM9quR/Ud7n4ppx4D3DiL5lnVnjFl0+nHGaj/U+ZJhiQt/x5uuiUYi/tKTIS7FGXpzi/aPlWjIuLS3ijovzPp4p/e9lCDdeVGOrQzq8y5My/vPj5MqIsRSlEsdIGFcJSJ8msRIMHz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(8676002)(5660300002)(41300700001)(86362001)(8936002)(83380400001)(6486002)(6512007)(33716001)(6506007)(9686003)(26005)(186003)(38100700002)(478600001)(6666004)(54906003)(66946007)(82960400001)(316002)(2906002)(4326008)(66556008)(6916009)(66476007)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hgOHdJbNzuG1gPeJ+7wOrNl0YzYIBYQXUtIuayb2NuB924IPKSeEPAvstnoB?=
 =?us-ascii?Q?FM9QEfbJyLciz3ds9E4ek4KdaN0romfv+cOSGeEA4LZCFkKkXLlirxstk5l5?=
 =?us-ascii?Q?hlAkYngN4O0ToKdLVMMBSlS0WJNoCTVPRNIXuJQbmugV3Dxz+eUdtR3zgSU6?=
 =?us-ascii?Q?ARBweDPLo0juVmu4nxd8c/VNKtfGwJ/Hq5fKaV5s7F6MJhEqw80TqedcpVkI?=
 =?us-ascii?Q?pltly6vie/Rx8rhGRvIAOy4tzpCkeDL+zb6RVkNK3ZmOw1St78V/zgAAylWf?=
 =?us-ascii?Q?nX28CXZHHeZoKEXGe5d2LuLlp2Grvfxq3tf9dgB8VmeGkZNTMCmWI66TMdWS?=
 =?us-ascii?Q?EV1qeigc2YzxM7VRfrA0iBv/Yx3gUTTnROXYJEr9kTEdVBCN3JplD3aLPzhI?=
 =?us-ascii?Q?OzlcStS7y4Z6dcn6/olUh9bGJIqWOsZ7aCvUDHTGIhvmkNrVTHjxFq5e+oEv?=
 =?us-ascii?Q?8BeOJTIbhC537vDzP1hHLso3Ty0otA3wNwZjSGKyetSsjiDJKnHSIi5oigs7?=
 =?us-ascii?Q?V+e6KgWDrGYs6CWJGn+FNvl8VEotioaZ4y4ToSsv0PYyCDM/6N3MvQXTi+Df?=
 =?us-ascii?Q?bzdUZqtTwhCLV64pkUyJ7Bc4z0x+dwH/FFT3eT8DHfED7KwJkBvsYKb0vvig?=
 =?us-ascii?Q?rPNihfkrr67kPNNrBNy+w8DWvO3GqYp7zR/dxXy72YC5Y8UPlApUCjL99yZY?=
 =?us-ascii?Q?8wgoqJht59LEekG+Lyhue34/MmLxls2fRlgM1p1JMziBnMghl3UwiTZSryem?=
 =?us-ascii?Q?F14lPE5g0tB3MwFfQ+7xQFH4vjI1lahI3Yv08HlqwWn8yUrdZyQOnkb/V6Fj?=
 =?us-ascii?Q?hQOI1+ibiTBVPm295EZyL8/afHsF0SuAYWZnmp/DB6OT1G6yY9vu3AK37lV/?=
 =?us-ascii?Q?QEpjI20Eg9N38VZ4nbEulxDZ4eusnN1EAlDxXhuA1O3j7+wte9lvffKPyAmw?=
 =?us-ascii?Q?HVpdhvJ8WEkUx1PfwOhNe6OlGTbYPVTPrUpk4dDM3YU4g7E2RUzQM8V7g8Ck?=
 =?us-ascii?Q?OjE4ivG0TmORnw1/0L/FJK2x7bMYRCGvyIm0qzgpIYnJL0Wt3olFVZxxJgsZ?=
 =?us-ascii?Q?fFvbSKdj0LO2qUsHhmeirOyYWttbu/vwDbEfD99gtbOOTrnt/EXDOvKhV+WQ?=
 =?us-ascii?Q?onJ4aZCTiTQi4mZcCjIS8QpTGcH80nep302UPH1FIFNe6lDrZ0E75X6aoGZ4?=
 =?us-ascii?Q?6trNwvDt/CH9PYWGyvySvFEK482ntaZzHXgVO0/1ybR6mxtZDejfIJuWs/4j?=
 =?us-ascii?Q?v8csooZ+TU21LVIAIi/lMU+JBCX4OuD5r4wCwgtTuhkuVmt8qm8ptzFAfAI8?=
 =?us-ascii?Q?KHs1QtEbwiy1285rZwxcNJ+PY/e8bZLL3cJZHZGgdlewC2Jq+T/qXlmef5Qb?=
 =?us-ascii?Q?EH506uyqoxicZxhpck4kbgebv/7Iw07sngO4xvv0xQ6oZiPCASVJTObaWSE8?=
 =?us-ascii?Q?dwyCsaiq8MXAv57ZViyqI14xms8jH48BgOa090xryyDMqdIkacuKmZoio2Di?=
 =?us-ascii?Q?qzi0HNXb5F8G+x6cWRM5tB7G6UCF0K9Kc3Auss7+kNobj67KC87saRHWD/PX?=
 =?us-ascii?Q?VgK+IOQuFSj+2gOTYBqdXIJ4n9DH8LCt2+1480huK3gkt+L80Tmhq8CwvsuI?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd13da8e-0b56-4c32-0a1a-08db5242ed93
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 17:12:41.1696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGWf2euOfddxn7dvatxOlj23Zlcc0+VsPlUwjNgRh6ifVA3jWHkjRjIQGmqGDprUJ2B6ZAYUxdlhlS8tpT01Eq//mLzAmKYhgh5tnFeTce4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5626
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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

On Thu, May 11, 2023 at 06:34:46PM +0300, Jani Nikula wrote:
>On Thu, 11 May 2023, "Souza, Jose" <jose.souza@intel.com> wrote:
>> On Wed, 2023-05-10 at 12:54 -0700, Lucas De Marchi wrote:
>>> Stop the dance of enabling the display-related driver_features to later
>>> disable them on display info init if the platform doesn't have display
>>> IP. Besides being needless work, it wasn't covering the ATS-M case that
>>> is the same platform as DG2, but without display.
>>
>> Xe should set pipe_mask = 0 and call i915 functions that will handle no display cases.
>> Also intel_device_info_runtime_init() needs to be called earlier, as pipes could be fused off and there is a case for discrete platforms with display
>>>= 14 that can have display fused off too.
>
>Agreed, seems like this duplicates HAS_DISPLAY() which operates on
>pipe_mask, and takes fusing into account.

see reply to Jose. They are different things.

Lucas De Marchi
