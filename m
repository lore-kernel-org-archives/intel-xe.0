Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A615E81E1E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B45010E54E;
	Fri,  6 Oct 2023 17:22:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F218A10E551
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696612968; x=1728148968;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Yzsytwperc8wfMu854CyEDmb0fnNjzbVyzO2XATpw6U=;
 b=Er+dVh1MjSjLeX3pN+OtzToa/tromuDYfq1RqhQWdWE6exYPh7DzMjDU
 RZykrGWZg4GrDHUQgKBuMhcE45Zclc+JOTdYfSY2M/U5jH+j1aNDx4rZ6
 MYJqSn2+3+zCqUxndK3y9T72pKxCtf5IpDqV3PSh5lC4EEdZbFUVXJQRk
 48Bo0kya4XTfE7o5s4hqTuIck76UnvrJAQWSttG/Qk/vzi3acTFpicNEe
 Dbj1mF1C0enu5ZG2CHVkrTl2ihKdj+hDlkf8gV0jdsF1yvt13wt1MoVZd
 juqkWv7CKyJx8kgRWp1ef9PhhhpQBJmLZbtkTP1AwkuYAeJbneT+Am//V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382656312"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382656312"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="787461112"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="787461112"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:22:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:22:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:22:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcBVi95PiumMXHbT7jyUnLAil1ymdl8cbhHeDCxDm2JGq0iQtlQYx+kXKj2G/EZl4libx4e2Qfrh1LaMdeSv8VcU20J5xaP7ahTp3S10oXAbkr0gwztcU7iHguo4mFAvnBfXS1tfFvzMZjdd3tEc/9VfdvtL1YL3IlC9Zqv6kUEIsQ8jdkM1sVQF6pR88fmxfd1y5zK1aP4Hv+kZvO0k/AttS67TUfIxdMSeWMZzC5FQIxTKoI3R5vpdsbRiiVgK9wNayfB7dAY2qCCHzqzklZHI8vIFPkdfJBprs6t2yse8TUqT8SxDF4hVPlLc1Et8iRb6g2rAygbcEvrr9JxM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3duKG1Ocit3EeoBBIyqdW7sKC9KDQEnfK3s74ieQRU0=;
 b=WWCorvC8dpvbmam/8ur3ZsxQKBayFwqvaZ7PsGQiDH+sXUgoz0ZRAyCr2MC3hN+RSwxzt26F+wPWF9LSX1CRmOO16VtT11QS6AtKHj8upmhfO0EEZ+a1e2N9S0AgMytXI/BMbWVljMVCu9mQwNevbKwDYq9vuPDJptnPnrhdtA1pnem0OJW/AOvpvbeE8jPY4HVQ6P/9Qx3BoTptFP+48a5hbtculrZ/Qm6efRetUdICYn3U/VZdGUTxElN8eg+HmB001ys69NDD6SiKbkpN2pzcpicShHqPYNQkJAncVAr8TzFQ/Xcoh6DhHGRU1YRgpn4NZewEQi7eZYMR+VDCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 17:22:44 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:22:42 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Kershner, David" <david.kershner@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Fleck,
 John" <john.fleck@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>, 
 "Brost, Matthew" <matthew.brost@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH v4 0/2] Use DPA offset for page table entries.
