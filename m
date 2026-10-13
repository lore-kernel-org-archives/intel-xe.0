Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D8ECC6B0E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 14:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1DA10E8D3;
	Tue, 13 Oct 2026 14:47:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C944D10E8EA
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791902819; x=1823438819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nXhw91WrX+lbIrFWyxrKQrGIcj25D2uXBzJ8hug4mTE=;
 b=OsZ5N4CneaFl9u4YBuvE/ESM5zhtQTDmb0Rg42mBcOBg8ahPWcFGcdZk
 bm4yN1xbdzx+8IFdzt8Gs4swC2aT0sNeAu82GIUzLkWouuOoE94yxYpwh
 /vZeyQzVq9MTMb5095KhNLlrqmJCdYN6vH5scck25m0ABMZSF8dsvpQkK
 SPUIESxK7sGqdYCKuOyf+Y7OIk6xHrjx3nbQzhvPhu9yH7J6OJytS3xY4
 ziitTDL9ZIUruiXlMAMlcXIQ8y8NHDTFoPRaqbjj7gbQh7ubDSF4+Vn/L
 X0GVtXtNmOmJK/s9Ylr3gXOHp9MKCKWcNs5HjzKip7Ni9GpIdn44FoxSI A==;
X-CSE-ConnectionGUID: WzILwye5QIySauk+9OBcWg==
X-CSE-MsgGUID: E8AhszXcQUuLTk31ytJo+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="624020"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="624020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:46:58 -0700
X-CSE-ConnectionGUID: XA/h6EHzTW6z6sc9Fm3+GQ==
X-CSE-MsgGUID: w1AfAlSyQrm0qTONxAM1tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1539781"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:46:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 07:46:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 07:46:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 07:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9BYXjnH56s4YSsJEQ9w9iLc9AGcNVn2SPYuzWjZdZ4UvE0pY+8pNpAlq0aJTM4E6oHUc4+0L0mdb6zG+oQwoDgVqGBEfchCljB1eNqFh4G7FGjvVLAh84i02novSD2jy6fYGhpP84fYu+lE2se9g2lwtHaEPVxEJnV70wqoKvpyAPq6QjaeF+86jiSbuWQzvjDLG9V68qc4EQKWUgYGHm2+ovYP3nUMeWFPscU1QzIj34jFjdNYgeQjDSJye4jrztv2EEU/Y2TeQmSJwVIOVZzQVJvV+/aNNKAFOXPO5gw3fshHUZZq/YvHe9dhmlEnRzgsfThobYi83DxCB+QEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOJfCI5XomjRGczXeCxxb+0JBAM3IyHjaci6QbYMoYY=;
 b=uW5C35BJ3KzSjSZ3x+S32pkzJlp109SCO+0mdI12pvLoTHK9rzDH2pEPv+KKYulvhIohw5tCZhkT3xzbKMYC24vFXGk5dVWOTGLAPu4Zsbv5Jn0PHywmYIi1e7IaRLLNksYpJ91WYtlGtE/lKfr0igh31E+3+T7n/QNUnCxWl95wwlpxYMOq94ozpEZxFiYoKTwD50HNin/yGrvl3IM39Z6y7xWNj+spN3oACvaXx7YnLbAYCX/9oFNw15AH7FOei6nF8Xd1f2KaorNMRwGi8CIxTAVjyH+W38U1f2h+wBECT6LvTr6wAj1LlThkFOwXYdcp5w0/phkj3Kggn6Q0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 14:46:52 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:46:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Charles, Daniel" <daniel.charles@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "x.wang@intnel.com" <x.wang@intnel.com>, "Yao, Jia" <jia.yao@intel.com>,
 "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Thread-Topic: [PATCH 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Thread-Index: AQHdWrwb5SDSQgKtzU6fmDAj90Hir7b7jA6w
