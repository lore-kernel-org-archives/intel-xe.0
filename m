Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61448EEE27A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 04:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305A510E051;
	Fri, 13 Sep 2024 04:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZSGY5ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07110E051
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 04:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726201432; x=1757737432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=25zgGb++G90TaILWB7I8D8RSSKwJO7D3nkpAn9g3WKY=;
 b=KZSGY5apD2MskAbLF1LbES5FG6XEL8PbdKJlduM/8Oc1UH3T3xyBNUhr
 RCrgqmgXVnqrJOqSyLgWwpb66zQxITXB0VgVUFR8dB+5PnuOvzSbNqkrS
 w+cOQuMlLLZZLz6CvAeQKKmOY3Gst0tg957aLMzuEJJSgrWhJs3+K9sWE
 4oYPbFK/W2hY/J1Z1AkzgBcVUUyKHb5m5L7av4dVseLqIS1UXYNJZhirr
 DcsegYlwK933Iudj7T24XzXXg3fjlOxHvF/vKrEGsoLQXtAasd0wr33Hp
 T9+MLMEpUWiv1PvrFI6+bLCeWuouaYSfQ5Th/2hxYX3vQPgMBBgxdrWYf g==;
X-CSE-ConnectionGUID: 3nvtiHugRSaJS0fs+PCRtQ==
X-CSE-MsgGUID: +tvhiejkTcqZ8NzodsRuWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35758028"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35758028"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 21:23:51 -0700
X-CSE-ConnectionGUID: McYd+1OITXKlHXfEejWjvw==
X-CSE-MsgGUID: 2TBdXRs1TmyCm/oJGePc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="98735593"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 21:23:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 21:23:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 21:23:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 21:23:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 21:23:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAfEJVSnOQGI4ifTb/2RTHuA8Wq3VYl0I9IeCAYr51rhaWHHFLtPLyUXLoMHmTEM6dp3I/UjCa0f7Cqf0JxX41CCu1LoiWVZ8wxNLQuHe/0xGjhMyhpto7WuTuZXZ3zTJMSeM5zdA1jEqL3MLGUSLjvNO11DRdGUGlZ9ENmdZtc5gLbz4V0wXR6qkldLcJ/gFgGYQ5Fhrg3nNA1Dp9zZ0vrPtOT1Tc6Hxg5anAoJXxrHaNqt+AvcLa+z5GeLqoKJ+dL6xloZqeSFB9eOvao/ZjlmssquQ/Q6VK+QZGUKqFVrzYwlEJ/zGmP8OY0pPcpWexGerBo2+DnfdbJlB6g/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8eA5f16V0FfTgskmheMr+peqtpLwrPMqKwbfPu+aEM=;
 b=HiJ1+QuLekcL4f3sEShAdUwxycvhum9XCuKj2F1aO+o4l8girbXzcBg3tMxEVSqKHqoQQcXkZei40JxyLe2JjXyo3pEcu3hbMNjbgoy6zCBdyuxj72LcsUwOpS5gqJc4M3W7FyPL068T8oP4dyEyOBLJuSDx+5HHPbOzp07q5BJ69DpMrQ4EdlmiEPD6Cv6tXVa3chKWyzfMTYBAq8A1SgzCNZ1NAyN5GXATLllF+fHk9/sgYveFPF1FYsB065fVbcr4nU7fdYTcLFqPJuZnO0jGqo7WDwSCSMzTVv2hum5TVzkNStMN/y88oPr5DALQ6eEZP3Ew8RM5EzZDQItVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 13 Sep
 2024 04:23:47 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 04:23:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2 04/23] drm/xe/hdcp: Update handling of
 xe_force_wake_get return
Thread-Topic: [PATCH v2 04/23] drm/xe/hdcp: Update handling of
 xe_force_wake_get return
