Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B793C48297
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 06:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E75810E41D;
	Fri,  9 Feb 2024 06:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdXvJwXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5B610E41D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 06:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707458504; x=1738994504;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XOU20qbGczNtxHvH67FRefEq3HDukyGgK2PALGCAXDY=;
 b=fdXvJwXYzBf4vxfco2DVypL4Vi3O2mp6CmTyydRrwoggaT69VV4RBGlS
 BG9dndy5AAiHzvZcPRejul4BvMHhkyO9CqMrsiZ4og87jRG5bdCvTuoLE
 kmk2hRmNtZIFH+xgH2b4M1wwN+rIQ4nJiRC3iwd6cPrNkPukQzrx0YrKB
 aoOgXgZeNFb2DbeMJnWRKjGBCeAiyO3BfcCOobz4xg48y+fectaT4GBsd
 WPjE1D/vV36ilszAYQbH5lrKlraJJSjfqLNslpQ2dypwLGMuFVIwY1fTF
 UfLY8FHMwNgNLc7RNwquK+Heoyp6q+R/YWrtSsDN0KJI57hSXTkSL4Eu+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1232907"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1232907"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 22:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6508685"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 22:01:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 22:01:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 22:01:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 22:01:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuwU4RA3AP9HYzxbOIXNUdYapHt6BcnLzdr5s4Z6NnXN0e+Griq0jmXQX/WOZjBfqkLGVBOu2sUret6mIwT4xWkzZq39fEX8kPqAx5zitISOhbSNB3uyDOn4XF+WvQ7l8lV+J2BgIpSXVnzn406L9MauebgEWdfLUGc9aoxIYDJ6D2u97Zdm4vnSSN/KoTadsquYPI7hHnyRog0lDkFm2KvtAuyyONpdjKzbu+GJu26jrF9q4GCAhii2SvQAKAHTm/Yz3AZQTwxVtV9nVd7N/s1kaLUpNsHGaOPegV6mZyHgFEufGMj6WOkh7iUlO3uYq8NsxE8SDp7tmsER4PZytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2jX754knxXoJ+0b6EK9X5wzQzq+VthwTqstYuangvk=;
 b=HDYBTsECqAtCd+/PCfgH0HH1sqqWsFOfHWHM6m1voa9DrMQYpHVgTH++MQvK3dR4d8bRnyoCL19VZRrHqSB2VAhQt+keXXQVNyQdislcvcakm83p4ZLFHQD92g4h7oTbpXy2oVtjqGeNK8LuW9P40g81fU0GqjIGp/PTcGZz4ckXTXmom6/aFFKwlMkGle7ewg/a3XFEVlThP3jPTVzpB3aDhmYch3CDmlw/mVnsrmbKMNnkQhzDJDoijLzF8lIo8m9QTGL9ljmLTT91wTZm/+TbzCQioWwnwOXxZU5oLdCNypNpNaNZOc5m2vTMGkE2UdSATpFVMXjpBzhXu8p9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Fri, 9 Feb
 2024 06:01:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Fri, 9 Feb 2024
 06:01:28 +0000
