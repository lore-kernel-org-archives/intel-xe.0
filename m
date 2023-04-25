Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC3BC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 09:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A342C10E6E5;
	Tue, 25 Apr 2023 09:28:38 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303E110E6E5
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682414916; x=1713950916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HGMPQfhXaqTxyRO7+xd0DQ3Koq8Tpdl3bNazw3oKks8=;
 b=NWWJTYaDIZ8l6zwcR/gy/zOrFo29YYNXcjnlHJKLFTw4Il9tczpwG2cY
 7hqb15otMtvSbeLG73LLG8gNLRdXGQSE1xAyEX7UNhZSHCh7ZfyQm6avy
 sIK9bcFRg9RuAoeBEZV8Nl/7iy/1AOm5fnOfgRHgCIQxcOwyiJo1edpGT
 IckNLv+IwGXYU2sf3uXqNOMypFZH0EJMhQ3YieQzbQlYSw9ru4l4SG4J4
 lMxYprhbjlI039GhYIc0cqQYKNajL1yVkNDf4Om0NADbZ79wLuNLIjCx1
 q9nI9ZGNzIfGRZwBFqYczFNaeYXrai36bto2X2wkXMQS3pKx9y0QNWrBx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="346731686"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="346731686"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867827231"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="867827231"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 25 Apr 2023 02:28:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 02:28:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 02:28:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 02:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqrr/ESbYP3ksCAV6uN8AGJwPYGwc8T3Ub/N675wRESrBCWrPl+oi4JvKamnUHf5Xyaw4u6SDnHdskBZzlijR9RUO+aMuV396bb57kPz9ZcX7P3FtjBsRtrtuiOyN57n73I6rGl7s+KLJ9rMkE0qu+QKgq7PXX5+6y1eYRVPveBFvWQvrsMAPWBAqaHP+ODeV8weNdVifPJiKBvTXPgwv6rTJdsXjvgKsS/pUwSI3IK/aPAIL9xvggE6oQI/7H5Qp7PPgW8M8XyqpHqhAaixAFj5LMJsPb1VDheSa+8cQralH3RDPKwlWAX9wnC1aFiFwJXqSHKpSDQNZvyTGL8phA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSQxGdg8XI+7E5ic90eDbkI6Gs44RUgAY8qeymFOebY=;
 b=TNg7rvaC1dO1bu4zGVJHb90jVZYn8NlcLMZgS1PizqETQY/0ue09wmP+GE8Vl8Op6EfrySNOn0Q7Ifl2z0wOWdLmBBPzNWUQVCq01Oe8Y7uJlhSFmPL8H7sEq0H3BZ2NP4AW2ZuVHonHGVePcJek7JMszYkxiJ899w54XRpIGre4nODHc1LcwJ5FR8iJSoCHqBgOJF1wgHcyp6g/ElQDUY/iTdR6ewVbFvG6M0reKMp8ydqA+kTqkja7qwa/sEUaJ4treI6HBCXvn9hn9omvjgQT0Ln2JTaj9xDdBrqIKkbc2loqOw5OVKExcsAk/gcr+r9zBs8ucl4f50ZYk6PGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.34; Tue, 25 Apr 2023 09:28:33 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::a9bf:176e:3858:c1c1]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::a9bf:176e:3858:c1c1%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 09:28:32 +0000
Date: Tue, 25 Apr 2023 14:58:22 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZEedNrn7vaQmlSYL@bvivekan-mobl>
References: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
 <CAM0jSHO_-1KAs-rOBxaaq0hN7B2octzeN3XcGHrWoRbOYMuo6Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAM0jSHO_-1KAs-rOBxaaq0hN7B2octzeN3XcGHrWoRbOYMuo6Q@mail.gmail.com>
