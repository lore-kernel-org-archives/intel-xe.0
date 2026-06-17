Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175D8CD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 12:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD78A10EF57;
	Wed, 17 Jun 2026 12:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzsYeQeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D00810EF57
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781698372; x=1813234372;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TMhxaor6N3Z/K1yJPkJ4vG+fq6vXDCpEVPJ+RiXaczo=;
 b=VzsYeQeQWfIGI12RFjo5JZQh6k8hVwCGcd9ADWKZCbAdJtZV5rk2Dija
 Jc9sL6mRIUuoGG+5EIFVmZw0odtvDifb8ikb4+GEwxCd0wr8M+MByngXL
 ryVVjpIfWVU8L1/gQK55FeR4AGgwf+DroWcFhEOsHScYMDXp2Wz4mTLkO
 lhIkYsOnuZe98WwCpU7wh5g7ugvwqHW90hUrzBV/wj+FTReC6X9s7EYVt
 ZKhDc1aDfJ7PpIHAYTE3lUu22xRoUKikiP8WVMYT/JFztvwotlvobnCOE
 wXzDCKmVytB5gpmB0jl4tZULZhDxLj0ezhr7HssFWPlXbfisKxXGmtuQE Q==;
X-CSE-ConnectionGUID: cgsshzpPRVOPiz3mwB22hg==
X-CSE-MsgGUID: 9imVxNJCQeCJad9RuEU+2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93057494"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93057494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:12:52 -0700
X-CSE-ConnectionGUID: PC7gkTYaSJioI+ZjbTxp9A==
X-CSE-MsgGUID: MOJv2otFQAKG61ZKGClQ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="271765470"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:12:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 05:12:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 05:12:51 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 05:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5tB8GkgWrdusIAIWuAiUITDxvLW4rKEuJlUvy6/jhkVoPWR2b22lZsYR+sM+Pdy9TocmteKRpVdIbKlm6HvDpg33udAcTUJfiQv6GUX3DxZbsQkN/BzpQ9efpgZn1XR+A1WMqhZ06P42sIrhqkhEbwC26Uf5Kuq1vLgItrRogz1VpDw8F30wVQv+hyjRlhP59g5dXD9SZuYnJ3jgBjCURZKOtBYrmCNdPEDHxAnawFk05OiXoVpbh7KjV1opkdQBBm+yZWP0y8xc0l/O0traJJt6K/lWZ1ZrR6YGIuB7o3vCHYfn546xGJ4uk7q7K3KjCfndUMYPz40J092L0ZCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnSTxvP9BYWlUWwLHnQlIhKt7VoOBCafkykIzwLk+G0=;
 b=Bt5CeTY0Y/in8YMJIcjNYLEVVhoQxAXM6QvjB9Onsv0jFZyVJC3AryLjFl9/hUlWzmFd5z7gArbJsp8zhgSHrn80r472GkN31y/1a3H8k/+hOFPtaUpeO+Wait5vD+GRGp181IqAfNqwQF4WbaDwUQDqbe8sv3wvYtXEyqQqdhOtiOQnJrXOSQE7VCm7rX7LyPKtYnY5Af6PMin+/+oF4kU1zXDV8v+RArARVhmoy5w+wIS/v9t9Uit1eFF3w9doztRTJK02oZAg9oIjpR8TsvMg9IUp9mqfxj++RCTDXJ/fKERSj9yIBLu053GCx4DJjbXeg6PW0Z752LsvufK2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 12:12:44 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:12:44 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Subject: RE: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
Thread-Topic: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
Thread-Index: AQHc/jJPmagXjUd9qEyGGBaQF4GogrZCpE0AgAAEGzA=
Date: Wed, 17 Jun 2026 12:12:44 +0000
Message-ID: <DS0PR11MB871894F6D9D674DBFEA7C05981E42@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
 <ajKLdJIoHYBCIMiz@black.igk.intel.com>