Date: Fri, 9 Feb 2024 00:01:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>
Subject: Re: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Message-ID: <qj734bhlz3yprl7y7eyb5fj2wzvumv4m3ehvh5kg7rseugsrjn@wjljwsrxsyft>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
 <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
 <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
 <6d27be6f-f501-4bba-a8f9-ae80f23484bd@intel.com>
 <v5mwvlynhfvcre2iudh3am34y7eh4llhifj32gw3l56g4idvw6@uo6rutzsqmyl>
 <d37b18a9-ab2d-478b-9510-087c8ff76ec5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d37b18a9-ab2d-478b-9510-087c8ff76ec5@intel.com>
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 0556e44a-2850-45ce-7c55-08dc29348e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: doM/R99zUmm8zN6wjD2moBN7k70ZnWixOQaUM+1pSRdIYYsVVnPqJW5mYX1fr1ld6KvuFkqFQoT1N57OJOujzmCrAfz2lQU+GUuAiVuZ67OFMyPLPQSPuuuVCcUarjIE2k8EEGapmRS0hKwwkJwlx8dKZnjkZfC6HVAgh5zH4sIWkFftrXzsGdsKuInzxHmiYiiaCUsIyyd4OKyBi2/EppUeAb+FEPTGjRQ1lD29yCOC2DrKXLNfXJBV781wyX7U1GuoA7gK8w+GEv5XnpQEBBZnz2zZ0lQBNQTue1541sduPjW8vJajqMEDjLBUlhj7EWajsH2JNEAGytRBiOFREpAae9K0KcddJmsSXcfkc3H7MMBXXwAgNVayKbtkGQpKvqTK8RMsUvGzfLMXbg6snh8Ni0YiPcJAa2cxv1RdfZeO4PDbWVEETX+JevdsBIpFHXpw+dh0VEXkxOPquYDzCbMiwGFZAyL5/rw3GAXNw7zp5hazdSvyez2OrPodPhbPYyD/BSSTqXsa4mn6tSs23DclpPiP5fsI48sf5RUiVQd239fYVizbqAutzXMxzppXhCdP+jqacpCmi3S9c3a0F1f2ntbWNMNdUyAc94pDZjkgtX7zB5eeBsz6Hxz8J2v3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(376002)(366004)(136003)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(82960400001)(6636002)(316002)(66556008)(66476007)(54906003)(66946007)(6486002)(966005)(4326008)(478600001)(6862004)(86362001)(5660300002)(8936002)(2906002)(8676002)(38100700002)(6512007)(9686003)(107886003)(26005)(30864003)(83380400001)(6506007)(66899024)(33716001)(41300700001)(27256008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pS8Ou0Dg5pO7DLnzMO8RJWHSqsIYgK0dPMb3rBYMisrjxEl2rvF11GrCau?=
 =?iso-8859-1?Q?V4vr0+XQQaCcozKhp+pfMeJ9TQjMJe/17YoOchmPbhVavMtwgMDoNjxc5a?=
 =?iso-8859-1?Q?EC6CN2+pgioKNzN2Kcdp6M0Uh1lCj9LySYIRLZ8LUli0mC1a9uczWPNIEt?=
 =?iso-8859-1?Q?uhb5ecpt+jKNQdT17PyRPiE/CB/v4DflWRz7MrPrwn5dVH/xE4VC1t/ejr?=
 =?iso-8859-1?Q?fU1mBQ2hv2avGDWQLy+YL+fT8Wk/lGOYbx+xzW4PiUlutA3EJGeoztlrtW?=
 =?iso-8859-1?Q?YaG/LBBsO/qzmmaLuxI40WPzdZPjQd2FsqayeeV4AE3Gpk8t8xvuSJC/Ww?=
 =?iso-8859-1?Q?siUhlw8CifCefBIGV/dr/6zll8CqpYxA5J/JiRmM/Pj5dCsBgUNNZaArpm?=
 =?iso-8859-1?Q?jWG3/4UcKgfJIUZhNSIC8V1mwjG0KvIcA8jxpz6NBSsD4WHBN4YiC9j+BD?=
 =?iso-8859-1?Q?hCqVGt4WMSBLY8QXnnSRlXas5I1K3hEndJl2f6xLwemDxGYE33gHJMBNYc?=
 =?iso-8859-1?Q?64uetxSmI+7mdVA2s76fBLoJMxpLWF/K4pkkw0acCY1PYPyaNEcfy1QRIn?=
 =?iso-8859-1?Q?eRMc62/wtbbNl6Sl2dZafavzXs23YZhIUNiR1fA3E4iFQ4qV1iZaw9rIKH?=
 =?iso-8859-1?Q?8Mvauj4oPCtJ6CE0THkN+4RbUgk8/s8BEWf9WFShL7fXISO5e19HGBbIUW?=
 =?iso-8859-1?Q?pVS6o8VXxAESTiUJJ8PsRqGIXYR5nFF+qJMFNsbOZx0cV5JlbW0pdhipuS?=
 =?iso-8859-1?Q?GlnA4HLG4l5d5jNLicDjHPv22348g/kJBO//NKh/QhDofy8vrcAVbHkZzd?=
 =?iso-8859-1?Q?cIwc3A3+6A3U/6dXsjPjhWawoRRw11cCQVWlqOUPYlJ19MbPM1qcOjXhaM?=
 =?iso-8859-1?Q?RV8zHg5Z6rCrVvVdoqJnCBk4Brbjkou3IAuVJniAJvqmy5twWzrFtp9dIb?=
 =?iso-8859-1?Q?a2oVap5+EgGJwCPfw0z3Xtnq2U45s9sbRdsOMgrNJDz7o94bGrFHdzzCSw?=
 =?iso-8859-1?Q?luuTGqqMAjp46yYmeMDq3y2JmX47HKJP3DpFXVSYzTUH2FZuQqu8mE1vXC?=
 =?iso-8859-1?Q?iKzbbByy4o9zbEW72MjljWAvKPWKJCC5lLZ1QGOvvJPR1pYs5uAWOp/lc1?=
 =?iso-8859-1?Q?IaSh3fPONqi2ipIU6DlPmgvGzM3wOZIpROoqQFqHKX29IgqJZPgwbztrLW?=
 =?iso-8859-1?Q?rIPzGDhn4kv+KfailL77KD3i5EMoylLqbQ1p78c3pJIiBsiLotEWBMKbAV?=
 =?iso-8859-1?Q?xBcuis5QT7CqFI/jsmfkPvCs4/pc0myyk0nFZK4yunIDJs8rmIZSS0bc+W?=
 =?iso-8859-1?Q?uNHfux+qz1VGDYFQY9qtbRzsiPOjaWdU2VOYnjXO19ragqgFcZC5Q1lGcO?=
 =?iso-8859-1?Q?E7SvvUPoX1BUrX3AAVwQP4VfNcaWbVMQM9BiiNiIgFkR/lgh6NQ89oHPDn?=
 =?iso-8859-1?Q?4jmtq6DQ9ROqIaLetxHM3xyPC2O+MRNloOGVwW1jWZUV1mhyMSgf+ou/03?=
 =?iso-8859-1?Q?CFHCKbOpKow3RxbPIZHbMpyMYAVE/G8P6HYRuBzsDD28h/aRiTOEba89KK?=
 =?iso-8859-1?Q?+MaDz7yUh1U5zwW7zNYw1YYbQeLuF2RLqI0OerD9Y4z2doOwWRcgWSRY2y?=
 =?iso-8859-1?Q?HD0DMruWB1X3XnG0NNPeN3B2tRto/1u4esUrvBj+8IrXsD3RA552yEPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0556e44a-2850-45ce-7c55-08dc29348e4c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 06:01:28.3749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zakg8AzlwLw6nQUm44XOwYABREn+lyW5JChV+SXg11LaHgW/Rgm8bcp1+SQfZtosjpXPjt2sOFN/5GIwP/+xxWtMz5AHxJjlVtagM7taTRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 08, 2024 at 04:29:55PM -0800, Daniele Ceraolo Spurio wrote:
>
>
>On 2/7/2024 12:40 PM, Lucas De Marchi wrote:
>>On Wed, Feb 07, 2024 at 10:34:07AM -0800, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>>On 2/7/2024 8:42 AM, Lucas De Marchi wrote:
>>>>+Gustavo who is dealing with DMC firmware lately
>>>>
>>>>On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
>>>>>On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
>>>>>>On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
>>>>>>>Supporting older GuC versions comes with baggage, both on the coding
>>>>>>>side (due to interfaces only being available from a certain version
>>>>>>>onwards) and on the testing side (due to having to make 
>>>>>>>sure
>>>>>>the driver
>>>>>>>works as expected with older GuCs).
>>>>>>>Since all of our Xe platform are still under force probe, we haven't
>>>>>>>committed to support any specific GuC version and we therefore don't
>>>>>>>need to support the older once, which means that we can 
>>>>>>>force
>>>>>>a bottom
>>>>>>>limit to what GuC we accept. This allows us to remove any 
>>>>>>>conditional
>>>>>>>statements based on older GuC versions and also to approach newer
>>>>>>>additions knowing that we'll never attempt to load something older
>>>>>>>than our minimum requirement.
>>>>>>>
>>>>>>>RFC: this patch sets the minimum to the current GuC version (70.19),
>>>>>>>but that can be moved one way or the other. The main aim here is
>>>>>>Ideally, this would be bumped every time we update Xe to a 
>>>>>>newer firmware
>>>>>>version right up to the point when force probe is lifted. At 
>>>>>>that point it
>>>>>>becomes fixed and we have to add the version check support 
>>>>>>back in for
>>>>>>future w/a's and features.
>>>>>>
>>>>>>Get's my vote :).
>>>>
>>>>Yeah, but see my other reply... I think we will have to wait the
>>>>firmware being available in linux-firmware for that.
>>>>
>>>>Also, let's kickstart a discussion on our process with some
>>>>possible changes so we can get it documented. I think we have a good
>>>>opportunity here to start adopting the
>>>>https://gitlab.freedesktop.org/drm/firmware repo.
>>>>
>>>>Rough idea:
>>>>
>>>>1) use intel-staging branch with tags for pull requests to
>>>>   linux-firmware, just like documented in their readme.
>>>>   IMO the naming is rather unfortunate since it would be
>>>>   good to use it for (2) below.... but since it's already used
>>>>   we can use something else.
>>>>
>>>>   this would mainly replace the use we have today for
>>>>   https://cgit.freedesktop.org/drm/drm-firmware/ ,    which 
>>>>could be retired. From  upstream linux-firmware pov the only
>>>>   change would be the remote location and that we start using tags
>>>>   for the pull requests, coming from a single branch regardless of
>>>>   the firmware (guc, huc, dmc, gsc): intel-staging. Once accepted in
>>>>   linux-firmware, the branch is fast-forwarded.
>>>
>>>I think this needs a bit more fleshing out, because before we do a 
>>>pull request, we do want to run CI on the blobs. Also, in several 
>>>occasions we went through a couple of versions before we closed on 
>>>what to push to linux-firmware (e.g. in the latest push we started 
>>>with 70.19.1 but then pushed 70.19.2), so we can't go to 
>>>intel-staging until we're actually ready to push. I think the 
>>>process you have below for mmp blobs should work for this early 
>>>testing flow as well, but we might end up with a lot of noise in 
>>>the staging-intel-for-CI branch.
>>
>>that would be a throw away branch where we push stuff to be able to test
>>on CI. I don't think the commit history matters much there. The fact
>
>That depends on how CI does things. With the current handling of 
>throwaway branches we have on drm-firmware, a CI request can 
>accidentally roll back another one. e.g., if we push a throwaway 
>branch with a GuC update and then another with a DMC update, the 
>second push will roll-back the GuC to what's on the new branch (likely 
>the linux-firmware version). That's why there was a suggestion ti use 
>a unified branch for CI as well.

