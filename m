Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E18C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 15:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2587B10E213;
	Mon, 15 May 2023 15:19:24 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CEE10E213
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684163961; x=1715699961;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S+4OX62RFUJyOfpwddn9VgowE/IIEP4srkm2u9MhMls=;
 b=SGNKozAV4EKkZB4IDUiqpUfUPHbhGUeAuCZ639328idhAh+m9MRCZNV1
 tzAgkXRIkvRqTZrHbByA1n/7yxCPB3FsW32LBmxTVovMl5SWR0hGSGEQl
 Utk4oaIIJS76+bF1KQz8CiiEOwgX9O6D0wQ556IKHJQ1wSsEKWT6GfDKz
 IFfXb8Alej+MbTnsrGZBvCwpybeNyw+JKicOzg6AU8MNuQOOoFdi9R0yU
 6Q4lhaDN2f6CZRI69/8BBwaDUXwz6KBBF0kk1V7HHEk8/gAAAG9hQOKq+
 9uZQHGbhbbPnVtFtcVZjULs9esoa+97BWFpgnwrW5CRdvi/rDdCIlR/Da Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340580470"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="340580470"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 08:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947450852"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="947450852"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 15 May 2023 08:19:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 08:19:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 08:19:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 08:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTA45i0PVmi5RU+ylH8InijWlKlk8vi2SXlfzNP8lbvZH1GVc70ghjeZevBsTZv1bKmJSOyF4IDd2BU/BlCOwYBUSRGWc8xu1zymdhxLhJEyuw/mx++Ey4iF3XLR0U1V6G5X1TVqnfBa2v4vYCrdfp5LPuLwhzxuq9hAekvTTCzk4d7a2tTQV86v3h1Vo2zBg6R+lJKdd3DKU1xfC0ZcByjh0C7M6h7fPmVgzFL41YfyHGsS69yEoFWE9ZR5qP8nS/LG+qD75nlI2s+ler8CIxQYUh7CS/mu52GTxu8EeCUwGR7O4HKjglV3InBLXIHb2OA652LQVKeJxiVRPxn3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibPI6YVbmfrSOFzInvrSTs1mvr5r/KVfpljgxdqXFSo=;
 b=AsHWr961xkZWLHXsKNt4f9GHcypz9TJ2/1earqcGZ0igl8qRTq95R8pqT14oA1/ZcvAg48qx11svYQilYLl/4X0wB+6dwLg6PHwrW4wv3Q7nIYIlHmvZ5QYEnc2IG8aF3GjveYuQjWwYT4ZMGEUGnlWxic0G4vX+QGahBpWDyPsbM+/ZUw7+UarVO4j7ojuyoAA9uWYKPAdssy6BqIsKOsNCkX+iMTbpytIb908spZ+gJ4Zj6mf3ImyxaMLDJrNzqjHDy4MEXEq0wPqoo1mY60whD4DaudCzaa8KJ3FQQu9Z5JV+kJOgUkBEeagGAX3KS3SLuSbPoKEeqDvtxfOExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 15:19:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 15:19:17 +0000