Date: Tue, 13 Oct 2026 14:46:51 +0000
Message-ID: <CH0PR11MB53954320E7C1D1870CB0ECD0E59E2@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-3-daniel.charles@intel.com>
In-Reply-To: <20261013023442.206915-3-daniel.charles@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|CYXPR11MB8709:EE_
x-ms-office365-filtering-correlation-id: 7f9d5773-9440-4643-14ee-08df2938d18d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|22082099003|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info: 9GHc6+GJ1t2TBTW4pWHPPvE3L9POZjh6pD8eRxUVCMCCmrl7J6nKCGUCE6bXtnSW/mbQitlXhRXqb8sGm7N1OWNox5wZGLqPMOkKIhI5evLdhJijqeVaH7I8JI8yzNJ1Tzagm4P/0Lkm0jpTqWt/XES32yrdx9sTuPgiObY7VloEgzay9muqxb990D3L4dWiun7RC8OYOIMvOhagaFY8A9PdemMC2McFRr0kVsr0PXxjJ/4IfPVX/XXT1HeNF9z0mXuzq4kGtsJDtWsq+rB2vEn21D/o5mfowe6gZzqx23d1tORxZOoyFGVxHv0MOKQ4ZiKPGFykg3aZzmP87+QunXoDi+CHG7ShgjM3UlOMS31aVBgJXKiVvjbDCtHNx5QcTSpJMnePuDxiXQW5nGSAtvf/tnmPJhQr+oeT7oVBBBHTW7qMVxElsPsBIwhZSpOGUDGZDZ4CRQbsjzk1DpGGQBvET3aX5hBCeYo9AGui4aKnBGT3KSwc5Wqd6c9NhJWcElpTXYFhDxS+ZzHbHysG7U4dkrwV7l7Yz9jJYOH0zd2RLgjLPauzhCMZgfAMMZV/WwtigE9kz501N8+uNEZAkidgi1dn3voFHbC94lIx0zn9yxq4g2C0bbcS+Q0dJ1DkeQ49/w68jgF7L9472dfj4PbSOm8W/GuRJegaIeSd2WVY4Ie+gcXfBMYvlN8b1ujvik748+MmJe0+r2YEETJ4gyWauDWcvycdCAYf48vmL8Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(22082099003)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/UuEwewXd/RmdF3tJZVfZrTgxkHHJgQQEqzpxO66H1Lsy0mJQal96d9MXZhO?=
 =?us-ascii?Q?G+tHYcv5wubt0tKSuo1Pj2PGTfEp+NPIUmJV+8jUEQYhNZkPhvfUfK9rARms?=
 =?us-ascii?Q?qR/p9AFlkxWwS22l5mv1KZEe+TP9jpazyU6HAYFaVD3A1cWGEz7zj7SLsvaf?=
 =?us-ascii?Q?l16kSplh7Jb+qbnHG7uFYZS7lPyQLFLnfTI4C1osmadptMi+1sB+MdkwAdb4?=
 =?us-ascii?Q?CXcrrw/dPIGiaSUfbH6LnE3cNQUcbys85cNAmTAQAGoDOY8xP+Yf3zNzMT7/?=
 =?us-ascii?Q?8wQg7e4r039+IEVmuL7BTg/EH4TrDfNRXmZYIQEWiX2U+9TM7/qpQJ0kQ6i2?=
 =?us-ascii?Q?WlimVEkOmm13kYFveiOB/Vuzc90CvURFsi0pk8plwQsv/QY/HzWPw9w0TsNU?=
 =?us-ascii?Q?FaXlzhTX7s9bll2aeSf3YlMDT8XFTYVQnXBluepomYYPageKQ5d8nRxTlUnG?=
 =?us-ascii?Q?7QfO1sVpv3BfEq45bDqSju3cclXf9TEtunS5Sa1W4P+05Jb8uYZ9QcDbclmd?=
 =?us-ascii?Q?xcpbE4RHWeMwlIEU8S9mw/3MOMZYOYNYMJy+u/0iJtZDB1jjge/8gMszMqVb?=
 =?us-ascii?Q?dHSaQWyE90vj86KuvhTjiDQpTKAN9DjiDR0j9/02pTNnOWSqsXD/SJ7PCEJ1?=
 =?us-ascii?Q?OSek50aLLf0D+WpuApuuzp74leQtoyXAOSUn4wWp5tg3Ioug2YjlnhwUoMdm?=
 =?us-ascii?Q?+NZ7KZKAh6/sc/1MTXzcPBOJW/KGMybeuYQv83nfZyQEk9XiTEq+0aJmq8CL?=
 =?us-ascii?Q?vVSM3yA0rD5Hs2twsIImEaytotbwqo5+X37zUEKK2IJXdFmi6KVKbSnhliwa?=
 =?us-ascii?Q?Ngo7oflq1E20tFzeQbysLS6QYSELsoajWWm3nuVxHb75TLfBbKetrM3XHYdr?=
 =?us-ascii?Q?x3eU3GbWTWm0MhZ2JJDtca3J/ccppRXfDu/RGZw+U8aR7FpYb5YJH1aS5Ftm?=
 =?us-ascii?Q?8w19mEIZEEPaarNX+EcRdzFD2U/pGMT6gehPF3NU0jDbBubwmrqn2AJ/qn7Z?=
 =?us-ascii?Q?gjZp+Qqy873mKHOMKSvH83Zs6tX5Ip5iYFH2Ylu9xjWmqHcmMoT6RfHRfPq9?=
 =?us-ascii?Q?rls/vgab/nMS04DFl1EKGV2leo/lK5AWVHc9rEjYBZeoLm5+y5zjLhgqhG4i?=
 =?us-ascii?Q?ZrGrQMh0HABpJNaGFvJXCQ/Sr4Wq4+D/QtmmQIgn+Y/jWbfsZCYiW/8lVEpI?=
 =?us-ascii?Q?WIrUr7DS040PYt5yus7zFxg/9T0DNddeWfClLMFMKYXZLYv5RFxEgHRvvadx?=
 =?us-ascii?Q?MFfEoh4ci68h2Fi7ttRS8ULvIRH9xs19c+8LROvBy7bPb4DizWqssBv/3yH/?=
 =?us-ascii?Q?ejX+YVbm2IOEWIuVAV3YacDVJJn2eyZwrCp3D18McAyvat7s6dwc16fWPM4h?=
 =?us-ascii?Q?2NispkKR6LV4TwUHsXlq5YhGPpIjX07ovMvCNriOLpoUnRJdYiOPuom6LaaO?=
 =?us-ascii?Q?2OuKQBLR7koJnCF2V6aR38NKkCQDGMxI8YJbRM0/0KVpw+5ieqjm48fkYlrd?=
 =?us-ascii?Q?c6hwTYpaOutHDv69KLin0AkMKltTzj4MNmHJrqrpp3DNdRrvhLCF7TWW9N2U?=
 =?us-ascii?Q?hyXoRLOAtB5sHo8TKXJCDER598aZdN0db/+2Sj2ni0/TNznCyurb4s9Yl5VU?=
 =?us-ascii?Q?qI8mqPf2v/6F8HFg9VyOZuEHWix3JeggW59JWyVcbXI/qci8LSvTA5V7PySM?=
 =?us-ascii?Q?l0mnBZPYT3ASQaSNKt8CGjrupqv7XRaszWNmNqxm718lVItviRhiqHSaknHH?=
 =?us-ascii?Q?SzMRzFupWfXp2vOdbN4jsuFYEzJcYY/Af/WXnB8mT/DJ27IIMDXl+s30uYSD?=