X-ClientProxiedBy: PN2PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::15) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e29e92e-976b-4cc8-1436-08db456f6f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xd3gOr+AVP7Z6QXJ5oqAh8Q2Ruj+5DEmio8n+wdkfm38aMvNc09V15cVZt2/k3qFvxDhifdfvPnUJeWv5MTI9H89OF5Zo4cpSG/vOHK/z9Qsu23uiXkXV3cJ86bzaW7SJYhX8E9CNb6L93WdIeatkli6ppTA/G2UGb8HkptAUwXq72IEDedM3nu1BdZwtA+rnUR/5X0mgEkZR2gRo4QEUxoLHEKfGbthRv3JjMKdTzR5b9RF4cVcRFwW6UeBy1XPbZ8oi86uL7NWUAV67GzHr8NUa+EEVhd81c+DyAgynkMc+/ddofcNk0JmyDm4GBOFSdX73dqkjpzBT6SR6uRdfra80HSQnOxGtKo+65eNuxhC8RvWEKdLKKzOnEXziAUX63l6q8txUaaTEEVqY8m29hByWWQUku+ElTgZ03zp9e2VdkD9Mr0POwtb8I04EeyPKhvWbmF2Zd22RbrKAGNkRHLilsFQEfoHEJaOGHtOnShfuqdFi09/Ab44AYmmEf6AcM9ibZG/UDBPS2x5QgTeQ1rpL11RxV/iChRONsKdwW4DgLWtwCnLZFcyArIWH5q4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(6506007)(6512007)(478600001)(9686003)(26005)(53546011)(83380400001)(41300700001)(316002)(5660300002)(186003)(38100700002)(2906002)(66946007)(66556008)(82960400001)(6916009)(4326008)(66476007)(33716001)(6666004)(6486002)(86362001)(8936002)(44832011)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklJUXFuZFZkYmttMWdWWjI5QXV6clBQdVpvRFJDSm9FeWlPTnR3MXUycGwv?=
 =?utf-8?B?TUxlQngvcjBSZjUyaCtCTWZlUFh6TC9hSUtXZEhiZlZjTHVTM0VtcXBNbUJC?=
 =?utf-8?B?RmhuVjFqOC9CUUlzWUZrdHFVWEJ1SFZDeWwzQ0s3MHVGNW4xdS9PWXJqRnpN?=
 =?utf-8?B?dFRjSEZycEtMYVhOMFNnd0lZdEVqaTJzT1VnZXpFWmxrRjFYZ29LdFNsS1di?=
 =?utf-8?B?OENDZUtSeVdKSWR4TTlRR0JpT040WkVNNzZHVzdKa0pzLy9LeVBPdkdtclBB?=
 =?utf-8?B?dHFEZjJqQW9YaGZ4QnZrM25yTmxud0ZWVEpFTWdOMU1ONnhhVWgxSVlVUzMx?=
 =?utf-8?B?c1VFM213L3FibWtjbzQxQWlrdHU3NGcwQXJ5L3R6TU9GejR5amVZejEyZ0E0?=
 =?utf-8?B?TTdoNHV0QnJTUDI4RG53V2pwL3ozQVBuSTE1RHVtd0o1TmNadG1RMG01alZC?=
 =?utf-8?B?em1sb0QvNTRmcUtzYndIVitGSFNBay9WZVl1VjU0VDdZMEpSRmViRk05WVBD?=
 =?utf-8?B?cFo5WkJJZ3p4R3QwRzhHcFZWT0hLSlBjUmdPWEFpTGg4bFJMZE85cnZlR0cz?=
 =?utf-8?B?UUxFRGk4bTQ5UFppV3ZMcHI4enVmanBKUTMrQk1INUVqek80dHBSamlTWnF1?=
 =?utf-8?B?UC85eFVMczBCa2R5d09sVGZtK3hsSWlybkIwSEZtdDZ2NnZnb2xlMVRnUkJ6?=
 =?utf-8?B?ZzFobGVTT0t2NEpoRUlBdW4vbWw4eW1Ydys5dVlENExHcXFiRGVxRllDUVZV?=
 =?utf-8?B?aUZESGY3QWYyQkZlM08wMExaSTE3eHUyNi91aG9PSEp2VllTbGdGZVN5enhr?=
 =?utf-8?B?em11a3NSOFNHbDVsY0lZWlB0TmRLd00vOHMxbVc5ZzJQYkNmRUNRMFNWOCta?=
 =?utf-8?B?WVhjb01JdUFGMndGY285OGNQZlRSOVZ6MkovUVo4NW1wVmtXeEFmYjg1UHU2?=
 =?utf-8?B?M3JoMU1sYUg4ek4wVlc1WlptZkdyKzNrTFpDVXBwNDZ3SjlsT1Q3SnJwcTM5?=
 =?utf-8?B?RElzYzdJd1I2YWFDWjhEVG9iYXo4bUhsWVllRnBWZDAzKzRPQ1E5d0JVWERD?=
 =?utf-8?B?YkJRVGdMREROa3lnM1B1ZkNCM3pXUE9wd2x2Z2lPNkM5MXdvVUJqTDFZQUJ5?=
 =?utf-8?B?TzZLV0w2ZU9haTVWdFp6c3ZGRGkveS9BWXBYVitvbW02SFp5ZE51RnlZR3Bi?=
 =?utf-8?B?cXNBNEswSXFsNlZJZmZkQTdDa3cxb1dzcnVPTUYzT2JQaXpaZktsK0FrOVpH?=
 =?utf-8?B?K0JrQjNBekx1b0l3Q1hEeDFnZWYzQ1lDVUFKR05qSllWUzFwYTVUUXJJQTJw?=
 =?utf-8?B?ME9GZWx5M2FWRTR0aU1wTG1GQkpCQlRZQnFybmJsYk5PVkdEenhFbDM1UHk2?=
 =?utf-8?B?TkxCWFYzKzIwL083elprajBJaFlWZCtFTGZpWS85VWtuODNzUVhndGNOQWZz?=
 =?utf-8?B?M0Y1YUZNQ0lObG5IR0tabzJMa3B0M1Q0MVduZ0wxZzlpemR3WU1ZMjNtN09i?=
 =?utf-8?B?K1daL2UwVDNENkh1QlZUTERVcUVBSFlXMkQ3Nmc0Y3h6MWE5UUYrQWZHYXdj?=
 =?utf-8?B?T1pwZTN6aXBJSDQ0RmpWTXk5SVh6M0M5K1M1Ykt3SXpOMVc1OGpRWGJaeThh?=
 =?utf-8?B?b09uWUNDeTRQY2lZai9Cb203UUp2MG1UVkFTM1VtQjNIS2JINGhKQUh6YlM1?=
 =?utf-8?B?aTdzMTQxY1FaRWhuZ0VVSmN1aFJSR0VhUlEvM0FWSWFZaC84UnVNLy96VE9T?=
 =?utf-8?B?clM5clVmdkpDYytnc2YxazJSSlF6VTkwTXYwR0FBTHVlYWthVEZ3TXdBRE95?=
 =?utf-8?B?Slk3dXZrYVQ2RE1uWHNGL2NxY29KRU9JYldWdUhwVUo3RzhvMGNSekYyUFFG?=
 =?utf-8?B?KzZqZnRnOVFiOCswdGt3TzI0c0p3UWtRdGN2WjlFZ2c2QWovaFZUUHZtTkM3?=
 =?utf-8?B?MWtyZU4vZzVOMGFYL09oL2Z6YlBwOEEzajd4SjFabm80NE9ad1hVN09wdmo0?=
 =?utf-8?B?NktIS3V2azhoZFlTdEFnYmJ5dzAxYzJITldHbElZc2FBTWpGdDV0NVN2cnVC?=
 =?utf-8?B?Qm03MWJ3ZmpNZjVjaGo0Z2RlMTJ4dVdzRSs3bUE2d0RQcWdqNCttMnFXYVFt?=
 =?utf-8?B?RkEweEw0OWhVNWdCMElXeHZiV21UUXBLZ1FRc2dGVkVUdnFtWnB5eXRWSG1x?=
 =?utf-8?Q?4pl8jNNl2I5YpLza9+Vcp8I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e29e92e-976b-4cc8-1436-08db456f6f3f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 09:28:31.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oOqx6BvI6DBWbO9qGtc3JtEvKPp3h3x/VCX0F9MxAGP4C6F3IZ+mauAJOqW8C+pe+5z95rmU76WaoLKS/1rDz4+lp0PKOkHQ/qduUl9PzK9DU6r4zZn/eiCpN+VhZkk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Keep all resize bar related
 prints inside xe_resize_vram_bar
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

