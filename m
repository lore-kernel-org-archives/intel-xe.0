Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469F1CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B1010E4AC;
	Thu, 12 Oct 2023 10:55:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078B510E4AC
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697108156; x=1728644156;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VvLBXQgiFfJAPM8ifJNOxsbOk6tR7HtF0dXZiZfruRc=;
 b=GBUdQ4DedD4EEyhCznCWlXGkT+kOr0bAm7VotJf9Q49Hj59+O1fJVSLk
 68z/CRSf8XfQVl7L+FnIz0PfUc1MlY+paJKdriwn5BwtY3ZeR5zXaKthi
 NnSdzTtgRHtfa/kew5hNcxNVqq7//iMgBSbaHWXSzbCQOmCxly1TPyABR
 xmFFijq1LcVXk4pZ3Cd7h8BAwfn4KsikhKB6W7cwoi/hAUP+0LDLGHAGw
 m3F+XBKagHZ00/ZZuQprohCCWCIIZ0U0yZKG78tvn13/KC/KgqPf5a9+Z
 ywkHC1SCixN0Fjv2Q/CfvvO+PvCOS3jckVyVpBpoTViJT7dtgSkfIxV45 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388752313"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388752313"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870533751"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="870533751"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 03:55:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 03:55:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 03:55:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 03:55:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 03:55:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRYBehwKyIwTYnDLqWrDNzG2novWoGR5y+DFz7jm3LrP4QxvGZBxk+zCMQwgKQ7DHE/tyuxGc19vrfZ9Yr63jqERNnJgpNUGfK2KipzholMY51WQz3OaCEN9/h8edDefR3jn+ZUUAvGZ5ZSX2/GLZLuNPjqI9AIW5mq1ytkloof8aACE99tPRTLonHwg9tmNGpgOs2fqyTd6MMdNa+7HrYtv5bwzA/NW1IvkxYKyh9qSEnkTAseZGyq0S+yOM7NqmFLBn2Uz6CtEm5pq/4D6OQBf/I3fFURevETXGoe0b/vYi0nWLRwL+sXkzF4JkEXA1DNG5xge1yOfXWQ7na7bBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZx1cqwURo9eWp/D/n19nfjayM71nI5gpqZ30B1ix50=;
 b=Zv//MILwrVQX3rTKmmHNDhv/gTJgDajx5OV0dJsjbIuTqZYfsA7+nqYKHOKgh8EA6to7E6Vm0aHKYwIdpTR6VwKcUQAy4T6n7VN0yurYc/L/Bed2+csbfr4DWxzhGDwAW7ySU5KRdb4X3pXNRR3DzdYECGpLKmlPRHWLEcNawIGUyYemqiyVR34IWMe/NHzgoCbqn7/lu0Hr/b4To44iFCatRp8bUxS8ATb/e5rL2EAntxQJsQf8sodZgioRqgBVN0VESVAi3ySfgWdk8UpXG91wDBgfN2rEWT9AtOGd7ZXBwyB+Ot7syIfKy8Imp9/bpG8TwHHhBhQmrPvV98kaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 10:55:47 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 10:55:46 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 0/6] Fix compatibility issue for intel_dmc
Thread-Index: AQHZ/MqdlvLrdaUMKUWBrYt2ybIfnrBF3agAgAAc3VA=
Date: Thu, 12 Oct 2023 10:55:46 +0000
Message-ID: <SJ1PR11MB612979618F7681A6887D9E68B9D3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
 <87r0m02op1.fsf@intel.com>