not sure we are talking about the same thing. It is a unified branch for
CI: staging-intel-for-CI is where the mmp +
about-to-be-upstreamed-for-the-first-time firmware blobs are added,
regardless if it's guc, dmc, huc, etc. IMO it's much simpler since CI
basically has to take the additional firmware from this 1 branch. No
risk of rolling back another firmware because of the new one.

>
>
>>that the firmware is available to match what is in the kernel and that
>>there's a documented process for using it in my view trumps the
>>this downside.
>>
>>what I expect would be, considering the LNL case as example:
>>
>>1) Start testing with the mmp version:
>>
>>    a) Add firmware to  drm/firmware intel-staging-for-CI
>>    b) Add commit in topic/xe-for-CI on the kernel side to make
>>       use of that firmware
>>
>>2) Ooops, that has bugs
>>
>>    a) add a second mmp firmware to drm/firmware intel-staging-for-CI
>>    b) replace commit in topic/xe-for-CI on the kernel side
>>
>>3) we think we are good, let's try for real
>>
>>    a) Add lnl_guc_70.bin to drm/firmware intel-staging-for-CI
>>    b) replace commit in topic/xe-for-CI on the kernel side
>>
>>4) yay, it worked
>>
>>    a) Add that lnl_gu_70.bin firmware to intel-staging branch and
>>       prepare pull request to linux-firmware
>>    b) move patch from topic/xe-for-CI to drm-xe-next: i.e., rebase
>>       topic/xe-for-CI on top of drm-xe-next leaving that commit as
>>       first one. git push topic/xe-for-CI, dim push drm-xe-next (or
>>       implement the logic in dim to push 2 branches)
>>
>>    We may need some time between (a) and (b) depending on where we
>>    are on the kernel release cycle: we don't want to submit a
>>    kernel pull request before the firmware is available @
>>    linux-firmware repo.
>>
>>Note that the fact we are using mmp makes it more complex, although
>>explicit.  Going direct with lnl_gu_70.bin would also work and avoid
>>updating the commits on the kernel side.
>
>This works for a completely new release. For updating an existing 
>release, we'll have to push, potentially multiple times, all the 
>*_guc_70.bin binaries to intel-staging-for-CI. Just to be clear, I 
>have nothing against this, just noting that it would generate a lot of 
>noise in that branch and potentially use a lot of space on disk.
>
>>
>>>
>>>We also need some rules to handle the case where there is already 
>>>a PR in flight and we need to push some more blobs. This might be 
>>>as easy as the committer seeing that there are commits on top of 
>>>master, replying to the previous PR to deprecate it, and then 
>>>generating a new PR with all the blobs.
>>
>>the pull requests to linux-firmware would come from tags, not a branch.
>>So you have (tip of the branch is on top):
>>
>>    o <intel-staging> intel: Add lnl_guc_70.bin
>>    o <refs/tags/intel-2024-01-30> intel: Update dg2_guc_70.bin  <-- 
>>last in flight pull request
>>    o intel: Add lnl_dmc.bin
>>    o <origin/main> ....  <--  where linux-firmware is at
>>
>>Looking at amd-staging, it seems to match what they are doing:
>>https://gitlab.freedesktop.org/drm/firmware/-/commits/amd-staging?ref_type=heads
>>
>>
>>see the amd-$DATE tags
>
>Sorry I wasn't very clear in my comment, what I wanted to point out 
>was that if we are on a unified branch and we have the PR against a 
>specific tag (intel-2024-01-30 in your example) already in flight, how 
>do we generate a new PR for the newer commit that comes after the tag 
>(and which will have its own new tag)? Does git do some tag magic and 
>handle it for us, or do we need to generate a new PR that supersedes 
>the one in flight?