On 21.04.2023 17:31, Matthew Auld wrote:
> On Fri, 21 Apr 2023 at 16:39, Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com> wrote:
> >
> > xe_resize_vram_bar() function is already printing the status of bar
> > resizing. It has prints covering both success and failure.
> > There is no need of additional prints in the caller which were not so
> > easily to follow.
> >
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 98357c1f109f..8bd39c3e65ae 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -107,6 +107,8 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> >                         return 0;
> >         }
> >
> > +       drm_info(&xe->drm, "Resizing bar from %llu -> %llu\n", current_size, rebar_size);
> 
> Maybe convert to MiB and print the unit?
Will change in the new revision.
> 
> > +
> >         while (root->parent)
> >                 root = root->parent;
> >
> > @@ -117,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> >         }
> >
> >         if (!root_res) {
> > -               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
> > +               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> >                 return -1;
> >         }
> >
> > @@ -183,7 +185,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >         u64 vram_size;
> >         u64 original_size;
> >         u64 usable_size;
> > -       int resize_result, err;
> > +       int err;
> >
> >         if (!IS_DGFX(xe)) {
> >                 xe->mem.vram.mapping = 0;
> > @@ -212,7 +214,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >         if (err)
> >                 return err;
> >
> > -       resize_result = xe_resize_vram_bar(xe, vram_size);
> > +       xe_resize_vram_bar(xe, vram_size);
> >         xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> >         xe->mem.vram.io_size = min(usable_size,
> >                                    pci_resource_len(pdev, GEN12_LMEM_BAR));
> > @@ -221,13 +223,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >         if (!xe->mem.vram.size)
> >                 return -EIO;
> >
> > -       if (resize_result > 0)
> > -               drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
> > -                        (u64)original_size >> 20,
> > -                        (u64)xe->mem.vram.io_size >> 20);
> > -       else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
> > -               drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
> > -                        (u64)xe->mem.vram.size >> 20);
> 
> Should we then update the _resize_bar() fail message to include this
> information?
This messsage is included in the print when resize fails.

Regards,
Bala
> 
> >         if (usable_size > xe->mem.vram.io_size)
> >                 drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
> >                          usable_size, xe->mem.vram.io_size);
> > --
> > 2.34.1
> >