x-ms-exchange-antispam-messagedata-1: VogL+aVMwnAkFA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jemI1f3mm8HrKttP9V01kXPWb/ttPMkp5B+R717Sog/PuNQfZasmI6FvKlj4ZbzP8/DeV91FNTfC/415LaKCqFtPn2A5QwfpGY0yC65IEMvu6LB89/XSmkBztLKnVCHimQKXqJFYfjZsB85kbu1ZE9t+hW9Bqo+tjUpAM/gZny2Xvz1HLj1Jwjm0I/49tpdfW8uG8q07mEw5H1kJX9gKuQZQD8r8EveX2fClRFaqB1ddQAa6OegaU0RN8cfPH6a4SIJKVqNrrcK4jd8mvvL6WHf8EX0sNeCUAHMtaSM5kLbj93mp3plO24ZwqpUT7hV+1MIzugaY18iWL2qKwXP4TA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9d5773-9440-4643-14ee-08df2938d18d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 14:46:52.0113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYDHfcNpW4+Cr1HJb5+E8hg5MGaubI8MVpQgEymkGHqOLVWd3u9G6brjziw3lxIAwZBFUYT8RnzsYf1ZiWyXS+CdxpNbxSsQQrDK7g16QyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
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

-----Original Message-----
From: Charles, Daniel <daniel.charles@intel.com>=20
Sent: Monday, October 12, 2026 7:35 PM
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intnel.com; Yao, Jia <jia.yao@intel.com>; Cavitt, Jonathan <jona=
than.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Wang, X <=
x.wang@intel.com>
Subject: [PATCH 2/3] drm/xe: Disable scheduling early on FD close to avoid =
CAT error cascade
>=20
> From: Matthew Brost <matthew.brost@intel.com>
>=20
> When an FD is closed with many exec queues, teardown relies on the TDR
> path to clean up scheduling. However, the TDR handling is serialized
> (i.e., only one exec queue is processed at a time), which can make it
> too slow compared to GuC scheduling activity.
>=20
> In this window, GuC may continue to schedule contexts backed by
> invalid page tables, leading to a cascade of CAT errors and repeated
> engine resets. This significantly increases recovery time and can
> degrade system stability.
>=20
> To mitigate this, eagerly disable scheduling by sending a self-message
> outside of the TDR path. This prevents further scheduling of invalid
> contexts and avoids the CAT error/reset cascade.
>=20
> This change improves robustness and reduces recovery latency in
> multiple queue teardown scenarios.
>=20
> Cc: Wang Xin <x.wang@intel.com>
> Cc: Jia Yao <jia.yao@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Jia Yao <jia.yao@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