In-Reply-To: <ajKLdJIoHYBCIMiz@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MW4PR11MB5776:EE_
x-ms-office365-filtering-correlation-id: ec563bd2-6502-464a-43d9-08decc69bcd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: aU/VqV8zUXHJ870nNBCP3jPDoOZF3KizWLTeBTs3GtJpY9Z6m71gxS8OSsiiFR++fTiPFyTi/rTZ70h7orNjGVa2Uy9JeM3+oAetvaHa0/v/gSKhWhj24NFomLQriEBuWoI6wbwnST3NKCbVkYoPOywDqpqIYiN6zoyymgVOTGBXNnF9hwcp/55TSrdD6MJwamoI5wg/D4GKIwJpI/85sJ363VCC3afxqN4oRj2y4kE1b/QSLFjh5hw7nnDmLdUuTZNPRyO9xviSe2tc4FVGpYDK2/mUrAmUrJR+9XVq16jr5ahJp1Mi9l0jNChCYAQnaPn1NqNjBZGv4KUSqfxSQrSN9DX7p2e0A0eI5in3Aoou8yFb/YjfkU4q//GKDjBIeuHIlzhnTigGLlPyTKlEvN3IWKEGsMeyII5d6IP3ANZzqqTCf70FZ2CANuK1ZOCf3wn7ljW0Q92ulANHWSZq1nqDhWs6kYs4cgD7FzL3ywo0CPO4SdAF1IQEbbEzAFqVSWgVWcZUWrntFwgD6HY72mo96IPPL87Dgwfo2tAzSA5osYOv3CnmZXG4VLrR7Ti3yrQifL30UPLDC/oUeQ1YTfdziX3jArojKtYanco/Md7QCUE8xD+QvOoBccOBHQ5fA4UxlVCKltiacr829XOZBeLNp6c81sCUBLgBhGUHcIeWWw4Pn3/fVQr7FLKK25FipdhmRN3JQWl2w74iW8v2FxwleEjuNR3Ka4ddwBdfzs2PDMAKuFgSrCfQ/V3EK0Xw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p3yHrWNRH3014Vdms0jzkW127K7iGYaHQWxvRvgmkJzntcMQ848u9RADBsZL?=
 =?us-ascii?Q?SiBemlo/FspomNiLe4VC1RQxeMFxuQXLn+PoOOqZmscUiaaa5+ol2MfUufff?=
 =?us-ascii?Q?xtpmi9LFKmB+8nFcXB/gDAX4YZuVpR50c3mnu7bfKRCr3i9SrwlMrNh6eJ9m?=
 =?us-ascii?Q?Z3h4Tgfd83h2s16Db1SkXuuGbRGmSILlTRMByXlgpwcwE6BqUeuiyuKh7hFj?=
 =?us-ascii?Q?oIcIBfUqcIsDxS/P9FAm5gi7N+uu3IlaOx4HNBzqzVBmT4U9e5a3TAz1ulxt?=
 =?us-ascii?Q?FEmfYN1hOOEPARXuib5gdlm8SNqqAAeKp/QD5owymUsrYGeboOzppfaGJT19?=
 =?us-ascii?Q?pswS/o94sqOXJZn5EVqH9PdyGZ5NuImx5DeiUvLpFaobRmNrQKldmDhJWYF4?=
 =?us-ascii?Q?ElUZcslnsGtQ639IrLXe64H6WSAciQRlrw1GfxSy/8k6RcXlD2i7M+BkRJK3?=
 =?us-ascii?Q?JHkhr+UvRP7mrxlQIj6dNGLQEQnbNS1tRUe9aO/O0QxCkrrWJFhm2EbrjQdx?=
 =?us-ascii?Q?awf9LihfkZ3zCOtHts4AVAFxPZkHXQ0jhDthLcBKPNpRwk2VmN5WnGzl92u+?=
 =?us-ascii?Q?ybDJuTbQymD3jyMqr9o4PpsvyP9oZzQGeKKDA9gitAZDfxjFybWVa6cuZHMy?=
 =?us-ascii?Q?Dpx5Lx3ShSsbwy0NYBV0YUoxVmCYa8uprQU2QLl7092oQhlWGXKq47XqUSCG?=
 =?us-ascii?Q?tNkuXhZaSVWnXLVLos4VcgvaWbH/GEMWhUVnmpvgPA996bqXlKKrcED4MV0m?=
 =?us-ascii?Q?PTAT0CwjWW3aMJ2SyM/QnL22b4575TAPw4sL8EtChUPa1MUAGfNWbNxRkPgS?=
 =?us-ascii?Q?fX2e/h/xH5P9bNUpygCFMn7JZ8LTQqrTsWcw2mlISYKxpWy0Mv08z3FqHbGD?=
 =?us-ascii?Q?OQc7+bIrVTiCa7dY2LvEwQvRFzV+MN7i3TJXzMSX8QEPozHRnxD1vWzzrVcj?=
 =?us-ascii?Q?+RxEKSJMlixNejv8nnpt1mPFDi6lZH7H3Z7f8LsU+C96Pifn7Mop+8C/3HDJ?=
 =?us-ascii?Q?HS04uZ39HqBolLQGGshTMo1Asuiy+BkVk28WjmblqKi15Q9RC9ht8U/ai7b4?=
 =?us-ascii?Q?VgxoQcD0GFrk7/7ChjJltWDTbFAObEA/zwJ4JhppLpZNF+tjEKx7T2+AvqWK?=
 =?us-ascii?Q?oz9vDCrBcJYx4exOa5j9bE5gdlI5SG8ZlFYmtvewD15l3D7de7K9bO3KvthC?=
 =?us-ascii?Q?otw3C4n5SVHctEseW7s9Lm02qgjNDZ1Rt3SE7ZOkcdzsgpXuTPgCkVPtqZ5n?=
 =?us-ascii?Q?4AGI5r6bH+qUCpCwv/zpLodFjzuYLqD5oPBbhrBsy50vpsSkISJ7ph4b2uzd?=
 =?us-ascii?Q?1TTxJcQe11Ul8HcWliXZRdOjf+mpD0vwtIbbBt7YwHvXOqwT6yx1UIG0CZJ2?=
 =?us-ascii?Q?DVhvduOLFPOziQjbSddMVqvfzoCqf190MBqSFXp7NukLp8yTifGzrM+4beyH?=
 =?us-ascii?Q?ZOKC1H1KkMUZJf2rhWk6BuyFbvEy41Ar1+m4lcHx1xnBXnOkBPAi1KMW5V1S?=
 =?us-ascii?Q?TpOUTnR3DtJb7KEp2HyU+6JkLdxuctSE/OySzkAoROZNc2P9fxROcj9ZHuxA?=
 =?us-ascii?Q?oTc1yfp7wcI2V8maQI52s4xcssu9sj865leSMC4q1yewxzdWzpuaubzVrpVz?=
 =?us-ascii?Q?Q3jgEXZvw6ECYW3dDOttRlPI/L04YaOI2yhqJ7dzykl7fCtvOlgfg+runeit?=
 =?us-ascii?Q?kR8WMZqs6Yc/aLMaGw6Hcw1GyToR5ywxiL2h1yU5librpJSSYgl7kbycz8kC?=
 =?us-ascii?Q?DahfGN4RZuby/h5/Z3RS8jVsvQtp+4ec4SQzjFOuVcqYKJm5Hyi8PZ4pWdZR?=