In-Reply-To: <87r0m02op1.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4658:EE_
x-ms-office365-filtering-correlation-id: 567d33ff-841a-4cae-beb7-08dbcb11c9e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qGwuc06E1j27+4Rec08Z57w27kyODiXT7U+FWSz6S3AVZ73aItN1HhCkPq1ztr4YpZYPm+Wj53vyXbHJb7awX/RD4hwSCpp0iy1VgQqGgymV5v31xQAh7YSfp9HA51HiLR2IlwdOifs3zvAT+XLpF478TxvvmIdsl8KDWa84KHQyBeE/zkH+LINPVM0E1z3nXB/z9l2LlCg0R97VcJN0qtuTSadbuuRsMrGqBT52Y66j7Sxk+i3GgXX/Hq3vQdLbTuPGZt9533PP7aSPkOVyZx5M9Iutko2Wo1hlCvW6OzQWBcqJviUeZJV8p5YBc9Vd0oyrppaLGdM8QhpcUc4krTFcntGrs/xA538aBPqly14d2vKPe6wdSVG/+P6cLQvor7vknq4qJ0py6oVhJ+8nQbN/Q28kA3GgT4I6Mvxi6iTQXtbxCaXXFzjyLj+ly8HtFSMNDYYtbIooZfic4Q4MtpMUSwEefJ3+/txKXxPeJuHm3YAdl+MRNkiAMC86I0/EsCZZ0QExUzk8WcxKqJT9HaOOO5iEu0QgiljraoYfyLZ5m8CFnqir3dJ/A+0uWFzJeydU8zEdOBRr4tdStKycAtVzhcu9TFN8w5iL+DZ0zw0iVzvMniDz6FSiU3C86nad
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82960400001)(33656002)(41300700001)(83380400001)(53546011)(122000001)(86362001)(38100700002)(38070700005)(9686003)(7696005)(6506007)(2906002)(71200400001)(55016003)(5660300002)(52536014)(66476007)(66446008)(64756008)(54906003)(76116006)(66946007)(66556008)(110136005)(316002)(478600001)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OAHfLarMEOWF9EybgOwLjdpv1sNOKq18ByDl4eRQWIk/rx0/lSBC6slJeXFu?=
 =?us-ascii?Q?/tDRrbP4YXfjLf030M5W5ZsA6R4FLQ2GiKtEcsDItWlGJz19X2FnereX4zZn?=
 =?us-ascii?Q?pg1+uXV9/mGYOWB7XQxc/ckSr6CBPNTSFNxWqG7w8O2rFnxs9hy9YXTZyYBe?=
 =?us-ascii?Q?FF+7nDYfjAgu3Zb2nu3hv2PtYOq1qD0wAPkBe/oZZU9m5eX+S8FAW/hPO2WC?=
 =?us-ascii?Q?/Ss70NQgHVOK8bXIWwu8l8IstK6c0FETocPK4GvDC3sauuOAQyOVv9Q51Nn2?=
 =?us-ascii?Q?/M6dPSLzdLwhYhpGg+2/tLYpnpDVwSwOvoHg2L4OQUlYeqQrX5KLwIpnu6aU?=
 =?us-ascii?Q?tqGPLqZ+GTX7vy9nyM4w0chgPNfVm0fe9iNHk5A/QO93Y/SVbY0B1Dv8ZAN2?=
 =?us-ascii?Q?spAyLKkoKRFHWa8Quy9Ov0aVC4JsjAVUrNbZy4h8tJu6wxueNPU02X5XcHbu?=
 =?us-ascii?Q?YaNnXwfESmzXoy07TSeifdAwmJ2A9X8v/OlpSikhC1rV05tO4GqOEBY0d048?=
 =?us-ascii?Q?pWCQDKPr4jBo4OBhNKUr1lKLppqZ/3Jz+nPVEQc5PmvNUWGSLCBBVGIl3n9E?=
 =?us-ascii?Q?CrMALhvdzJi0iSHTyOgk68h60aItWRPjweOTjKa3FHWugX+T6aXk0m214+uz?=
 =?us-ascii?Q?UlO48i5lqTsMjoJ5xIhoSVA3XaXYcrdvt1uuqo43sP6hKCs1RqOspErbKOD0?=
 =?us-ascii?Q?PxL+SzFb9c/VctBXQbwLfkHoK5gUId40QlSQCGRXbtqXEdFFYrlFajJHsR9T?=
 =?us-ascii?Q?EVKZXPFzpRHUiDp/oBg8sLvjedo8v2hBCeiTOjRemYsENO7vJq9lq4IVm3+Z?=
 =?us-ascii?Q?8/Q6zkXCv/7MpcDzJH/Ciu0hFACbqu6RyrxDP5/KM9YswUtKAxkMeVa4MuB5?=
 =?us-ascii?Q?IrGVmTDDkn5i4xEIDgqGOsMBQ+1aQQff2tT+0/yvUOxWYccrcdW1qm0uJBf1?=
 =?us-ascii?Q?bNTHqS0uB/0l/JGjFwFi8TaraHj5/JZ50/UR/vQi/moCz1nD6DACHzhA6auC?=
 =?us-ascii?Q?JTd07nhqewZjhMJvDW6/G8vALvm45JY6FGXlRqZ0Ia+EyEhUll+7JM+zHAoA?=
 =?us-ascii?Q?Vsu0pHub4Q1PkLM8Wmeapk4ACshrLIGyXAUxO41I3H7RwZhvWw9C0o7/mTHa?=
 =?us-ascii?Q?bi00Jm1iQ9EJFKeiMviI2N7v7kQ4RmudDK6v7DnVGmAT4Ac7SHooVvrZA/VR?=
 =?us-ascii?Q?Xtz4TrQgsIqoCHZoj2RCzz7UU05m4Uj4bWf3iYxlMr5It5VJzE/bckuMWNw2?=
 =?us-ascii?Q?qWh7FApvFKrUruVyrpZhSpRB4u6iKOtxGo+CZdfe19VdbE424EJLPxbbDKkB?=
 =?us-ascii?Q?qSz0qa8CNhBMXhEU2PQTAyAj6V+SlQ2BnokgSe6nBRoX2fB7EJfRJuaFGDvg?=
 =?us-ascii?Q?83q3/XGvByJ/mdgejT60ZZl/u6+Bes5pzSdMGJsGLiBoIh6x8VRmQuVXoW8W?=
 =?us-ascii?Q?bLO3KfTadT1tuQcWXRMV97TePvpCZPRb9NIeWA3WXmgeGoHkktmSeMvqBm2a?=
 =?us-ascii?Q?IK8uAO1D9crgmdFy0TMBMolK2dHuybPHz29EmG/hl29h0KllQnmDnEuZSFFh?=
 =?us-ascii?Q?STrG6dNHikLodMcXmaIfasUJAMwt7Dw+QzpdBwBL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567d33ff-841a-4cae-beb7-08dbcb11c9e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 10:55:46.4756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzmddJ1ZKE7Kqk4LZyCwddDypiwjwelxeffwkZ2mGKYRB6KrMc9lr+3nIGYOpuOczqBa7KAXYqelSWM0kz75lRAt4vr3022caeul7rZwCBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/6] Fix compatibility issue for intel_dmc
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