humn... there is no magic, the old tag is an ascendent path of the new
one. But as I said, just coordinating with the few people updating
firmware who/when will do the pull request should be sufficient for
avoiding a pull request when there's already another one in flight.


>
>
>>
>>>
>>>
>>>>
>>>>2) mmp firmware versions are only ever pushed to a separate 
>>>>staging-intel-for-CI
>>>>   branch. There is no pull request in the mailing for this. We 
>>>>can either
>>>>   push directly to the branch or create MRs in gitlab. CI would start
>>>>   using this branch for the extra firmware for platforms instead of
>>>>   whatever it's using today to process the pull requests from the
>>>>   mailing list.  Or whatever it's using, because I don't know 
>>>>and don't
>>>>   see it documented anywhere.
>>>
>>>As long as the CI team is ok with this, I'm all for it.
>>>
>>>>
>>>>   The patch on the kernel side to use the mmp firmware is only ever
>>>>   pushed to the topic/xe-for-CI branch since a) the firmware is 
>>>>coming from
>>>>   a non-official location and b) end users and distro packaging
>>>>   shouldn't see a warning when building the kernel due to a possibly
>>>>   missing firmware
>>>>3) Raising firmware version requirement for past platforms used as
>>>>   SDV can be done **unless** it raises the major version. 
>>>>That's because
>>>>   end users would start seeing the warning that we avoided in (2).
>>>
>>>Who are the end users here? If we're talking about older 
>>>non-officially supported platforms, the only users should be 
>>>developers and they should be able to handle having to update the 
>>>firmwares to a newer major versions.
>>
>>distros and any developer outside Intel. The kernel build system is
>>unaware of xe.force_probe. So if you have, after the several macros:
>>
>>MODULE_FIRMWARE("xe/tgl_guc_71.bin")
>>
>>It will show up in `modinfo -f firmware xe`. And it will show as a
>>warning when installing/packaging a kernel.
>>
>>It doesn't matter for minor/patch updates because the file name is
>>major-only and **running** with that module is protected by the
>>force_probe. The major may be updated when it's available in
>>linux-firmware, which means i915 started using it (for i915 that would
>>be "as an option, with fallback to the previous major release" of
>>course).
>
>Ok I get the concern. My assumption here was that we'd only update the 
>minimum required version if that version was in linux-firmware even 
>for minor updates, hence why I didn't see why a major update would be 
>different. I guess we could go with a more relaxed approach where we 
>allow the required minor to be updated for force-probe platforms as 
>long as the firmware is available on a public/CI branch even if it is 
>not in linux-firmware.