x-ms-exchange-antispam-messagedata-1: gcI7JcfyzCP9aw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fSP1AHd4Ui65GdBdJVcC5m+9VEwU1IImyyS2jfe7WLIbj8ollilXMaCFzf/UWws27m4wEgclX+Leo8oWh0UkelCv+tlwWMx58MTssFetBLKJ45AWWXdXJ5RPd8N/S6Sy8eulaazImNM2PHOg3UAeb3yCf8Z/ciRH6NIKGrkGMHex/WksFx9CAjVQC9RQR78VMduOrNVsTu7AsJNac8l9E2lXl/mCbz2BKapFPRmHJYHxn8Haw/eU4OUrSfs5jYUqSw8d15didP+AEyb8GIiyNbvfY60mtD+6YZCC62I9pf/jxrLw7WNdxuNw0WlE3u8/6fpBdDWD/uKslYE6sQ5Ecw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec563bd2-6502-464a-43d9-08decc69bcd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 12:12:44.4932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Z5PNxCCSFMSpBfMVFBxasDSFRMR4f4EcbGjyRfWz4X2z/+DgXByB7wpX4aKK6gPxprd2vYy1QS2/5bubQyrZtGKD5duZsg+9XN8Mc+9dsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5776
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
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: 17 June 2026 17:27
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Jani Nikula <jani.nikula@linux.intel.=
com>;
> Nilawar, Badal <badal.nilawar@intel.com>
> Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside
> pm block signalling
>=20
> On Wed, Jun 17, 2026 at 01:51:05PM +0530, Tejas Upadhyay wrote:
> > A circular locking dependency is reported between xe_pm_block_map and
> > dev->clientlist_mutex:
> >
> >   &dev->clientlist_mutex --> &vm->lock --> xe_pm_block_map -->
> > &dev->clientlist_mutex
> >
> > The dependency chain is:
> > 1. xe_pm_suspend() calls xe_pm_block_begin_signalling(), then
> >    xe_display_pm_suspend() which calls drm_client_dev_suspend()
> >    acquiring clientlist_mutex. (xe_pm_block_map -> clientlist_mutex)
> >
> > 2. drm_client_dev_unregister() -> drm_file_free() -> xe_file_close() ->
> >    prelim_xe_eudebug_file_close() acquires discovery_lock.
> >    (clientlist_mutex -> discovery_lock)
> >
> > 3. xe_vm_close_and_put() acquires vm->lock under discovery_lock.
> >    (discovery_lock -> vm->lock)
> >
> > 4. xe_exec_ioctl() holds vm->lock and calls xe_pm_block_on_suspend()
> >    which waits on xe_pm_block_map. (vm->lock -> xe_pm_block_map)
> >
> > Fix this by moving drm_client_dev_suspend() before
> > xe_pm_block_begin_signalling() in xe_pm_suspend(), and
> > drm_client_dev_resume() after xe_pm_block_end_signalling() in
> > xe_pm_resume(). This breaks the xe_pm_block_map -> clientlist_mutex
> > edge in the dependency chain.
> >
> > The drm_client_dev_suspend/resume calls are safe to move because they
> > only blank/unblank the fbdev console and don't depend on display power
> > state or any operations within the block signalling scope.
>=20
> Other folks already have interesting comments but just FYI:
> We'd want to make sure fbdev is not left blank on suspend/resume failure =
so
> the user atleast have an opportunity to see the failure and possibly add =
to the
> bug report.
>=20
> You can refer to the comment above xe_display_pm_resume().

Thanks for flagging this. The patch already handles this as in the suspend =
error paths, drm_client_dev_resume() is called at err: (which err_display f=
alls through to), so the fbdev console is always unblanked on failure. Simi=
larly in xe_pm_resume(), both the success and error paths call drm_client_d=
ev_resume(), consistent with the existing pattern of calling xe_display_pm_=
resume() before bailing on GT resume failure. So the user always gets their=
 screen back on any suspend/resume failure as far as I understand it.

Tejas

>=20
> Raag