Hello Jani,

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, October 12, 2023 2:38 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Manna, Animesh
> <animesh.manna@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>
> Subject: Re: [PATCH v2 0/6] Fix compatibility issue for intel_dmc
>=20
> On Thu, 12 Oct 2023, Chaitanya Kumar Borah
> <chaitanya.kumar.borah@intel.com> wrote:
> > This series reverts hacky #ifdefs from intel_dmc
> >
> > v2: Rebase
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
>=20
> Mmh, come to think of it, the last three patches probably also need to be
> fixup! drm/xe/display: Implement display support.
>=20

Just so that I understand correctly, we need to add the header inclusion as=
 fix ups?

Regards

Chaitanya

> BR,
> Jani.
>=20
>=20
> >
> > Chaitanya Kumar Borah (6):
> >   Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
> >   drm/i915: Add wrapper for getting display step
> >   fixup! drm/xe/display: Implement display support
> >   drm/xe: Add intel_step.h compatibility header
> >   drm/xe: Add i915_gpu_error.h compatibility header
> >   drm/xe: Add intel_uc_fw.h compatibility header
> >
> >  drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
> >  drivers/gpu/drm/i915/intel_step.c             |  5 +++++
> >  drivers/gpu/drm/i915/intel_step.h             |  1 +
> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
> >  .../xe/compat-i915-headers/i915_gpu_error.h   | 18 +++++++++++++++++
> >  .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
> >  .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 12 +++++++++++
> >  7 files changed, 61 insertions(+), 18 deletions(-)  create mode
> > 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
> >  create mode 100644
> > drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> >  create mode 100644
> > drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>=20
> --
> Jani Nikula, Intel
