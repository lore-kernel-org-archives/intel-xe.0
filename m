Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC180C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 08:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFA710E2A7;
	Thu, 16 Nov 2023 08:25:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD6810E2E8
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700123133; x=1731659133;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xCo9aHhNVYSDgNhbdjHFcok9qDkd/gzQqUtxt8+M2s0=;
 b=lVGOJUxe20ILBVZe9Jx/YDJG13f2p3bNyw0jbS/7WZMuf1lvgFp/jkWT
 4e+F8h9YPHw1krIiWO1G+EVGDzfcFmS4M8FYo8WWPVOmTUSuvczaGBfB7
 6qcdZBx8U0ugo73ebN22GDMgidPpbVIr/iIos8oIX8zKH5sGyWZXFHTHj
 N+lWqhJiLRTBHUcARhVO21wYq//+xchstnzk2g9fol+L0MRTFQL26s9NA
 mkSmBszHkRRr2C07W5aGtohk4u4H0w+f6ljKMrAs4r17tvyIe5jYZGhSE
 vBoQJB3uATeU1yVyrU4BRx84kY5TumZ6LSNw2pZf6yEwnXj6LBNoJQDaV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="422134378"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="422134378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 00:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="13040778"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 00:25:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 00:25:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 00:25:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 00:25:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFrkZGn60Xr2ACkzS7g/UPj/oEKrOzJzBijuM8tigcyTbVkk4EYAdbLkLPjeWtfI6WjoPRqEuNCkupiMk+/geIv6V1ExQdGc3981MZoRZo09mqtct6VW1VTbUxYeKum0LkkKL/4/jNVr5HQm/oiuwAKqMLB2PLm52a5vAbSd1/8NKQjfBL3YiUzSnKtS41xUk3LAFUWMCJgmZaZIn/TzwrgFAooWT7vzYhEhabP/UDUxgnn5JBVBjxvFUsxnsKvgkOgf40TXAWhymyEDczE58VQ3Ll/wkC5hZXFGHCb6eze1C5VKB0WD4HVP1myTfbb+Q9vDsv4B2m1Nffjv9J48Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECVdzll1zHLTYOXe1O0hqMEwpPmRYEpm+FlRBL/tR8U=;
 b=jxT4ieLdXRqOeG9OIqgwEOhQYUG5BQ2AJd/betP2UUrHWzvP68vVEi4jbFafwTI7m4qjqdnWcRvbEA7G3PVMW2qpmKv9rN1xlZSVeSknapk404BPPgi5+07YlXCZtU9f/gwlVK1f+c5nvItQ/4Fm92QWMMwzTuMsGqN/pgADY4IuE03yjJ/j+7Hrr6XTmw/JTGnmgAUM6apy1xQ5PlakwQptAmYME1hzSe2LFCFG5rhmSofNUILTPwduF4cWv0l9dXQvJePZOBnWoK1mbxHdbCieGM2ORt4I4XxrHHQBHAfKVttegImtz2zNrY9zf/qhzFUskwKxDDp68UdxuNGcvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 08:25:24 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d263:5be6:37e:bb45]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d263:5be6:37e:bb45%6]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 08:25:24 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/display: Handle NULL ggtt_vma
 unpinning.
Thread-Index: AQHZ/ejaeDpCsvgR7kK+S3d3KFjBVLBH7bcAgDThfWA=
Date: Thu, 16 Nov 2023 08:25:24 +0000
Message-ID: <CY5PR11MB6344CFEFF3C0249AA185AEE6F4B0A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231013151452.52457-1-maarten.lankhorst@linux.intel.com>
 <t7vmgosuher6tyz2vdjdfrnsleyzempabo7mer7gf4i433vybs@xlfjgcz6psl4>