yep, I don't see it causing issues to end users.

>
>Getting back on track with the original purpose of this patch, are you 
>ok with setting the minimum to 70.19 if I first push the matching PVC 
>70.19 binary (via the old method for now), while we continue sorting 
>out how to manage the new repo?

yes.

Lucas De Marchi

>
>Daniele
>
>>
>>Lucas De Marchi
>>
>>>
>>>Daniele
>>>
>>>>
>>>>thoughts?
>>>>
>>>>Lucas De Marchi
>>>>
>>>>>>
>>>>>
>>>>>Mine too.
>>>>>
>>>>>With that:
>>>>>Acked-by: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>>>John.
>>>>>>
>>>>>>>agreeing to stop supporting very old GuC releases on the 
>>>>>>>newer
>>>>>>driver.
>>>>>>>
>>>>>>>Signed-off-by: Daniele Ceraolo Spurio
>>>>>><daniele.ceraolospurio@intel.com>
>>>>>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>>>Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>---
>>>>>>>   drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>>>>>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 36
>>>>>>++++++++++++++---------------------
>>>>>>>   2 files changed, 16 insertions(+), 34 deletions(-)
>>>>>>>
>>>>>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>>>>>b/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>index 868208a39829..5e6b27aac495 100644
>>>>>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>@@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct
>>>>>>xe_guc *guc)
>>>>>>>       return flags;
>>>>>>>   }
>>>>>>>-#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) 
>>>>>>><<
>>>>>>8) | (pat))
>>>>>>>-
>>>>>>>   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>>>   {
>>>>>>>       struct xe_device *xe = guc_to_xe(guc);
>>>>>>>       struct xe_gt *gt = guc_to_gt(guc);
>>>>>>>-    struct xe_uc_fw *uc_fw = &guc->fw;
>>>>>>>-    struct xe_uc_fw_version *version =
>>>>>>&uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>>>-
>>>>>>>       u32 flags = 0;
>>>>>>>       if (XE_WA(gt, 22012773006))
>>>>>>>@@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>>>       if (XE_WA(gt, 1509372804))
>>>>>>>           flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>>>>>>-    if (XE_WA(gt, 14018913170)) {
>>>>>>>-        if (GUC_VER(version->major, version->minor,
>>>>>>version->patch) >= GUC_VER(70, 7, 0))
>>>>>>>-            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>>>-        else
>>>>>>>-            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC
>>>>>>version expected >= 70.7.0, found %u.%u.%u\n",
>>>>>>>- version->major, version->minor, version->patch);
>>>>>>>-    }
>>>>>>>+    if (XE_WA(gt, 14018913170))
>>>>>>>+        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>>>       return flags;
>>>>>>>   }
>>>>>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>index 4714f2c8d2ba..e5bf59616f3d 100644
>>>>>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>@@ -296,36 +296,28 @@ static void uc_fw_fini(struct 
>>>>>>>drm_device
>>>>>>*drm, void *arg)
>>>>>>>xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>>>>>>   }
>>>>>>>-static void guc_read_css_info(struct xe_uc_fw *uc_fw, 
>>>>>>>struct
>>>>>>uc_css_header *css)
>>>>>>>+static int guc_read_css_info(struct xe_uc_fw *uc_fw, 
>>>>>>>struct
>>>>>>uc_css_header *css)
>>>>>>>   {
>>>>>>>       struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>>>>>       struct xe_uc_fw_version *release =
>>>>>>&uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>>>       struct xe_uc_fw_version *compatibility =
>>>>>>&uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>>>>>       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>>>>>>-    xe_gt_assert(gt, release->major >= 70);
>>>>>>>-
>>>>>>>-    if (release->major > 70 || release->minor >= 6) {
>>>>>>>-        /* v70.6.0 adds CSS header support */
>>>>>>>-        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>>>>-                         css->submission_version);
>>>>>>>-        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>>>>-                         css->submission_version);
>>>>>>>-        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>>-                         css->submission_version);
>>>>>>>-    } else if (release->minor >= 3) {
>>>>>>>-        /* v70.3.0 introduced v1.1.0 */
>>>>>>>-        compatibility->major = 1;
>>>>>>>-        compatibility->minor = 1;
>>>>>>>-        compatibility->patch = 0;
>>>>>>>-    } else {
>>>>>>>-        /* v70.0.0 introduced v1.0.0 */
>>>>>>>-        compatibility->major = 1;
>>>>>>>-        compatibility->minor = 0;
>>>>>>>-        compatibility->patch = 0;
>>>>>>>+
>>>>>>>+    /* We don't support GuC releases older than 70.19 */
>>>>>>>+    if (release->major < 70 || (release->major == 70 &&
>>>>>>release->minor < 19)) {
>>>>>>>+        xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or
>>>>>>newer is required\n",
>>>>>>>+              release->major, release->minor);
>>>>>>>+        return -EINVAL;
>>>>>>>       }
>>>>>>>+    compatibility->major = 
>>>>>>>FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>>>css->submission_version);
>>>>>>>+    compatibility->minor = 
>>>>>>>FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>>>css->submission_version);
>>>>>>>+    compatibility->patch = 
>>>>>>>FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>css->submission_version);
>>>>>>>+
>>>>>>>       uc_fw->private_data_size = css->private_data_size;
>>>>>>>+
>>>>>>>+    return 0;
>>>>>>>   }
>>>>>>>   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>>>>>>@@ -424,7 +416,7 @@ static int parse_css_header(struct
>>>>>>xe_uc_fw *uc_fw, const void *fw_data, size_t
>>>>>>>       release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>css->sw_version);
>>>>>>>       if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>>>>>-        guc_read_css_info(uc_fw, css);
>>>>>>>+        return guc_read_css_info(uc_fw, css);
>>>>>>>       return 0;
>>>>>>>   }
>>>>>>
>>>
>