I think this patch was designed as a holdover for until exec_queue_kill_syn=
c
was implemented, and as such is unneeded in the series that introduces
exec_queue_kill_sync.

Matt, is this correct?  Or does this patch serve a different purpose?

I'm not blocking on this (yet), just want some clarification.
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 46 ++++++++++++++++++--
>  2 files changed, 43 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/d=
rm/xe/xe_guc_exec_queue_types.h
> index 74b711abe2572..89397e1e65465 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
>  	 * a message needs to sent through the GPU scheduler but memory
>  	 * allocations are not allowed.
>  	 */
> -#define MAX_STATIC_MSG_TYPE	4
> +#define MAX_STATIC_MSG_TYPE	5
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index c4ef3e9bf7a18..609af66b343d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2045,12 +2045,23 @@ static void __guc_exec_queue_process_msg_cgp_sync=
(struct xe_sched_msg *msg,
>  		guc_exec_queue_send_cgp_sync(q, 0);
>  }
> =20
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
> +					      bool bound)
> +{
> +	struct xe_exec_queue *q =3D msg->private_data;
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +
> +	if (exec_queue_enabled(primary) && bound)
> +		disable_scheduling(primary, true);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
>  #define CGP_SYNC_MSG			6
> +#define KILL				7
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -2085,6 +2096,9 @@ static void guc_exec_queue_process_msg(struct xe_sc=
hed_msg *msg,
>  	case CGP_SYNC_MSG:
>  		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
>  		break;
> +	case KILL:
> +		__guc_exec_queue_process_msg_kill(msg, bound);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2211,8 +2225,19 @@ static int guc_exec_queue_init(struct xe_exec_queu=
e *q)
>  	return err;
>  }
> =20
> +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> +				       struct xe_sched_msg *msg,
> +				       u32 opcode);
> +
> +#define STATIC_MSG_CLEANUP	0
> +#define STATIC_MSG_SUSPEND	1
> +#define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_CGP_SYNC	3
> +#define STATIC_MSG_KILL		4
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> +	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_KILL;
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	/*
> @@ -2222,6 +2247,23 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
>  	 * stays set until the queue is torn down.
>  	 */
>  	suspend_wait_wake(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time)=
.
> +	 * If an FD is closed with many exec queues, the TDR can be slower than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 */
> +	if (kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> +		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg(q, msg, KILL);
> +		xe_sched_msg_unlock(sched);
> +	}
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
> =20
> @@ -2274,10 +2316,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_e=
xec_queue *q,
>  	return true;
>  }
> =20
> -#define STATIC_MSG_CLEANUP	0
> -#define STATIC_MSG_SUSPEND	1
> -#define STATIC_MSG_RESUME	2
> -#define STATIC_MSG_CGP_SYNC	3
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLEANUP;
> --=20
> 2.43.0
>=20
>=20