Thread-Index: AQHZ99d1U66hGMIfzkK405GBGGQgBrA9A47Q
Date: Fri, 6 Oct 2023 17:22:42 +0000
Message-ID: <IA1PR11MB6418779C878BE1BE9FBD2D53C1C9A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231005220040.552765-1-david.kershner@intel.com>
In-Reply-To: <20231005220040.552765-1-david.kershner@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MW5PR11MB5763:EE_
x-ms-office365-filtering-correlation-id: 8657de41-9682-4d6a-bd3b-08dbc690d924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7PLNHF+8wxZ3BmZEZLrvrrQFeAbQ4rwTg7Zgw5vHudO12Eii52sifUVKkZvR8VPBAPlXp3+bhRURP5EuH7q4p0mx54xXkMC9yeibJ9eW85f04zM6nIMEprGD80EPAh6NGAEw82yHqLtd+73pqibfHpLw8rBF4yYK35UxeRMHwnWrueFSdFTi+SvdqBqa8lYG8l12GP73Z0ektjwUwKJAF5N690p2GbAlxZ3ZNwji8Dy0VEfSG32fwaZJS3FqE/ROtqQfTllSlbKGbaIc89scy1YwCVaBJwgDjh/Z3KRMF5GG3izFCRePPXPPGlZinxrQkkjMsitJCcnbCHoDkuvT4IXP5ZOiPYMYZaOedSl2FO58QU3Lfm/KhSgy6MBYIJb2eFgax97c+jpUCMTUPvESd1mIpOk76lAOCo3NZpfVE7Pr0BmiUJOMx4Fdxqj0nn3cXOO1wkANEry6B1I8/1T/2JXhBVCfyluOvYLcSFYulTahdqzVd3xkXJYqX3aXASTqLnkaugpVCbvrNPe/KCtmgYOxAxeRtle4RqBdc36ADJix4Jzbvtyqm67rmdGDzJBZE0G1oK6MHEhy6G76Syl+5/yoyweqHlLOjcikYf2ukoH2sStpT2Wm6F8pNzj5x/yOZI5c4ozlmSwo9C+WBroaGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(7696005)(71200400001)(478600001)(9686003)(26005)(316002)(4744005)(2906002)(41300700001)(6636002)(110136005)(76116006)(66446008)(66476007)(66556008)(66946007)(5660300002)(64756008)(8936002)(52536014)(8676002)(33656002)(38100700002)(38070700005)(122000001)(86362001)(921005)(82960400001)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4ouSl2l2yqu7u67ZPJTYd+ykzK8Ign7oYp0VCcPITbC2xpl8mrbH6FoTWfcS?=
 =?us-ascii?Q?TasEJnMV+wKNDeHVquWkFmm5esDo2IfUcbje4DLm2vCK1FOMrPdob8Z7rX4L?=
 =?us-ascii?Q?RxvnkK7pz8seaUEADHwmGFiFyd1xFMd+oYuZH3oJkiWLnnIVM/aMNNHsrHG5?=
 =?us-ascii?Q?yLAzD2RpSgDhKFRiXe2WD1LtH7EZINZh9eCao2aeXQyjV6IhhC81WVf5w2Ks?=
 =?us-ascii?Q?AwDKXQ57IosQRv59I75z+f91foboOuxIzPtBmlwUnta1VjhECme2eeN664T3?=
 =?us-ascii?Q?2bWz8UGR7XH54a5fv/4Eh+Q8UQMyXHByqMAdXhsD1s44MsbzM5qeHvV74W49?=
 =?us-ascii?Q?LzCtphrn6N9DJiYiDkpoT7qPa9XAe5AUm9VeXwOrqUmq4UxhaC+UuMEWpWWK?=
 =?us-ascii?Q?TUFkSU2olyjss5VmsUwi4eBF2IwO8J0rAiPcbhzsd4OK7dstfykvzPACerjx?=
 =?us-ascii?Q?PF0AaUAhZl1dvUAjCgszR/YElSznwXDJmoi4CFiS8Gy0NpQVl97/20FDZ3fo?=
 =?us-ascii?Q?nV8lU2paVumJ00SUBviMvmAdBM3TosJDm60zInHMK8fEbc/LDQgpm//fcEI8?=
 =?us-ascii?Q?TNIVV30JPKvc+8Vj9RDY5Pw98az4FjdqhktnljPsRyQ3j5urQtrrf3EV976P?=
 =?us-ascii?Q?g4QLEjYLB11rOqG6H5nwUjQ/5BcU5VJ5OqHA89jQf2EpysEm6TWCmteqe5LH?=
 =?us-ascii?Q?DItidDqtsw+9XVSYmIYfzTvoNydWTw2UtaWFDlbuH1ndZjLHLXpWACDJ2SQl?=
 =?us-ascii?Q?vTWG6uNpDGHgBG2VV0Ifm0wM1QcUjsIxIBIsR3TgHQEXqs7ixpUI3dJy5SHf?=
 =?us-ascii?Q?sgxmVY736oZfTuLwfHxKg2KmsABCIi42zCPno0Kk5YQCmRQE0PZHxdj+bILg?=
 =?us-ascii?Q?O6V00f3fEiIgp8b2+1sOURVDqqYd+AOA5Ld8uGGMXHrqEsSD3bjI496rmLw8?=
 =?us-ascii?Q?1UAOooVX/mda5U2GOuG6sUR2Vf6DbylfQPuQLK7di63rBD9kL2Isq1WTZidW?=
 =?us-ascii?Q?O7MaUPors6MpixxgnC92vS0zuor+MtBPEzq5Gz+XjX1IwSXzhFWsqsXpPxDT?=
 =?us-ascii?Q?LZ/4KplGdej7SRASeGFopLcKLsuTAEMDQLWkXNUVLhBIe1NFKiH53HqLvKF9?=
 =?us-ascii?Q?0h7DQfez9NRI1wo4Zt63xXGX4CQrEgEzNTKIKPtjrDWxBMTwjrxgZyaJ/HZk?=
 =?us-ascii?Q?jKGHnvlThHUHAjdbZcqP2dUiPkquoH8K0U90noLdklzPMzq/vH/JX2PC/LOL?=
 =?us-ascii?Q?kCQB8tjYP4+Zeo6b47RfFfnHuRO9mDMgGvRhHllCE/WYOqgMVK60XZlKpmKa?=
 =?us-ascii?Q?ZHdslBPEq81Ylo+DJuBg9+i1Fgl32iPbu1Lp+vdZtqjTMh8uiBM+TO8qmQ89?=
 =?us-ascii?Q?i2+Fk8E6+ct3WqTT2xfvlUH9YGDbkO3mCPEujXubDVOReEbGAlsZetDFas2G?=
 =?us-ascii?Q?vD7PQ9xBQMozJnUaG3sxsWhPP0rdAsZmebJU4sFN0MzZfYcg3gCdty5+CWX8?=
 =?us-ascii?Q?QzQwAa9A6W/0nenuGpv4xVKFW6qKEBAP3CtGtS0NL6tdNUvmzv7SkRHkjH1E?=
 =?us-ascii?Q?fl0+/oCLpNS3Ggw9aG/dLJc1uGftOPSy1BD5Mj/S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8657de41-9682-4d6a-bd3b-08dbc690d924
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 17:22:42.3312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4dlgy5Wq3gWnTKlTkrPVeaZamkggE6Bumm6pCQnkF+Lni+CEwiSHd/+DXiZ3m3lz3zNuGHaaXZxw+Oqg+K8uKieVXt8tffd6b0zKt8eios=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 0/2] Use DPA offset for page table entries.
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

>-----Original Message-----
>From: Kershner, David <david.kershner@intel.com>
>Sent: Thursday, October 5, 2023 6:01 PM
>To: Kershner, David <david.kershner@intel.com>; intel-
>xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.com>; Flec=
k,
>John <john.fleck@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>Summers, Stuart <stuart.summers@intel.com>; Vishwanathapura, Niranjana
><niranjana.vishwanathapura@intel.com>
>Subject: [PATCH v4 0/2] Use DPA offset for page table entries.
>
>Update xe_migrate identity map base PTE entries to start at dpa_base
>instead of 0.
>
>Signed-off-by: David Kershner <david.kershner@intel.com>
>
>Changes since v3:
>	- split out kunit changes to own patch.
>	- address review comments

For the patch set:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

m

>David Kershner (2):
>  drm/xe/xe_migrate.c: Use DPA offset for page table entries.
>  drm/xe/tests/xe_migrate.c: Add vram to vram KUNIT test
>
> drivers/gpu/drm/xe/tests/xe_migrate.c | 103 +++++++++++++++++---------
> drivers/gpu/drm/xe/xe_migrate.c       |  27 ++++---
> 2 files changed, 83 insertions(+), 47 deletions(-)
>
>--
>2.35.1