Thread-Index: AQHbBUXMh+JmJPETgUmqeU+q7Xf2bbJVHlgA
Date: Fri, 13 Sep 2024 04:23:47 +0000
Message-ID: <SN7PR11MB67509967D60DBB5B8EBA3E5FE3652@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-5-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240912191603.194964-5-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SN7PR11MB6559:EE_
x-ms-office365-filtering-correlation-id: 210e59e9-821a-4c09-6cd4-08dcd3abdc84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hc9CYvolvd7vjLR9UEUxQKZ+2Y36makj1qcypJ2x18S1TQtOrvwwbKCN76E5?=
 =?us-ascii?Q?AAxmWdWAd97cayil4LHIrpZYeRruLmRock9prA68oHUKNhZ3P5x5rLnn4ntD?=
 =?us-ascii?Q?EJGVcxqf+Onmf8jUQfctB2vEF9RtFcnGq0h/DvpaVpSaBsLI8vcJIpoTNED2?=
 =?us-ascii?Q?t6DYacz7ZHrwEs7ojM1CcPY5EzG1y4mllXWHR3pHCFgNaSpAA+WHsbQyC7tW?=
 =?us-ascii?Q?rRHyxM+fvxlbl5VskFoxO6SBXoVUaumvcGyZO8oAA2SvsSZxH8y0D4qnsL+N?=
 =?us-ascii?Q?dKGzDh6BVKrzMf8VaHYBVt8HAi6vmBbKXYkKyBva/F1Hv6TxyOsE+j7INDv0?=
 =?us-ascii?Q?FIT2zzAiCttvn0bbjLVUc0A6Je75mOZ+DYwXTq/hiE/s/zR5CboVxHSG7SLA?=
 =?us-ascii?Q?W8hZr2N2Fd2A3uqueIWrCfWL0ljJ9RtJcv5j/eEPeiUxYXoPXpfHnUkmddyl?=
 =?us-ascii?Q?XxiKwM/uwCt37qESyokAkFzwNcfwLJ6iJ//Ca5+fN7Bw/5AAIWZemd5q1vnx?=
 =?us-ascii?Q?9vTnnPcFm93t6wt44ikwjiYnKjizBNMwdMcLy6QE3rP5JU/L0pIfIAwec0Zj?=
 =?us-ascii?Q?YqoDBwnzrfKEDzcFUzKlAlidD0qAV+yMwTg6XFeoHHuymjGEIwXUCE/nAX7W?=
 =?us-ascii?Q?Ql1bN//v3YXaCgvy4OU109bwwdm6vLchDkiWs4XerurZBX8g3mO7vexu0oab?=
 =?us-ascii?Q?TjBkJlW08Y66eQSVge0s5u5SkN0qJaw5GlLLp/POvVbGvFc1/laq7svyug2B?=
 =?us-ascii?Q?flGl/WR/9VhO19Tnm/A6cPtgr8ww5oCuioNEERjLJWqZU37NwVpytaoqKLBg?=
 =?us-ascii?Q?jNFCA8BV0zxRTUQMw53dujozzKmn9gaTYl8zQOa3crj1YS6R7UIS0+vc3vc6?=
 =?us-ascii?Q?aEkSyl6cfz+m4QK9dOxhjKztJsCob5V8IgJyVIq93bgno+rpcQs742QZVyz2?=
 =?us-ascii?Q?sz3B16O2BtgZvJzBuyh0+rkCCcEhSnmdWcUYmtZ1YqGAkFKCrXS70oEARCky?=
 =?us-ascii?Q?BHpvCh6O6rH2LcDptQMvMatHhoS7xhDun/R32CQQTT8YugsMz8OGnQgw8LIV?=
 =?us-ascii?Q?XuZEKX7Nau4NM/1cbiJ2HLd+YSrhaZB+Fi72nnCIKc7+w7pPLPomZ5vKMtY0?=
 =?us-ascii?Q?JuLI/KpOPhJUTav2K8UcN6glIPUr92Pcp01INAE9zAftCB7jBblC5YO+Iwvq?=
 =?us-ascii?Q?BEXWtk2z+8LKchQiWnu3r8Atf36R4QxqFRAL2pqZvWOEMcXxcIBVumHXR1Qm?=
 =?us-ascii?Q?aP866Oj6mxObWylqve4F8klJu2GeBXJLm7GfVx3wytpL3lNd8xFfg/5QP+Yt?=
 =?us-ascii?Q?ljsLrsayMRbovOt39ez1hjCBJLEIlVS5XuaEzNaOmKOOijYFv8WIUWIp+Tsy?=
 =?us-ascii?Q?/oz+S8vL4avjr0GqiTm/Gr6G/3VVfkFrY+YeydA0a27Y4H/Lwg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bdFeVlOpHslFahei88nzpisghkCwGDy7+oFqMd1cimIDry7I6tG0qiu98DsR?=
 =?us-ascii?Q?7u0lbchMV+2SzkLjKP/QH37nRzfFnjrmbxIeFruU/DFGrFeLXUdIvedsoukq?=
 =?us-ascii?Q?cR7Z2b8+yuzuPO7Qs2zV2y/Fhac8XfINp/MEijc9errknlbSfB6feAFLIXFx?=
 =?us-ascii?Q?TVrzZq/ccGH0tG9juINpP8XT/2q+0Jbm2+9iJ8DJjlmKin4ATnAP1VqEUTQL?=
 =?us-ascii?Q?dLxMCcyz/C9pn2hiD/mQWpXqEvw1BhOZLM/t3yzpDWLGr3ET5lAhBIEdmn7F?=
 =?us-ascii?Q?PcRaNHCacNLiATZCgDBw6z2UvtzoSXmQF1CibgIkyZjO1rN5TY8ycwrYER7q?=
 =?us-ascii?Q?7ynVLR5IKJo0Bt8NTTES5Frp8m7y1E6L33VBazJJ4oy19ZChwf82svp8inWI?=
 =?us-ascii?Q?wJ+kmdarvud2vFHE2JgLEkO/SLyHG/brw7FkzcwHRMG2ZRfbeQDlCFF9qqjJ?=
 =?us-ascii?Q?uMvvXF8ycTJus4bPQpWP/QIrTsHZ8XbxSStQq8qxBsByzu4zkXd/FGpJXry5?=
 =?us-ascii?Q?vl3KHs016Kh/VPkn6CVBI5OwE+K6WNSTn4lAcG+M2HD/owdhRsI6E2YkXgdR?=
 =?us-ascii?Q?Poy1hFXAIGeIjT0JtKy4iAVA8pB84fTD+XVg+6YBCvkU/PxP5cOzkyxdh037?=
 =?us-ascii?Q?jtoQ8/gJDqv9pABXIW5SiPkHo+9yrE4BnT+aA0mz6WMOf1s5UB0GIiJUj5u2?=
 =?us-ascii?Q?2DZkoQMgwswzoiiEdWYZECPH4mkBh3wrpfW4od/BT5pBGoP+8D+79alCBDnt?=
 =?us-ascii?Q?6h+qMGhYTmgbDaKDT78MPnvz82cWNYkIIn9DyCyPMvkvl/tugMqmvZoo/odw?=
 =?us-ascii?Q?8d+7j06myf1YwDOUJ2wnIF0AnKdWCisW8oVX8gmjoG8Caya1NEKEkOYm+tgD?=
 =?us-ascii?Q?4rGtIlyNpykoAKSWjMsrwfU3WmmlywvoztoIuBOqFcerbLmgXAsVF7wZW7Fe?=
 =?us-ascii?Q?oyn7fkqYdwaWYCDeoOK3sM975AxmIqsOpyih2DbbI9J42rJtHOmL1fvUngW2?=
 =?us-ascii?Q?lwZkEz963Y2WKlT9fVljAZ+YEHRQ75eIgoGuRdypcAa5eo3GXq/G0POHt8wj?=
 =?us-ascii?Q?oepn8szqcnX8oC+3sM1kej3fpiSojr3Mxqr/pUFJqvMWurQGPwSzaLS5Uqka?=
 =?us-ascii?Q?ZXB2q1WEysf3Eyp0vAQ5g0MGFXG8xVfaQwYKoyrpOxIFX5A22ZEm4puwQmR3?=
 =?us-ascii?Q?EdoABXzT63SpI4ixndGpp2HArZrHhxl/1E/PNkv67Kb8kP2/zca5+b8rKYjG?=
 =?us-ascii?Q?et5xbO6+BWuxrZ6Zg4FKXMNG9Q1UXP97EkRDxsGGgzwrsoU5HMcr3AXkHmVh?=
 =?us-ascii?Q?zJs0bPuBArLbwo/fHUqMpq7UQORIZNRVrA6GyT6/vllr7qeAhVbfYIqG9l45?=
 =?us-ascii?Q?bjAwD9xmCT3CV9rC64WRTfxAA023L6yEMMi2E+cZBx5+9+EH/6r75rDjCPpK?=
 =?us-ascii?Q?a+28vMnToajdZ+Z88xbe43LgvT2LrSanbdK4ZFPuo6mECc3ekBLP2uzCY+TR?=
 =?us-ascii?Q?lNh+KsJqwxjdb6ofVtz+PjcCeCQEloBjtwzqEs2zSahQ5u9EW+AclDCfJcQP?=
 =?us-ascii?Q?1MkCAS6L6Art9XMyjsUK7wo+0VEKCaQrKnQBaDyY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210e59e9-821a-4c09-6cd4-08dcd3abdc84
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 04:23:47.1883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEL5dimSDmwFQ4AVojsS2/sF1k70bJwdgwtT42OOFZgvOnWc/8hklxAQJH8p14h5YCmdNSTTFtGynLA+g9IvAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
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



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Friday, September 13, 2024 12:46 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Kandpal,
> Suraj <suraj.kandpal@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH v2 04/23] drm/xe/hdcp: Update handling of
> xe_force_wake_get return
>=20
> With xe_force_wake_get() now returning the refcount-incremented domain
> mask, the return value will be 0 for single domains (excluding
> XE_FORCEWAKE_ALL) in the event of a failure. Modify the return handling
> of xe_force_wake_get() accordingly and pass the return value as input to
> xe_force_wake_put().

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 6619a40aed15..1db8a5c62f60 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -41,6 +41,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>  	struct xe_gt *gt =3D tile->media_gt;
>  	struct xe_gsc *gsc =3D &gt->uc.gsc;
>  	bool ret =3D true;
> +	int fw_ref;
>=20
>  	if (!gsc && !xe_uc_fw_is_enabled(&gsc->fw)) {
>  		drm_dbg_kms(&xe->drm,
> @@ -49,7 +50,8 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>  	}
>=20
>  	xe_pm_runtime_get(xe);
> -	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC)) {
> +	fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref) {
>  		drm_dbg_kms(&xe->drm,
>  			    "failed to get forcewake to check proxy status\n");
>  		ret =3D false;
> @@ -59,7 +61,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>  	if (!xe_gsc_proxy_init_done(gsc))
>  		ret =3D false;
>=20
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  out:
>  	xe_pm_runtime_put(xe);
>  	return ret;
> --
> 2.34.1

