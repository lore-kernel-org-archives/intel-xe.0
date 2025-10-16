Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884B7CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 14:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB810EA03;
	Thu, 16 Oct 2025 14:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYYqr9ro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EDC10EA03
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760626293; x=1792162293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3TusfleqlNYWHa31OKum5BaMITBM2lBf15FmZ/HGPho=;
 b=mYYqr9roDqAlkZeswpBARW2WOkl/lJ9gPxSS7UXzutpCitKygNZegoiF
 aKjB8tsYumaWUvwZ55zFUtIoW9l4aOqAQFaGBIL+ClF5qPiKdO+/O0O5V
 Z95b0qz4UJLRYXEbnvXX3num9ZWDZlD49RpQntbX2U39TEMsCj/FRSVJD
 aWqJs14rLiZxQA9Q6qCPm8m8XTwTVfMR2/Z1E1Sla0+VRU663C1lKj4Cb
 u2hShJqen7duMb7MJiq06ymGJc1+qp1AEZjqZu0ElrykgEkvWQKqKIj7P
 5kGLR3lKUTn8D99DnP+ctiS2+iZ5Eq+t68uQxttfgxDd+rZcXxjBOlBG6 Q==;
X-CSE-ConnectionGUID: ACVc27FJSdS1f4ed4cehng==
X-CSE-MsgGUID: bIVmbd1dSnmus5dGS/wbGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88290525"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="88290525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:51:30 -0700
X-CSE-ConnectionGUID: SaAACBBkQESxDfJ/aybz0g==
X-CSE-MsgGUID: VSBeqS51TFiVEu31OBo1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="213072004"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:51:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:51:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 07:51:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:51:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCBzQLPGvwzhfNS13SiVufO8BcpmedyHpz4HYg8sPZCdiTCyssqlSyzc+5WZ6cvfjS0lkCafaMrXvAg6evC8GQ3FnDmDohVGi+2Z62tEGfnbrJt25Rra8UMDwqLGPXYxH9uSyDky6CRgfo2U5HGj7XZD9fBD79tLbfI3DpkPOwbL3ZtonLWpDeHAL+AYHX5ifxXZ08CCX+zSiElUAL5ATo8eWWisuBQqzYQUZvUPZZoPDUP+VJtYLsio7oeiu+W+sAsmxtyiM99p7cH2nQMpUdlsQV6e96q6dJZtHjlljFfn0AHcH9dMnuUyubZgT3y+G9rxoLDYhRhgUe5pG61p/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYyYknNxNHDc2A5GdLgX3crxOm+oEbxoKQ2EQNlToHw=;
 b=NPB9U26JzvrMFtSFRczvuD9M2gc8rIZ0e8KmnUze1wW2gotv/03EmwpzuFVJMLceniVfL0JjaKo9tZ/PMYWD7asB/loJ9IKNQ2qPnYzSnCbsQN0mmRNd86yb9NGNFOW6qLHuCdGRvQg1kmT3EyZr8SxIxQmr8oBiIUHGYNwi3kGiuGr6kTxDg5pvdnkYnF5Kk1v3O+aAGvm1SFUw2KyQfN6kuI78cDBwfLNw6Gb/93XR/BNFkRP8pK6/n4IyvncKAQlDjTID7eE+88h23SbdTy5r+B/htdpOqpe7KmzbOiqXclOjYL75KSku4gcoB9+Sb0RgJEQhb963zX+lQ4g4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA3PR11MB8895.namprd11.prod.outlook.com (2603:10b6:208:579::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 14:51:24 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 14:51:24 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Topic: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Index: AQHcPLwdKRsd0GwLskWBa7x77cQcnrTEH1AAgAC46dA=
Date: Thu, 16 Oct 2025 14:51:24 +0000
Message-ID: <DM4PR11MB5456D265121A98810D22D542EAE9A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
 <aPBlcnzi1a3rUZ9m@lstrano-desk.jf.intel.com>
In-Reply-To: <aPBlcnzi1a3rUZ9m@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA3PR11MB8895:EE_
x-ms-office365-filtering-correlation-id: 85536eea-eea5-421a-50aa-08de0cc37a6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?gujo4KXquX28IrQmZDI+aF9MIQzJcM0cCNX1XSqWYqwxIU3qVNBKDCW2qOBu?=
 =?us-ascii?Q?hFcZKh5nPfaq5P+ZclH6+A8MvxMd95wR6x0NOMxT8H370RkT2bHp6uwIHXs5?=
 =?us-ascii?Q?fpBCFSn38XhuFV0KQWKpMZODktsvpccmwaD74VMpY/Hxaw9LqYxbdfFqcOKh?=
 =?us-ascii?Q?xJLvo1YevjWg12wMb1z12VvbWnJZk0pi/W5dMgarkgsGS1Gd/oiEqc0YBU6J?=
 =?us-ascii?Q?Gw5fxirKlTnm/0nzRImJhfyTEzhyLBVE8eP3ZkM8rTL8bPHjtQ4KxzlVHlvb?=
 =?us-ascii?Q?ddazF3IJO/05FRd26HADfRDMwvgoiM/6xFZ6WJ0pmnekJmVrz3TdoD/nSM0d?=
 =?us-ascii?Q?z8UijpuZAuDanqORRi6agqye8od5vaESEt4Fyz5gd2Wh975ith1y3GOW/83D?=
 =?us-ascii?Q?il672/SxEA3V/ZQ5p2yLWdhFFPyKGHRbEdy1coaT34SLXa6OcqOeO5V8WnnW?=
 =?us-ascii?Q?QxDmqMftAJIbe7YhqRPSMYYw4Y61vXvqZngT/qa8xXaEIHn7NrGiorn+caDQ?=
 =?us-ascii?Q?zt+RfnzWlihpjaXULaBHb74Un3ZrcKfuurQnbwGJaR+xYftFIVQd9ug7HOeI?=
 =?us-ascii?Q?x5I7AN4ujeGorHdLh0paRuHJ8XGc2KvJ4nFECLlSNfCfMTzbaylGXH+QQ3Zu?=
 =?us-ascii?Q?wTqQhH5ZlILmm+rZYCsrLPkDN2BQzOk6Js42FI0HWp12SIWPVbzbt/RR1O7o?=
 =?us-ascii?Q?u9N0aG4u2qaHg7S+/z6HLx8hS6oT6iF2kMMF+W0chPkZTcY0yPQu5AYi6b7r?=
 =?us-ascii?Q?Qephhf2BaNL5864hDWiumyW+mJ9jYwo5Ag9YQYrkSCuP0iAw/prT2WoYYusv?=
 =?us-ascii?Q?OnkjhM6dw/psIqn15DTwzy09ZeQXlaOMN9SEN7nLEU17vaco9E6fjO2kbR+4?=
 =?us-ascii?Q?m61CMsDBtbF+p26aptfzA106ap2eB1/rUlSK1f5Z3dEwdwgflX1g2KeRT5Ng?=
 =?us-ascii?Q?dED2NDMQ7LT9tjYY0Lf32W9Y09sBn0bA94HVGO1tQ3M9JeEAh2Tr3CyWvQt4?=
 =?us-ascii?Q?jQSPmIS4u64HMVtZ0ILdjUeoh1nf20EMjtqLFLW/go2V6V7BfK9c2evfZ01x?=
 =?us-ascii?Q?jRBMVkdPLHYIYET9EJTHXKU4av+z0lBLWbdfwqabfdbx70z2pchRZrQWTId7?=
 =?us-ascii?Q?RcnNNJ/NBXSSQ6GcrR3UTo+cxXiE2dA4FAwW0BjTXwsr9zNveaA2zgnGji0Q?=
 =?us-ascii?Q?10upJyvmhkyKbJWjhu1b3KWA8A+fs1vgS5LJaIMIiO6K1IU+QRRXqKITmnvJ?=
 =?us-ascii?Q?5dKPLUnOY83JV22MfdZMY5fA0Geg0Rbljz1Ot9gMHFQqoLcBI+NxYjNJOr2D?=
 =?us-ascii?Q?xeR6GiAvA2McUEa2UFl0JuvpeckIpiA+fU7FGbwQ50rLJ8dWv0TY1jJ5/KCG?=
 =?us-ascii?Q?vjWd+UerKuX+lrPZeelchf6rX5AGZEtG/1t6ICSvf1iI07CMykv3l0INpogt?=
 =?us-ascii?Q?+8ARdL4LgOrw7MsIlB4gf/QCFInxuSCcT1AXduqGe/LOo5qDXtVXRmTWCvfo?=
 =?us-ascii?Q?0vRm7D7OJdI/+9uQROUvTAMqFl8NKAUiRqDy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CQrKBxeoJcxR9zlpYXHy+6ZW443dk/JcaMwpzz1wejRkQJeU6PfcvEVTfxpf?=
 =?us-ascii?Q?fMK9l/Y0IM/kl+qyA5bF8YwtMF574T69jEE/fNUXstfFWzb+onlbHuNbZjvX?=
 =?us-ascii?Q?VPCL3msb4pqYxioszUUrvAa0Agn6b3Df0IzILO9vH6mGW3O3JurdzGI00tBp?=
 =?us-ascii?Q?8TEG58zDUBGL2cP2A9/0cbHEoXdRvsdegtve141sA/4J2VUK9Ci3r0pyrMQ6?=
 =?us-ascii?Q?dk9orzJY1xExdG2UPzj0za2l2XsDmqocIc0E+Autpt/hv22WA/Pq8gLIm2dx?=
 =?us-ascii?Q?m3orreWpUHVADm40HkxFmd6hWLB42xR12qkuegDhZWUj3Dcj0AjACkVkqH/z?=
 =?us-ascii?Q?SUTT9satJyDUePnkxldHe5VkRAjMOrhGPkF7r+GclQdY0dMkPKAtJUEwEQ53?=
 =?us-ascii?Q?wnIUkdkSTvoaTKlX32Uw4OBF632YJaYtO5dUmDgBnsMRdjmB02heN95riIj9?=
 =?us-ascii?Q?v1bc/SmLdD2QcK0anOo9kKNOue3U4G9DvRUdc0fSKcm8RGfzCiaf83xNVGU5?=
 =?us-ascii?Q?hPRFgwjeVJHdB5d28EUphpiU9PrBnZbs165c4xMDdWplBBu9B9SN2fpyFuQr?=
 =?us-ascii?Q?OVbwbP8s5fHI5U2RGmiyIQ3gEVsGZ15f2yMrGdWJNtaE//o26EmqJG5a9rCa?=
 =?us-ascii?Q?6Bau9f/CG54XeoMYyVhb/d4fehJ5fDjMQlvGixGjRejIj/JdDnbmOjzNGnfG?=
 =?us-ascii?Q?GbZa2ATUd8t+eo3ZIOH6nMz5tQMQgiTNJvEAOuzzvLCUQ/r+3yRnFdH6j7DT?=
 =?us-ascii?Q?bepLM5+BShH0vbexSaet8V0Sqa/WEoDdDJzIU1+yWKoTFESUIYbPiTTC0am2?=
 =?us-ascii?Q?UatVa1dIzFL/Sebpp3uvGKp5lqRyQWcP79J0/+dCX+9bFwIIuUef3A/FiC4H?=
 =?us-ascii?Q?806cwBswhujAcgw83D3X7tXoZkg9YpVA0TAUMwvByikEn/ZY09SKDRArIbtM?=
 =?us-ascii?Q?rAONPIyC4aObjXfUX5OMs0Z1G83CiSMimPz1TFZ6s3A2vwXruZRruQfVxMhj?=
 =?us-ascii?Q?LtFbNSQ+hhUp5xS756fGG8UyBLM1N43pXXCvyWFtUgmxRP295u14iuXsjt3z?=
 =?us-ascii?Q?IoPfn7PBhlLgHc+yGA3D8XMlpoxVyff0kBpjSO+gFgLf0Sx34BvXkaXUv1+4?=
 =?us-ascii?Q?MK7AlTeoeESrK8PfjT4mNtLYpITMRBaQfTse5VlyBavAhJFudDXNxYG+qZx3?=
 =?us-ascii?Q?Z3MXKrZYRdRm3o35JKhfAmD3jE+oPCk6BJahHTVrkJd3AdBwHsbu1uok7vRl?=
 =?us-ascii?Q?n74O+KIoOWjW+aJwHvvgmn94PwKMxuo0dZzJZt0q+h3h6lU29BsV3eqHJ8jA?=
 =?us-ascii?Q?wEmWjUamtjibRKMkYKd2/3gmyVUnGODrmdHWl0GnhgZnARX1KIlSTGDcJfZx?=
 =?us-ascii?Q?H0IDM+IDDCvRd7X5q7yK2240pcyyxJgO9/DweXvl6+yW0C4w0CmDSysm/65S?=
 =?us-ascii?Q?TqU0R0AXdhscxA2PVyMssMdz1MuHxD1xape02mrYnSmdyi5cgjAwmqze2wDK?=
 =?us-ascii?Q?myyc3L0rPuH2RqnH5pmDD5JOPqdct3hJlxpombA8ydWlyman8NiTtYFDiQeo?=
 =?us-ascii?Q?DFkyUIXS3DKv4PZS7t8nbIiAAGqvwoULP6JozpJ9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85536eea-eea5-421a-50aa-08de0cc37a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 14:51:24.4228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxP+JhlDQrQExswNEK/S5wQaoTO8K8VwOcIqEyNCC8MCtu0QyaiBCCUkPSP0aObS6/C3I0j97FBzwKfmZRheTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8895
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

On Wed, Oct 15, 2025 8:25 PM Matthew Brost wrote:
> On Tue, Oct 14, 2025 at 03:36:47AM +0000, Shuicheng Lin wrote:
> > During LR exec queue cleanup, if the GuC firmware is not running, the
> > driver cannot communicate with the GuC to properly deregister the exec
> > queue. In this case, directly destroy the exec queue instead of
> > attempting deregistration.
> >
> > This prevents schedule disable failure and GuC ID resource leaks as
> > below dmesg log:
> > "
> > [   50.242564] pci 0000:03:00.0: [drm] GT0: Schedule disable failed to
> respond, guc_id=3D2
> > [   50.242568] ------------[ cut here ]------------
> > [   50.242584] pci 0000:03:00.0: [drm] Assertion `ret` failed!
> > ...
> > [   50.244942] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager
> unclean (1/65535)
> > [   50.244970] pci 0000:03:00.0: [drm] GT0:     total 65535
> > [   50.245002] pci 0000:03:00.0: [drm] GT0:     used 1
> > [   50.245032] pci 0000:03:00.0: [drm] GT0:     range 2..2 (1)
> > "
> >
> > Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 0ef67d3523a7..d2dfbdc82920 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -47,6 +47,8 @@
> >  #include "xe_uc_fw.h"
> >  #include "xe_vm.h"
> >
> > +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct
> > +xe_exec_queue *q);
> > +
> >  static struct xe_guc *
> >  exec_queue_to_guc(struct xe_exec_queue *q)  { @@ -1060,10 +1062,15
> @@
> > static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  	 * state.
> >  	 */
> >  	if (!wedged && exec_queue_registered(q)
> && !exec_queue_destroyed(q)) {
> > -		struct xe_guc *guc =3D exec_queue_to_guc(q);
> >  		int ret;
> >
> >  		set_exec_queue_banned(q);
> > +		/* If GuC is not running, just destroy the exec queue as we
> can't communicate with it */
> > +		if (!xe_uc_fw_is_running(&guc->fw)) {
> > +			__guc_exec_queue_destroy(guc, q);
> > +			goto skip_deregister;
> > +		}
> > +
>=20
> I want to rework LR queues to use the normal TDR / refcounting scheme.
>=20
> I don't really like a direct destroy here as it can invert or we have hav=
e dangling
> refs to queue here.
>=20
> So I'd say live with this until I rework this.
>=20
> Matt

Got it. Thanks Matt.

Shuicheng

>=20
> >  		disable_scheduling_deregister(guc, q);
> >
> >  		/*
> > @@ -1088,6 +1095,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct
> work_struct *w)
> >  		}
> >  	}
> >
> > +skip_deregister:
> >  	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> >  		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=3D%d", q-
> >guc->id);
> >
> > --
> > 2.49.0
> >