In-Reply-To: <t7vmgosuher6tyz2vdjdfrnsleyzempabo7mer7gf4i433vybs@xlfjgcz6psl4>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: juha-pekka.heikkila@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DM4PR11MB5328:EE_
x-ms-office365-filtering-correlation-id: 5a3ac6e4-72a6-40fa-7762-08dbe67d94a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P8x5NCcxesVmOVu5L8xhBC5rjG2S2vKMQYd84KSMK25gVxyOTBR05SQvuxGTkfFD4N4TRkVIlb+OZHLzTA5VU2/AGobOPeMUu0u8AfjhQVRja45w6tm1J5doezGDjWLENlcuNMDnULLvZDiKsBVh1KucxWdlv9s1813XucsfmjPOtPEt+xkbpcJWzESttmPa1+Mt8A6MlfLH/zzY0JAF+rjyvRH2Xjj/hVq5PLkAKG2CHDphyQBtS0crjfVZCdvjU9FESWh/4w0gvczL9XjJka2UmjV/GULf6LKTaGjOJrrsSEzhX6Kw7KuehLFHx3Na6HL6zglgDi2ZbvposmQUqzGdyh+vHY/3IXbmUm4blFSpmB8lKas7t51eoWm0PIO+MWTuTRnzd8rKCcBicdHe0vGRC99sFD9+hFMnUtNZzeChLGRZDi7KavMnSnEXxMOEQLHdEg8hHcR778ity2UpO5YgPMPjH7JlcbU/FnewhVnOZmQMyy9MCdxmtD1kE53d4l2XZb/GZ7m/5NMG7Q9NLhAbpRGdTzU7VrSoa8afXF1tAWOcbxX0129qXmiJ0OCIELg4zWyAuAm3n+nQe9FTkQ1QYklqVPKPqzeuzXkF5wk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(5660300002)(122000001)(83380400001)(2906002)(41300700001)(38100700002)(64756008)(316002)(6636002)(110136005)(38070700009)(66946007)(66556008)(66476007)(66446008)(76116006)(6506007)(7696005)(53546011)(9686003)(82960400001)(55016003)(86362001)(966005)(33656002)(478600001)(26005)(52536014)(8936002)(8676002)(4326008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ojWdkJXexKoGjFLqQKkT6Hf2zr99T8uLZF7/B9qqOdk7FjxfBdGDlS5Xz8Qi?=
 =?us-ascii?Q?LDthqjvHQWifMR5M0Wbq8gmC8vBhnim6SdC8wATqpUV7QW6/bXc6DmCY1R8u?=
 =?us-ascii?Q?kN5HtIgN2gG6lD/ZKCw6ytULU/tDafdEZU7ZFkXzxyJjPCStvxHuN/fSUU1e?=
 =?us-ascii?Q?4XytFasB1VIRbLJIbQ9RZ2fpA/h1FTnmlhKA5iH2IYhHNPuonSYM/Z9wDCnE?=
 =?us-ascii?Q?9zdS2XzH9ZmivK5xlGJXvWhD7rXHmqcsBWA8JN8VjRkwFzDWlrlgw0DLZg9k?=
 =?us-ascii?Q?m749fDYh/D2vR+QluQfXZq4QAOWpKOuw+MsoYu7Yy3CdnKixnF50Xby2Nw4N?=
 =?us-ascii?Q?EGn2oJdQ6y8rSzz1q8PiAgv7xNdfIbxIl9RFyMvV5VNpaqcclLtpefWGw0d2?=
 =?us-ascii?Q?SjdrI+fMtKa9bQPoPp407K/1D854mrpgqnKrh4hL19ovQKpOYwbIWcIQhKpe?=
 =?us-ascii?Q?N7kYy4scHFsVLAzyS9LS9MA7zQufTfVgFEV79YSsE6uP/QyeI7xa0Jh6qSM3?=
 =?us-ascii?Q?Dqj8/NKwyY62KCvpIZ7FIWIu0vwNP3j2V+pWMG1S8GQnhQtk9x/L2pGM1a31?=
 =?us-ascii?Q?apfr8ccWKsMwwKfVrpMMab7qqF4JBeyolwGQ78dIoUd8UCQ47ULojIU5X/Ot?=
 =?us-ascii?Q?px4dx0rE/zedJs6bUsCiMDeRung6R5bsi6MnPFPnehl9CLNdx5cu3fBhcpvs?=
 =?us-ascii?Q?eUlKc5BxkLdAxysDpxK5FFvpiBSDVU8aYsUt0UtTE/w2SQmejNb13Y6l5+ZZ?=
 =?us-ascii?Q?tvvFNXhKDsrGMeg+bOJteBStR83NQVvL69idGLHQujxMGfyUIRruB0NtbHqX?=
 =?us-ascii?Q?k3mJwgnD+fJ2hQ6CJ83KTRQ0CqWoWbken6y6H172LzvozneOdA+nysto2fpK?=
 =?us-ascii?Q?sqYfcarZiXwfiWgw1PhDuQHpJ/dOX9vxfinvO+b+MNRstZvLjI3wnIS1ifZr?=
 =?us-ascii?Q?S67OZ619Ow5Zk7gz38r8qJniXI3NA/G3jugUFUdCxVP3eaUq0Qcjabr5pWwX?=
 =?us-ascii?Q?htRn6zJKS6si7vLziUudfuAa0AwlIeVkmvegZ81jqRQq3Mp3b8s0zEKhscSD?=
 =?us-ascii?Q?g6nLcAb9n5Gq/vwWk5ht7AU6XIMq+wPsJni8FcbcX3u5NXSLUaMh2tOYnRqO?=
 =?us-ascii?Q?Vn+2jju7Hndmq0RKVF79xWTtFhfEiJ+VGRkcvNNebXHw9Yxkkru6HZYleTvz?=
 =?us-ascii?Q?RYF8q1h5X5yEfMjC0N2s/2hpyDRIZQemgi17CV0DhE9xFGyDbxljwVsnJiTK?=
 =?us-ascii?Q?1SMGzZF6aYePW3p+CoxV1Q5DgFiVOd92Ch+KADyVSZrsvmpKCozN6k+HSiLw?=
 =?us-ascii?Q?u0JWzRvRgNPJKcX95UtkLfIBKhgQZu7tSOfPna+A8IfS+/dqQM9+BVruqVjm?=
 =?us-ascii?Q?uNM1bZx/9cmP3JdyDbPLTNrrozbkWx0ZnXYA0J1n8rpUVzIwASe2Y4OHWpjG?=
 =?us-ascii?Q?znzOLChTT2ayKCxP+eGOMlWxEk7gpt40/5bVr4IjtZfe9tr6XwADcdr4sBnx?=
 =?us-ascii?Q?RjYCVMzXzZbdBEZduUA0mrae3gr7frkCZVZY6fvETJVWmsnQjHmz7vwKVCpo?=
 =?us-ascii?Q?0xcGjdCiaKvKuXrIx4o2S2cNyjG93FD++zzgOBws?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3ac6e4-72a6-40fa-7762-08dbe67d94a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 08:25:24.2136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+TWpcqKNOFfVjzfDtzYgqU7lHW3PvnA8h/NtFi7WinStZznzLBXhKO1ozrWkRdIwmg46MhRFYrlrOYZBxGr/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Handle NULL ggtt_vma
 unpinning.
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s De
> Marchi
> Sent: Friday, October 13, 2023 10:16 PM
> To: maarten.lankhorst@linux.intel.com
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Handle NULL ggtt_vma unpi=
nning.
>=20
> On Fri, Oct 13, 2023 at 05:14:52PM +0200, Maarten Lankhorst wrote:
> >From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >
> >Makes cursor patches work on xe. Probably best to commit to xe as well.
> >
> >Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >---
> > drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >index 2c36e5032433..48d394e152d8 100644
> >--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >@@ -324,6 +324,7 @@ int intel_plane_pin_fb(struct intel_plane_state
> >*plane_state)
> >
> > void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
> >{
> >-	__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
> >+	if (old_plane_state->ggtt_vma)
> >+		__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
> > 	old_plane_state->ggtt_vma =3D NULL;
>=20
> any reason to deviate from what we do in the i915 side? There we use:
>=20
> 	vma =3D fetch_and_zero(&old_plane_state->ggtt_vma);
> 	if (vma)
> 		intel_unpin_fb_vma(vma, old_plane_state->flags);
>=20
> Also... aren't we using or going to use DPT for MTL and above?

I think the ggtt_swap logic which Maarten introduced in=20
https://patchwork.freedesktop.org/patch/566831/?series=3D126202&rev=3D1
may need the above check.

Also we need to make sure DPT path is taken care properly.
@Heikkila, Juha-pekka Can you also check this one once.

Regards,
Uma Shankar

> Lucas De Marchi
>=20
> > }
> >--
> >2.40.1
> >
