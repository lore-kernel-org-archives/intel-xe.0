Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42F5CA5501
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 07:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9BD10E476;
	Wed, 13 Sep 2023 07:55:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC9710E475
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694591725; x=1726127725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G5YKrWJsE9Ci2CKCWiF0Mzdz99ciY2u+B9ApDNxhqfk=;
 b=fNOvLPDnypm/aC39aPAcMPeJNKIgt8S6l2IESR8KMFBsnV4MLQ/jnKq3
 uZzmYaZVnl1dxIWWVDIjnuWZLCfpcqK3VEhDMID2sD5wtPyJjD6p7nJzy
 TlfS89F8uqHf2XlOkTY4Y3i0WkIFyk8EYwr2r7YMz9nOKFv0VDfYr/UqH
 rcZQKBiu8UjSyYoEbs5JisKKYGk8fReMcRNyuHBnYOCK7EL+e3+wVe95V
 5rrET+AkDbcLe/r9gcUhqwAf2ZxuQ6tRDw6HTRl5xs2kaxczut4nOF0eE
 SeS3hon9QVlEnI6cTFmzcSkPs0jauSMZCgjrWOmpHkhJo67lRHHFSs92X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442623304"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="442623304"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 00:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693769523"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="693769523"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 00:55:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 00:55:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 00:55:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 00:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SP8aM2xe4eittcsr3ztJPju181OXwCV7zJrUoPA3O9JWtvCayglvBHbizBgi71RtenHYIWJ1JOryCVq3qiKMrfj9EjJFKYdwtCUt+0Ggw1XhOGR02qJNq4xti5ChL+Cj0OkSvCxLJjNBWNkmTK9M8k1fLiKvZ1AMxb++EoUrDyNe8/SgBYCWEPlMIGzzD8OvGk7Kps+J+DfW5DEMpnjlCxEDS4g0L+/Ur10mRyd3SxgYdYH7+Cn1igjB5HBHctmBZ2sfk7kGyV3Gfv4gRVxOHwYW+feENPiWPmodaso75QlS1BMDF7bSSt44M//218h/AYcK882hLCNgnATWVSMaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4fBlWMpXxaHEsY8tzdpfmNXhlw/eEH4zJ4QBxBW5sQ=;
 b=JmK4deprVTtuQtK8k2PiHNJw4FUExzVUiSBJNPbaeK+EXIdwM9chD2CdNIRqYUrpJJ+dkvLyd01ZAAqOm5jAaCR46YVgd4OxI8vagg3/fQ64LqGDzz5d4+CeCKBw+271qkU7anSHUco57GPc6+pmbNu8tlHxfW4LBGWYp+cmf8j7NDcI6wwlLK0jJgOKIoWiV1q1NAwyDO/BS/IrZMVoj77Qx+ZXEa/mNPALbeXJMNIW1pphXFP5WyWPMAm8ziHwkyA7vjDuusO1sN63Cw0MT8OKgb3+azmmUGHPkP9fTJ/4wjgCY4eKW5W3IVaqSaxAaTpnTYbOGwoNlc41MWCuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 07:55:22 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6745.035; Wed, 13 Sep 2023
 07:55:21 +0000
Date: Wed, 13 Sep 2023 13:25:09 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Message-ID: <ZQFq3Xxr/Uu4m312@bvivekan-mobl>
References: <20230911104134.431670-1-balasubramani.vivekanandan@intel.com>
 <87cyypezsx.fsf@intel.com>
 <eb6q46xjir2vo745evqhy4jzj2jxpkvyipqetrygurhmg3zqcz@k7yott3gcmlj>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <eb6q46xjir2vo745evqhy4jzj2jxpkvyipqetrygurhmg3zqcz@k7yott3gcmlj>