Date: Mon, 15 May 2023 08:19:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <j6kssy473qam6xi5tsoqwinp6mbeflchosxrtpnqyytr7bwhnt@s4slel3dyuvq>
X-Patchwork-Hint: comment
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
 <20230512180313.1765011-6-rodrigo.vivi@intel.com>
 <kogwn7anb5kflqjizp3ncaop7z3dcklcbfnyhina2ylqzcidb7@ccqvfvavu4rq>
 <ZGJFB8V/jf87eqzq@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZGJFB8V/jf87eqzq@rdvivi-mobl4>
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 867aa1c0-d7f2-482a-1ef8-08db5557bfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YciYg/OLO8js2bweIAXV2zHwlk/yIcaL+v/PbjQGYVRXL050jr41zWL1Okf55Kcun5ntyLyfL9nOtwXugXjPgETiOI4B4uk3qsO/0jgz0oie+URGG+Nml6/8zr5WS3vhEiK8p3CFeuEL5bNUNSSKwOX4kaQ+ZtLFf12DouumR/d7XsSU/2wFkOgGvBxuxkdSwCDuqYmnJcUFytXDNP/YzTYahZIPuqXXo84rxK3n801zB9GsT36CLHI79GxkWLrASV9YkIsOxxf1MkGvfoh6YZ1jDvPSoStvBzxzrMCGUUjr/r4/cpCTQs5bFIIqICWdkbUA9xEmsomNdI700E6hY7iSrg/ZpIKomqcTGn/Zm0dQw8i/QQVpOF+0PrPSzHljHnguG6dOyz9N0FDQe2vYgE3fE69mqY/XjKjyv7UYuXZbWooimR56WkL7rAPq75k1H3T/6oRHBSgy3/oujaQ1eEqoMuZFKR3a83oIE45Ng2lPy4MoVHsOIEudfzCuAlXXx4EmFzjvLI6PtWnTLEETznRmZf47SOmoojHkbTZZDaiiWz/JXa52MxVuoiLMN9th
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(5660300002)(8936002)(83380400001)(8676002)(2906002)(186003)(82960400001)(33716001)(38100700002)(86362001)(107886003)(9686003)(26005)(6506007)(6512007)(478600001)(4326008)(66476007)(6916009)(66946007)(66556008)(316002)(66899021)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?esdbvK2TNgSHJ01jF1psz9Xk7wmDBO+PREexpaaONMp5wbQzH570OOl3lJ/v?=
 =?us-ascii?Q?f9Rm4HMgXcBmQMD2oCacsbFIKdGYHIr8A8Ax0AHZBjaqoDMl5uqKnh6ShDpU?=
 =?us-ascii?Q?5Tm0q4myo6cYk98qi09GFL7nekRZRaG374qj5zGMCx9XnMq/RcEf9aDUfbSk?=
 =?us-ascii?Q?A6s1lCuwq3kDIBDF4KptwJhe0hcBV9ZgtvVNJA41HT4DJIkRKlZM3QqaUmBq?=
 =?us-ascii?Q?8/Ecnu7THQEQ0Sy4LneRPNNlczwekx35Hl6+lE/4Cx6W+wb4ovK5UuDL76+h?=
 =?us-ascii?Q?MNOoc+ae0AnwiczvYctcfq39nFUEgqrRwJ+mwjw13Xt0fMp94BQBPnvniRVb?=
 =?us-ascii?Q?hFy4a7iOx9w59rvGZyqOoJq2xLfrhcY0bDuy4JrZyhdf7CuaXoQOb/YVHCxy?=
 =?us-ascii?Q?zoixaX8CX6yCrtujAqtcmicV7ogHqYIgBSpblJFeY/c18cV3snP/AG/8O8x8?=
 =?us-ascii?Q?s1tigKmlzhYZMlTtEPxlksg6pIoZ6olquOy8VI5pisBcYBY8UoF2yc5P2ayY?=
 =?us-ascii?Q?Mt8cpwh7rg+c3rE00pK277ZVSya+KeVJnJQc00WLBoh9URuoHXsRIMRyclqQ?=
 =?us-ascii?Q?hsQ/nhTxPqaqyxbuOcN+nEthptTdJxt0I6XRXaguEJVOKWXhcqOlG33OM619?=
 =?us-ascii?Q?e+FncMLzH6A9QiUdz0d2Bp9q+aBgFjyGl/plORMgEgRDq28K+O7GGUNKufjL?=
 =?us-ascii?Q?vkeErSQId6G15vptes6rg4jUUSzpJWLtcVNR7DoiIra+I59q4yQ8P7K85noO?=
 =?us-ascii?Q?M0PHiVZbmOsfKsALaSIc5b5jXiwUmAY05xtGCSeCmQOWSY5P0ipy4CtQi/oE?=
 =?us-ascii?Q?ELpwl/WrH7qyE5BDgAcDV4GJ/xiNFRoxKUonoL3ziUP032j/bReS0sKMIdEz?=
 =?us-ascii?Q?yCjJXQrVXyORU9DE/pRFk8TIW18sDej1bj38I6jAWGZF/7MwHrByZprzQNXs?=
 =?us-ascii?Q?P2tpZxkTPS7U43Z/yD5y+nicVkGPwWUzucAntTq1381Q2KJJUYjpIIb93O2b?=
 =?us-ascii?Q?KSh0tker/sgIO3+yqNVK55jJmV3kP7shV5OJZNgaI4/SxocYb0bOH17wb8gY?=
 =?us-ascii?Q?H+LVZj1ppt75SkVANW4dtPB/IxULkFnUOwV8QVfvSPSB6Ui4DrqqpVqhX6gR?=
 =?us-ascii?Q?8Fm6pXqFiksha+QIhrgTWCZXIXVXLnLqanMqhsSdKuOi4b7mTujPJYAue+Tn?=
 =?us-ascii?Q?Y/tPRst07NFQb3njFFUbHXppmwHMcB1C80yfJpAO3nA8HGQbS2a5LLAGICCY?=
 =?us-ascii?Q?JYeEGE2kOU3dq+ZNO515rPlC2Sn1JEIOZ6JXiC2mAx0WJ1KV1WaPsVTW3UEo?=
 =?us-ascii?Q?2N5dNt/qtT+sVhuajS9VznzWUkX67EdGE/dGYZkJOQi4lqYoJHZP73k+C1kx?=
 =?us-ascii?Q?csFLDDvNhTGuNlmc45yDo1IoOqctAEyDOIEzNXFK0ScgfdulxDNbScTL60jM?=
 =?us-ascii?Q?rjl9v9kYOBOvMUwUTejZTeageVR2QZ+9R+JhAgyH9wsVb9wJ+334E/dDlQmh?=
 =?us-ascii?Q?of7gjjlm1hF/8Sx+3RhFyFqSA6ol2v6rxdDLxQ9RTRMdroKPULzSj4/ULTAI?=
 =?us-ascii?Q?oXorHbCm7lz3ImUNRctNmA1Yx3Czr0T1ipJtV3TNL67pHop4iSqJGpy4ah6v?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867aa1c0-d7f2-482a-1ef8-08db5557bfb1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 15:19:17.1879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NxPdLv8Enf300yXk1SLqhguaLGXbSq1i4VQQh2LqlVu6FWdgsrNAItiEQZPgBirUBXj3XqC9aGKmBuzmZvZkvsan8X2zrQRlmkD6u6lOPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] fixup! drm/xe: Cleanup page-related
 defines
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

On Mon, May 15, 2023 at 10:43:19AM -0400, Rodrigo Vivi wrote:
>On Mon, May 15, 2023 at 06:15:27AM -0700, Lucas De Marchi wrote:
>> On Fri, May 12, 2023 at 02:03:11PM -0400, Rodrigo Vivi wrote:
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>> > drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
>> > 1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> > index d89edd98e5d7..6362c4ce15b6 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> > @@ -179,7 +179,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>> > 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
>> > #else
>> > 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
>> > -				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
>> > +				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
>>
>> Same issue as in patch 3: it fixes it now, but it will be broken on
>> rebase. If display is above b3b102692dcd ("drm/xe: Cleanup page-related defines")m
>> this change here should not exist...
>
>Yeap, I wondered about that... but ideally when that happens we fix the patches
>in place again, otherwise we cannot run automated git rebase -x make
>while we don't move display up... :(

let's move the display up then or agree upon not moving it anymore.
There are some more nasty changes need on patches on top, with more build breakages.

Lucas De Marchi