X-ClientProxiedBy: PN2PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::24) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MN0PR11MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfac37d-2106-428e-6aa3-08dbb42ec74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQTMWRWJc/kH+rBHJBOPqNYSIr4OUQGuupZLtyb+rsNOdWIUNpm3/y4Vzuh31k80MqbcTrnUvs5MVH0lSCf5i+Dd8zVyVuO9Xygn1rI61hNxwIWjmnbTbNl8z7CGknu8ZZWJ9RU2rAUVomb+XFX0h/c/xeAbETdcqCtw7Kw4LAIhAQenCOaXkrokp0z20HOsmbilaWCRf1QQTy+wyQroa2pk8+BD0/Y0B2O1RF41yEZ2BCd3mwy9MY/xkyYwn5roB0ZqPNi39TwWoKEr1Yrt2e3NkriIUkZnmhVoNLacvLwTyl+2AB2KO3jI+9Vcvnzc7j6TG1IHinPuwjyBfJC+r7l0CyeKPU4ETed7wwvOrWlGFZgjz32CENOr46HGsEcwfQV/4+3wHnVVTAESnhO033UEyMR70LdvQwXPVhj7ALn79tMWq6Q9caViMaPQd13STUwj5dRITjSi/bQGbmNu8/xAPxyUAXdj+89I0AyT0jDNTPn2AuhBNlAwc4yuHo8ac9LSd3g8M9GZFPdyiB61fLJ24L4i1gYtPmUTpXgiBReeI5VVQ0Cps1fS9j2CLSg9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(39860400002)(376002)(366004)(396003)(1800799009)(186009)(451199024)(66899024)(2906002)(38100700002)(82960400001)(86362001)(33716001)(8676002)(53546011)(41300700001)(66476007)(6512007)(6506007)(316002)(9686003)(6486002)(54906003)(66556008)(8936002)(110136005)(4326008)(478600001)(6666004)(83380400001)(66946007)(44832011)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZ6Ky9NT0RSdEhyYUpTbU1FTEZ6bmxpTm4vbWtVVXFZTDBqdU0zVjFuS25t?=
 =?utf-8?B?dWZXemh3SktpREJXZE55bHd1dkM0OFlibE83c0Q1clBLLzJOOXhxVHNCdWhE?=
 =?utf-8?B?a0lPK1RPNmxScXBiUG1Mc1U1NWFoSjNHT1hHa2Jac1ozQ2RDQjJTTG1WaitU?=
 =?utf-8?B?K3ZZZ3E0cFVYckxPV3lURVNNdnBUa3JuQnFmUDFWajJaSUR0STlFczU1aVEw?=
 =?utf-8?B?VmMzTkRkYWl1cjU0MEdKbTF6UUhpVFJnK0ptSWZ0aUh0angwV1pWdXl5OXRj?=
 =?utf-8?B?SEVBRXJpOHZIdG9GTWFrRGp3NU9wVlBCVnA0dmxuZm1QWnNBN1lFU1pEMm1I?=
 =?utf-8?B?cVJ4NnZnVVhxOFE4RjNGU1FiTW9seXM3blE3UDVWcDBEcllRSEEwRHVRTldu?=
 =?utf-8?B?Nm04czJ3Y1VpU0cwZFVSTW1tZ2ptdDJqSGhGbzhiY3M1eGNyTm92dDdab25x?=
 =?utf-8?B?NHRqcENNUnNlK0ZqOVRkRGxCT28vb3dYSjVkdHR5UVZqeHRBaHlSWU9mWUFk?=
 =?utf-8?B?YXJUcWUvY3BoWUkxZzdUVzNFdCtneDJCNTRlVUFCeFhRNWtGbnIxeFVpb1lT?=
 =?utf-8?B?YitWSmdXWHhKMjVWYUk4RG1FdjUzTS9LWHNOZDg0cjl6Vk5QaVJxTGRhcjNo?=
 =?utf-8?B?SmVDSExqRFkrL0N4TDl5RjgrNHEwNVpWY01LZ1RCb2tRN2s1ekZUTW5QWXlk?=
 =?utf-8?B?SmxGamJDQkhSVjJxWUpWcUQ5RDU0amV3c254eFJEV2dPZ1ljc3NpVzMxQXZu?=
 =?utf-8?B?eDRWbUJscVBsU0l4Z2EyOVNzcVNHQ0s3cFU1QytUdG1vZitkRnZvMVo2eEVV?=
 =?utf-8?B?clZWSTI1N3p3bCtzREswY2pSYXRzOHhBZ0hIQnJHTTRxNmVUMVcwcEhPNVd2?=
 =?utf-8?B?N0x4akQrd0ZKRnpHNWZadVlaMzJZdzVUZWZXdnRXL2JGRjFLSU00M2dPTVBj?=
 =?utf-8?B?cUhnTnBVSC9KWjNDK1NDRWZrSEdFUW12MnRZSWNwbEgxMTZOYWYyL0JMYVFX?=
 =?utf-8?B?TGlpY0kyRUQxb2YxZTdEQTJGR2lZN0kyKzROREpaNGs1Qk5IQ000Y0d5T2s5?=
 =?utf-8?B?MjJIZzl3cEIvcExDRlpjOUduMVpweHZ5ODRpR01mbFF1VmRLYmhyTXFOR2JE?=
 =?utf-8?B?S0tmR2JBaTZmUWpCamVEV3VWUXhDWmVOaHZnb2dRMXpTU2RPSE5HOXF2Mis1?=
 =?utf-8?B?ZlRCcWM1aVZJdUNaMXZsN29JUWg3UnZjNGs5Q1h3R0thVm0wRjEzVlpYWG5Q?=
 =?utf-8?B?djlpcmJvU0VVeHh1dG5CQzA1RHc4ZmVaVHFCQWV4bTd1eG1GMXRIVGU2VkpT?=
 =?utf-8?B?VXNXY3l4bEdxWUpDVXJPU2ZXUHgwaXJDb3FPSE9UZVpscHBCSFMrOHRVbzda?=
 =?utf-8?B?clZyd1RybGpPUG1xMFRqZ2ZTZUhwa09NcVpJd1IwcFk2U21mNGg3dGxHZjdw?=
 =?utf-8?B?eDAwSkdUb1JUTUVRL2Z5bFhEeGxPY1VFZUV2Rk40U0JDQUZzZVZBVGVjdjlu?=
 =?utf-8?B?V3FjQU1JM2dkbGF4bEV4ODNuVEtQYjArSU44U2RiWGN2K0VoUnB6VW1yZHc4?=
 =?utf-8?B?Z3RnbnBKZkpaZUU1aldRczBPS0FPbythNTlPUE9QaENTV2xrKzVZSlZhenZ1?=
 =?utf-8?B?REVGUzkzTXo3STlOMFI3bm5JdTZ0dnh5cmVWa3N2NzVYc2l1YUJPcXJOb2lM?=
 =?utf-8?B?dzJMS091WWo5TkpTcmVhVGt4YWN1TG95bS9nTGYyYlhucDdDczMxWVpxV2R2?=
 =?utf-8?B?aVVWLzJKeGo2eGZsQ3V5SllsSEt2ODI2dXhnUWoraVM0eG85MDdPMXVvVFlS?=
 =?utf-8?B?T0pkOTk4ZlN1UFlpa2czWG0vVEI2ek5hUXkyeWZtTk4zeWorQVhsQzVRUzA3?=
 =?utf-8?B?cUFzdmhjRjhBekZmL1owWUliUmwrQi9WSlJUY1piaVlIWkhTSkdIdmltWll1?=
 =?utf-8?B?cEhQQ2JSTVdNQll3L0VpbStGNEVaK0g0QlhoUkc3aVd1V2dFRzNWVXdkUGMw?=
 =?utf-8?B?UWJwUkNrcnlzWitpV1BReUs3QXIzaW54b0I0SFZFWnMzL3VrekQrY3c0VUNi?=
 =?utf-8?B?ZEY4RmUxUmRiT1BBWS9KN2hRbEpvZHoyNDZxR0xMRVN2cjczK2ZoOXRrM0Za?=
 =?utf-8?B?eTJlT2dQMllSVWNBUVUxRkNjRzVGUWk3QzhCZGdXMnpvMURaZ0dPSm1rTW0w?=
 =?utf-8?Q?y3SBBSNOpBacG2WUhVFR/J8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfac37d-2106-428e-6aa3-08dbb42ec74b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 07:55:21.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi8el2dyMuqihrjPbYKaGs9H1LEgv2/g2+O6vOF/Pp9nCay+1rd1REkoBW24B39mkvc2QqrNG2yw4CT9i1+x8oqeYzBzbLLc6cjlXZLDtfHG819n1L/O5NHKPI/7BmNP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/display: Print display ip version
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11.09.2023 09:01, Lucas De Marchi wrote:
> On Mon, Sep 11, 2023 at 02:04:30PM +0300, Jani Nikula wrote:
> > On Mon, 11 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> > > Print display ip version and flags during module load
> > > 
> > > v3:
> > > Use the existing intel_display_device_info_print() function to print the
> > > display information. (Jani)
> > 
> > So this is an improvement in the sense that xe core doesn't poke at
> > display data directly to print the info.
> > 
> > However, I still think the interface between xe (or i915) core and
> > display should be minimal. I don't see why we'd need to add a function
> > at the top level probe to print display stuff... the display code should
> > do it internally, in some other high level probe call, when it's done.
> > 
> > Even having the function adds complexity, because the call site now
> > needs to be aware about display probe order, and ensure it's all done
> > before you can safely and accurately print display info. And that's
> > display code implementation details.
> > 
> > Superficially this is all benign, but this stuff adds up. We've been
> > trying to untangle i915 core and display for a long time, and the i915
> > probe is still a huge mess, with a bunch of random calls to display at
> > random times, and there seems to be no end to this. It's all so
> > intertwined.
> > 
> > Perhaps in the future all of the calls need to go through a framework,
> > maybe aux bus. Do we really want to put all of this to that interface?
> > 
> > So the direction should be to reduce and minimize the interfaces between
> > the high level components, not add more.
> 
> Agreed. I think what is missing here is: what would be a good point
> inside display to call this on. Is it ok in the end of
> intel_display_driver_probe()? Are we ok with display info now showing
> up before than the rest for i915 or should we also move
> i915_welcome_messages() to be before intel_display_driver_probe()?
> 
> Lucas De Marchi

Hi Jani,
   can you please provide your opinion to the Lucas' query? I would send
a new revision based on the conclusion. Thanks.

Regards,
Bala
> 
> > 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > 
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_display.c | 9 +++++++++
> > >  drivers/gpu/drm/xe/xe_display.h | 4 ++++
> > >  drivers/gpu/drm/xe/xe_pci.c     | 2 ++
> > >  3 files changed, 15 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > > index a453946ad108..45ffc418e636 100644
> > > --- a/drivers/gpu/drm/xe/xe_display.c
> > > +++ b/drivers/gpu/drm/xe/xe_display.c
> > > @@ -417,6 +417,15 @@ void xe_display_pm_resume(struct xe_device *xe)
> > >  	intel_power_domains_enable(xe);
> > >  }
> > > 
> > > +void xe_display_info_print(struct xe_device *xe)
> > > +{
> > > +	struct drm_printer p = drm_info_printer(xe->drm.dev);
> > > +
> > > +	if (xe->info.enable_display)
> > > +		intel_display_device_info_print(xe->info.display,
> > > +						&xe->info.display_runtime, &p);
> > > +}
> > > +
> > >  /* Display info initialization */
> > >  __diag_push();
> > >  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> > > diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
> > > index 9e29de012df7..b18bf5583229 100644
> > > --- a/drivers/gpu/drm/xe/xe_display.h
> > > +++ b/drivers/gpu/drm/xe/xe_display.h
> > > @@ -19,6 +19,8 @@ int xe_display_create(struct xe_device *xe);
> > > 
> > >  void xe_display_info_init(struct xe_device *xe);
> > > 
> > > +void xe_display_info_print(struct xe_device *xe);
> > > +
> > >  int xe_display_init_nommio(struct xe_device *xe);
> > >  void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
> > > 
> > > @@ -57,6 +59,8 @@ xe_display_create(struct xe_device *xe) { return 0; }
> > > 
> > >  static inline void xe_display_info_init(struct xe_device *xe) { }
> > > 
> > > +static inline void xe_display_info_print(struct xe_device *xe) { }
> > > +
> > >  static inline int
> > >  xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 24b16863bf3d..a4886ea8794f 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -724,6 +724,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  		xe_step_name(xe->info.step.display),
> > >  		xe_step_name(xe->info.step.basedie));
> > > 
> > > +	xe_display_info_print(xe);
> > > +
> > >  	err = xe_device_probe(xe);
> > >  	if (err)
> > >  		goto err_pci_disable;
> > 
> > -- 
> > Jani Nikula, Intel Open Source Graphics Center
