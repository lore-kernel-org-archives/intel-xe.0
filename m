Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCEBCD128A
	for <intel-xe@archiver.kernel.org>; Sun, 31 Mar 2024 19:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B4A10E783;
	Sun, 31 Mar 2024 19:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7a36rwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FEC10E766
 for <intel-xe@lists.freedesktop.org>; Sun, 31 Mar 2024 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711911847; x=1743447847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jFrPtZbrWA+LYYk2vL5v2Vrtc76hl9e+s3jXip0hz4A=;
 b=M7a36rwE5HeFD5A+ylPCFMPzppFaWM2GK1JVkD5OvXG2ZSUE2H9K7Qcv
 dK7VuprPZSn0wMxJ2h0uNm1whAAQD3RQRZvzJxPDJOfZN2aeITDk5oBKA
 ZOZYs6Zmd9Q8RJLH8M59qLz32K7V4AuhSbxYMT2NhI6xaQD+QihFlDxhk
 mhqOZzxssfWPOllRmLc/62DehjtF+odKVD+EW1j9Yf4CRNByp+PqZjXcT
 FN698UWHOVBC4av+ocCxCrvmD04DGr+GitodcMk5nEpnx3A199iBJSpLI
 lDqlKDJy15vIBeFh4RmTRKGKZBkRoP3hcChrOaFsvg45DigqE3oD5dFuF g==;
X-CSE-ConnectionGUID: AmOVSU8fSm2s2pK9CFMLag==
X-CSE-MsgGUID: I4LjSbCMSe2QqjLMHZButQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7227864"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="7227864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 12:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; d="scan'208";a="17895633"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2024 12:04:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 12:04:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 31 Mar 2024 12:04:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 31 Mar 2024 12:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSod+vDAIKS8AX2u3WY2qBawGBT7WgMt7UmqO1TLIyoQWnQR13uFdhcV5mA1fdsolVoAReKIM+8h4IN4IYOsYPdrqyo0G8aQh+dEtlWE09EaDvtk9iOw5QPS9A+SuoUI1GxFh+o43+0TEGJKAs1gjvkO+qDxPDDa8DYtgB3f715AmYYTcBtdnmYvRUdS8+y8T60qCbSSuKW7FtDS1VK35hHL6kQZyj9LBOo/ny7Ya9nrviOanni5+epu6+R9A2GSY9/Ts1j7oO6BSxIB6xNACNMrcz5We9y3De8c0c90cJ0Smau+RLGmZp9JxZGGIoJUzl7TfIlactCw6ZiviYqWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1ihc+SbtuLH+HGLrBFUdI5HJmy+4ilrn13EQJwO9MA=;
 b=W+/4ySo3zsPULcODDaf1+iwektdfTeGjvuQO3A8yyVx7SjSjNhiNa/oFmANr5x+HenimjDU4IAnMFreh53s/gRgXzn1VPOhPruJooNkH2jK3fP2MIowji0oyNHpkl6Ngb+8IAD0ZEMQS0X1N8Ab7CdiJnnj4GHlm0bv967ZWlgr6Yh4fIuRl+MOYptNv/g6QhOiBGA/e/u35LaOANuc0qW7NKnqxxeM+dz8dy9vrIgnLHccFjT0cS3gy/NOrIp/psuo4yD9zFZFcgmL3lAT8Kw98mVfXnaEl8RYadrtddx7QFr0Sc4j5P2rp/yr+tHINLKc22Y/l1MGpwF/jLXFykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.21; Sun, 31 Mar
 2024 19:04:03 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::62c7:9385:7a06:188a]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::62c7:9385:7a06:188a%5]) with mapi id 15.20.7452.019; Sun, 31 Mar 2024
 19:04:03 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>
Subject: RE: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Topic: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Index: AQHag52dVmR3IAOIKEKK2LtdX8QeobFSND8w
Date: Sun, 31 Mar 2024 19:04:03 +0000
Message-ID: <DM4PR11MB529312D75E086010DF1E2EFE9D382@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|SA2PR11MB5100:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rcIed2s5ttwoT5KXouuinhp4sGNh9GBvC0DJ/I4/2/yAdX5+L7GXWkPom0g1Ztn1+afGpC4ytm3uT0JcGBGE2anw/HiFes7Ec0Kjk2Yt4qjiy1G/xknkBUlylZKnNdq50AqLUbwwxYoKiDiVJeSXArgdeVLmqrmtO14Pf95SiXOeeg3/GkUo8SUMVthwcLr4LhUWkrKr8q4TklsTD4DwQx6IHdWXks51d3rmjUE3tk9h2fAdakbUnMtgWSyhADhuy9FofTpsmoObrOgcrpIDUPElDq+qNcKqTDU+WUc/nY6EHrU8DREabnaMNNoeqB+eoYgjF008oXUImAkPu+WdNsvzdU5QmL/dqpDDxq6mlQ85JGj6cmb4w8iDtLg8pP7NLt3XEwZH/GKfWWLpCgo1C1LawqBgm35fBUHtbvWLHlsD3STxx4dJC43tmqGPBYHcgoHxBRdn3HC0Xnj8iB45uNXsokWxeRt39HkbylFMmQ6X2x4HSBOuXks5iToSUOb+PPNzsl3KfA2+1BZtOKSIh+3E9bInAKlO9cRgryMZZlOdHR/ATMPLL/TRqbgwQfBNSSKOopA87glFl8t43xXttKA6VzGho9ZDQVFxqhzbwkUXxXjf2oZRd4ZKs8PNbC0krXr4JYxC3hgOQDPm0XagYTE5SgCaWlZANjp6qG19wFs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VYTPHCL8iBe9gmTknh58DoUyW2yEWgXC4ShMyoiG4eDCS+dcN95QTF5hEfbh?=
 =?us-ascii?Q?zXKAU52NSd/DRBru6tF8QH5v1iRpH3Ki5yAId8ywHe5ukVyEMMV2A25DSJOy?=
 =?us-ascii?Q?kb2zTtfhnqXNNsf4b1iadKx4vsAoeTTjShJEvFAX+BGQyPcDYsF6DzDTv/iH?=
 =?us-ascii?Q?0eLhEdHPG8ki/yozqQA3+uKkXtcamtBBiTlU7jWtsc3UEzWjN0EIDH/Rdc+R?=
 =?us-ascii?Q?Xn+4I4zUgBg6qA2t409QbG1YY0uSzhIXj8IL/4grG9sy3HzZfOgYZZ3SjWC7?=
 =?us-ascii?Q?lPrZdIOuXNoHGKV73JdWl+FA10utmv59xeFXcS+87KvbLhyd8lHbdCmzsdph?=
 =?us-ascii?Q?zV7oF+fXsaiaY8VaYX1Pw3GQilHCb19/ZcPwyrvPEbjrDmHMrjr+aJ2xipli?=
 =?us-ascii?Q?9qBwhS6OlLA2+B2UE4jphPZtiDJxlmivCXuypOgeP8GZmzuq0P+Cwsk0jPey?=
 =?us-ascii?Q?RUqOLSN+JDNJb9qUmcAuxGKI4f59KGfESpTMjcPPdvZigCStNALLBB/koPcD?=
 =?us-ascii?Q?pBVi2LkaQpaaMcbLJ5wNYgFs2tCRceUK3u4IBAeqdD8W1vbwQ4w9HjGoqxyz?=
 =?us-ascii?Q?AM0YSF2xDzJfelSkap7MONbNZt1veFf3Y3wATVgXtpOf1Cov80/RPyhL6620?=
 =?us-ascii?Q?Oek2aQdqIYyXFuPgJ1kc/p0QmBCqNJORiqvOwhx/YkgYzygmrUlHnoQfZ7/g?=
 =?us-ascii?Q?BqfiCu9E5HPkxapwawZseNYGpG64dQ2eTP1wi50fxDRil24lp/q6LG3ZqKRD?=
 =?us-ascii?Q?LdBT89M1ds0EQFHCWMphI7X5hgnesxG655BAZR3H2vU1s43YJID8cPhz8wFc?=
 =?us-ascii?Q?CNu41HnGI76BgcWH4my1NDpqkMaHtaNGEpanUzHoxpm8jq33dLRv2h9QRshS?=
 =?us-ascii?Q?rmOY7f6mNIRalAJm8EGSLwLMupih4m99U+jRMqrSDwnyrhtdU9nwAWz3ksH8?=
 =?us-ascii?Q?WCJDIck0beSFGJwJn70QOUxUXc6jY2AELk7b+LbvkMUJBwzBUONObVwBUr+k?=
 =?us-ascii?Q?QO4wAlcann8RNq7ETURuhf4xpznEW6K2XFFnt0cVRwPb19F4jlmEy1U1jWLP?=
 =?us-ascii?Q?ZeSEl/93ySyCReDBSFqP4ZHlCZkurypGBbojybOUF251rsL0LQ3d8hpUg/yq?=
 =?us-ascii?Q?7CScYmP/UWY8Qqp+DuLTHztMvv3UCL0VlacTpulZYBWd9b7MkwWcJWBUIfkf?=
 =?us-ascii?Q?3HO2y5xiQHiCA/c7H+oQ/7XEatr5E02TJsKByPnFzkTqy+jrlGV9mzSd6egV?=
 =?us-ascii?Q?ynzPDS+3jMXKHfxlyes+K6ychS0yo2p4od3WiR7ChWjSVIENlPFitAXThJMs?=
 =?us-ascii?Q?HitXkrwE/s0Td83saUF8caee0I+0AgZkG/I3sv/av7np38dv7yXvyWjy/fQA?=
 =?us-ascii?Q?hjCqwkcYMRUIoftX7aY63MBjaOG7rSQohYczXFgMS5xlKr0VunimBObPBxSl?=
 =?us-ascii?Q?B0H4kkX+v8IZRa/CgJgJCpM42oAwEnMql79on9Bt0C80ku8i4EijnUHaHXei?=
 =?us-ascii?Q?nY0ytvVSTAJ6AooHJvADyiU9DEP3JJjXeMxv0PgaE18+frui32UPjKObKE5F?=
 =?us-ascii?Q?V0ySZi5cyuMSwQD7J0275/FinB93N/nzYCSBwQ2cKH1h4F1GZ1h17DYPurSv?=
 =?us-ascii?Q?eJlsFkbFPqzX7R7OY//LUENleSKe/Q/pOruqbtAyqIAK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc0ab66-5ff6-4409-81b7-08dc51b55502
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2024 19:04:03.6621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ob4ITQHymkJlcZMvR73B2hScEg8SJPkn7wUKHLGdDhltK6XAeBNbAXKF7QE7LKoJilJgrLwHtBVmynkI9U00aF3ixX1UWDNNTgmqYCuVos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5100
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
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Monday, April 1, 2024 12:30 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Zeng, Oak <oak.zeng@intel.com>
> Subject: [PATCH] lib/xe/xe_util: Creating the helper functions
>=20
> Creating the helper functions which can be reused by many tests, as part =
of this
> patch xe_exec_compute_mode and xe_exec_fault_mode are used this helper
> functions.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> ---
>  lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++++++
>  lib/xe/xe_util.h                   |  48 +++++++
>  tests/intel/xe_exec_compute_mode.c | 190 ++++------------------------
>  tests/intel/xe_exec_fault_mode.c   | 179 +++-----------------------
>  4 files changed, 282 insertions(+), 329 deletions(-)
>=20
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c index 050162b5e..17cd45e=
45
> 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
>=20
>  	return strcmp(gt_c_state, "gt-c6") =3D=3D 0;  }
> +
> +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> +		uint32_t bo_size, uint64_t placement, unsigned int flags) {
> +	struct cpu_va *data;
> +
> +	if (flags & USERPTR) {
> +		if (flags & INVALIDATE) {
> +			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ | PROT_WRITE,
> +					MAP_SHARED | MAP_FIXED |
> MAP_ANONYMOUS, -1, 0);
> +			igt_assert(data !=3D MAP_FAILED);
> +		} else {
> +			data =3D aligned_alloc(xe_get_default_alignment(fd),
> bo_size);
> +			igt_assert(data);
> +		}
> +	} else {
> +		*bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size,
> placement,
> +
> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data =3D xe_bo_map(fd, *bo, bo_size);
> +	}
> +
> +	memset(data, 0, bo_size);
> +
> +	return data;
> +}
> +
> +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues,
> +		struct drm_xe_engine_class_instance *eci, unsigned int flags) {
> +	int i;
> +
> +	for (i =3D 0; i < n_exec_queues; i++) {
> +		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> +		if (flags & BIND_EXEC_QUEUE)
> +			bind_exec_queues[i] =3D xe_bind_exec_queue_create(fd,
> vm, 0);
> +		else
> +			bind_exec_queues[i] =3D 0;
> +	};
> +}
> +
> +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t=
 bo,
> +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> +		struct cpu_va *data, unsigned int flags) {
> +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> +ONE_SEC;
> +
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	if (bo)
> +		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr,
> bo_size, sync, 1);
> +	else
> +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
> +				to_user_pointer(data), addr,
> +				bo_size, sync, 1);
> +
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues, fence_timeout);
> +	data[0].vm_sync =3D 0;
> +
> +	if (flags & PREFETCH) {
> +		/* Should move to system memory */
> +		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
> +				bo_size, sync, 1, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +				bind_exec_queues, fence_timeout);
> +		data[0].vm_sync =3D 0;
> +	}
> +}
> +
> +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int
> +i) {
> +	int b =3D 0;
> +	data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data[i].batch[b++] =3D dst;
> +	data[i].batch[b++] =3D dst >> 32;
> +	data[i].batch[b++] =3D val;
> +	data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(b <=3D ARRAY_SIZE(data[i].batch)); }
> +
Since number of arguments are more, I will add passing arguments to one str=
ucture and pass, I will send new patch with this changes.
Regards,
Krishna.
> +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_exe=
cs,
> +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> +		int *map_fd, unsigned int flags)
> +{
> +	int i;
> +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> +ONE_SEC;
> +
> +	for (i =3D 0; i < n_execs; i++) {
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +		int e =3D i % n_exec_queues;
> +
> +		if (flags & INVALID_VA)
> +			sdi_addr =3D 0x1fffffffffff000;
> +
> +		insert_store(sdi_addr, data, 0xc0ffee, i);
> +
> +		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> +
> +		exec->exec_queue_id =3D exec_queues[e];
> +		exec->address =3D batch_addr;
> +		xe_exec(fd, exec);
> +
> +		if (flags & REBIND && i + 1 !=3D n_execs) {
> +			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> +					exec_queues[e], fence_timeout);
> +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> +					addr, bo_size, NULL, 0);
> +
> +			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +			addr +=3D bo_size;
> +
> +			if (bo)
> +				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> +						0, addr, bo_size, sync, 1);
> +			else
> +				xe_vm_bind_userptr_async(fd, vm,
> +						bind_exec_queues[e],
> +						to_user_pointer(data),
> +						addr, bo_size, sync, 1);
> +
> +			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> +					bind_exec_queues[e], fence_timeout);
> +			data[0].vm_sync =3D 0;
> +		}
> +
> +		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> +			if (!(flags & RACE)) {
> +				/*
> +				 * Wait for exec completion and check data as
> +				 * userptr will likely change to different
> +				 * physical memory on next mmap call
> triggering
> +				 * an invalidate.
> +				 */
> +				xe_wait_ufence(fd, &data[i].exec_sync,
> +						USER_FENCE_VALUE,
> exec_queues[e],
> +						fence_timeout);
> +				igt_assert_eq(data[i].data, 0xc0ffee);
> +			} else if (i * 2 !=3D n_execs) {
> +				/*
> +				 * We issue 1 mmap which races against
> running
> +				 * jobs. No real check here aside from this test
> +				 * not faulting on the GPU.
> +				 */
> +				continue;
> +			}
> +
> +			if (flags & RACE) {
> +				*map_fd =3D open("/tmp", O_TMPFILE |
> O_RDWR,
> +						0x666);
> +				write(*map_fd, data, bo_size);
> +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> +						PROT_READ | PROT_WRITE,
> MAP_SHARED |
> +						MAP_FIXED, *map_fd, 0);
> +			} else {
> +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> +						PROT_READ | PROT_WRITE,
> MAP_SHARED |
> +						MAP_FIXED |
> MAP_ANONYMOUS, -1, 0);
> +			}
> +
> +			igt_assert(data !=3D MAP_FAILED);
> +		}
> +	}
> +}
> +
> +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> +		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
> +		uint32_t bo_size)
> +{
> +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> +ONE_SEC;
> +
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
> +			sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues, fence_timeout);
> +}
> +
> +void destory_exec_queue(int fd, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues) {
> +	int i;
> +
> +	for (i =3D 0; i < n_exec_queues; i++) {
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +		if (bind_exec_queues[i])
> +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> +	}
> +}
> +
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h index 6480ea01a..aa1b0dc=
c1
> 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_=
t
> bind_engine,
>=20
>  bool xe_is_gt_in_c6(int fd, int gt);
>=20
> +
> +#define USERPTR			(0x1 << 0)
> +#define REBIND			(0x1 << 1)
> +#define INVALIDATE		(0x1 << 2)
> +#define RACE			(0x1 << 3)
> +#define BIND_EXEC_QUEUE		(0x1 << 4)
> +#define PREFETCH		(0x1 << 5)
> +#define INVALID_FAULT		(0x1 << 6)
> +#define INVALID_VA		(0x1 << 7)
> +#define ENABLE_SCRATCH		(0x1 << 8)
> +#define VM_FOR_BO		(0x1 << 9)
> +#define EXEC_QUEUE_EARLY	(0x1 << 10)
> +
> +#define MAX_N_EXEC_QUEUES	16
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define MAP_ADDRESS		0x00007fadeadbe000
> +
> +#define ONE_SEC		MS_TO_NS(1000)
> +#define HUNDRED_SEC	MS_TO_NS(100000)
> +
> +struct cpu_va {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +};
> +
> +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> +		uint32_t bo_size, uint64_t placement,  unsigned int flags); void
> +create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues,
> +		struct drm_xe_engine_class_instance *eci, unsigned int flags);
> void
> +xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t bo,
> +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> +		struct cpu_va *data, unsigned int flags); void xe_execbuf(int fd,
> +uint32_t vm, struct drm_xe_exec *exec, int n_execs,
> +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> +		int *map_fd, unsigned int flags);
> +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int
> +i); void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> +		struct drm_xe_sync *sync, struct cpu_va *data,
> +		uint64_t addr, uint32_t bo_size);
> +void destory_exec_queue(int fd, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues);
> +
>  #endif /* XE_UTIL_H */
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index 3ec848164..e8d82cc69 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -15,6 +15,7 @@
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
>  #include <sys/ioctl.h>
>  #include "xe_drm.h"
>=20
> @@ -23,15 +24,6 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>=20
> -#define MAX_N_EXECQUEUES 	16
> -#define USERPTR				(0x1 << 0)
> -#define REBIND				(0x1 << 1)
> -#define INVALIDATE			(0x1 << 2)
> -#define RACE				(0x1 << 3)
> -#define BIND_EXECQUEUE		(0x1 << 4)
> -#define VM_FOR_BO			(0x1 << 5)
> -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> -
>  /**
>   * SUBTEST: twice-%s
>   * Description: Run %arg[1] compute machine test twice @@ -88,7 +80,6 @@
> test_exec(int fd, struct drm_xe_engine_class_instance *eci,  {
>  	uint32_t vm;
>  	uint64_t addr =3D 0x1a0000;
> -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
>  		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -99,161 +90,38 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  		.num_syncs =3D 1,
>  		.syncs =3D to_user_pointer(sync),
>  	};
> -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> -	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
>  	uint32_t bo =3D 0;
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint64_t vm_sync;
> -		uint64_t exec_sync;
> -		uint32_t data;
> -	} *data;
> -	int i, j, b;
> +	struct cpu_va *data;
> +	int i, j;
>  	int map_fd =3D -1;
>  	int64_t fence_timeout;
> +	uint64_t placement;
>=20
> -	igt_assert(n_exec_queues <=3D MAX_N_EXECQUEUES);
> +	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
>=20
>  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size =3D sizeof(*data) * n_execs;
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> -	for (i =3D 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXECQUEUE)
> -			bind_exec_queues[i] =3D
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] =3D 0;
> -	};
> +	if (flags & EXEC_QUEUE_EARLY)
> +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> +n_exec_queues, eci, flags);
>=20
> -	if (flags & USERPTR) {
> -#define	MAP_ADDRESS	0x00007fadeadbe000
> -		if (flags & INVALIDATE) {
> -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> -				    MAP_ANONYMOUS, -1, 0);
> -			igt_assert(data !=3D MAP_FAILED);
> -		} else {
> -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> -					     bo_size);
> -			igt_assert(data);
> -		}
> -	} else {
> -		bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> -				  bo_size, vram_if_possible(fd, eci->gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data =3D xe_bo_map(fd, bo, bo_size);
> -	}
> -	memset(data, 0, bo_size);
> +	placement =3D vram_if_possible(fd, eci->gt_id);
>=20
> -	for (i =3D 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXECQUEUE)
> -			bind_exec_queues[i] =3D
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] =3D 0;
> -	};
> +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
>=20
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> -	else
> -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr,
> -					 bo_size, sync, 1);
> -#define ONE_SEC	MS_TO_NS(1000)
> -#define HUNDRED_SEC	MS_TO_NS(100000)
> +	if(!(flags & EXEC_QUEUE_EARLY))
> +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> +n_exec_queues, eci, flags);
> +
> +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> +flags);
>=20
>  	fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
>=20
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], fence_timeout);
> -	data[0].vm_sync =3D 0;
> -
> -	for (i =3D 0; i < n_execs; i++) {
> -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr =3D addr + batch_offset;
> -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr =3D addr + sdi_offset;
> -		int e =3D i % n_exec_queues;
> -
> -		b =3D 0;
> -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -		data[i].batch[b++] =3D sdi_addr;
> -		data[i].batch[b++] =3D sdi_addr >> 32;
> -		data[i].batch[b++] =3D 0xc0ffee;
> -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> -
> -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> -
> -		exec.exec_queue_id =3D exec_queues[e];
> -		exec.address =3D batch_addr;
> -		xe_exec(fd, &exec);
> -
> -		if (flags & REBIND && i + 1 !=3D n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], fence_timeout);
> -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> -					   addr, bo_size, NULL, 0);
> -
> -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -			addr +=3D bo_size;
> -			if (bo)
> -				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> -						 0, addr, bo_size, sync, 1);
> -			else
> -				xe_vm_bind_userptr_async(fd, vm,
> -							 bind_exec_queues[e],
> -
> to_user_pointer(data),
> -							 addr, bo_size, sync,
> -							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> -				       bind_exec_queues[e], fence_timeout);
> -			data[0].vm_sync =3D 0;
> -		}
> -
> -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> -			if (!(flags & RACE)) {
> -				/*
> -				 * Wait for exec completion and check data as
> -				 * userptr will likely change to different
> -				 * physical memory on next mmap call
> triggering
> -				 * an invalidate.
> -				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE,
> exec_queues[e],
> -					       fence_timeout);
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> -			} else if (i * 2 !=3D n_execs) {
> -				/*
> -				 * We issue 1 mmap which races against
> running
> -				 * jobs. No real check here aside from this test
> -				 * not faulting on the GPU.
> -				 */
> -				continue;
> -			}
> -
> -			if (flags & RACE) {
> -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> -					      0x666);
> -				write(map_fd, data, bo_size);
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED, map_fd, 0);
> -			} else {
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED | MAP_ANONYMOUS, -
> 1, 0);
> -			}
> -			igt_assert(data !=3D MAP_FAILED);
> -		}
> -	}
> +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> +			n_exec_queues, bo, bo_size, sync, addr, data,
> &map_fd, flags);
>=20
>  	j =3D flags & INVALIDATE ? n_execs - 1 : 0;
>  	for (i =3D j; i < n_execs; i++)
> @@ -264,20 +132,12 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	if (flags & INVALIDATE)
>  		usleep(250000);
>=20
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> -			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], fence_timeout);
> +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
>=20
>  	for (i =3D j; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>=20
> -	for (i =3D 0; i < n_exec_queues; i++) {
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -		if (bind_exec_queues[i])
> -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> -	}
> +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> n_exec_queues);
>=20
>  	if (bo) {
>  		munmap(data, bo_size);
> @@ -492,14 +352,14 @@ igt_main
>  		{ "userptr-rebind", USERPTR | REBIND },
>  		{ "userptr-invalidate", USERPTR | INVALIDATE },
>  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> -		{ "bindexecqueue", BIND_EXECQUEUE },
> -		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
> -		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
> -		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE |
> USERPTR |
> +		{ "bindexecqueue", BIND_EXEC_QUEUE },
> +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> +		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE |
> USERPTR |
>  			REBIND },
> -		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE |
> USERPTR |
> +		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE |
> USERPTR |
>  			INVALIDATE },
> -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE |
> USERPTR |
> +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE
> | USERPTR
> +|
>  			INVALIDATE | RACE },
>  		{ NULL },
>  	};
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 40fe1743e..7b2fef224 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -16,24 +16,13 @@
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
>  #include "xe_drm.h"
>=20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include <string.h>
>=20
> -#define MAX_N_EXEC_QUEUES	16
> -
> -#define USERPTR		(0x1 << 0)
> -#define REBIND		(0x1 << 1)
> -#define INVALIDATE	(0x1 << 2)
> -#define RACE		(0x1 << 3)
> -#define BIND_EXEC_QUEUE	(0x1 << 4)
> -#define PREFETCH	(0x1 << 5)
> -#define INVALID_FAULT	(0x1 << 6)
> -#define INVALID_VA	(0x1 << 7)
> -#define ENABLE_SCRATCH  (0x1 << 8)
> -
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
> @@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,  {
>  	uint32_t vm;
>  	uint64_t addr =3D 0x1a0000;
> -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
>  	          .timeline_value =3D USER_FENCE_VALUE }, @@ -113,14 +101,9 @@
> test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
>  	uint32_t bo =3D 0;
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint64_t vm_sync;
> -		uint64_t exec_sync;
> -		uint32_t data;
> -	} *data;
> -	int i, j, b;
> +	struct cpu_va *data;
> +	uint64_t placement;
> +	int i, j;
>  	int map_fd =3D -1;
>=20
>  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES); @@ -134,144
> +117,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	bo_size =3D sizeof(*data) * n_execs;
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> -	if (flags & USERPTR) {
> -#define	MAP_ADDRESS	0x00007fadeadbe000
> -		if (flags & INVALIDATE) {
> -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> -				    MAP_ANONYMOUS, -1, 0);
> -			igt_assert(data !=3D MAP_FAILED);
> -		} else {
> -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> -					     bo_size);
> -			igt_assert(data);
> -		}
> -	} else {
> -		if (flags & PREFETCH)
> -			bo =3D xe_bo_create(fd, 0, bo_size,
> -					  all_memory_regions(fd) |
> -					  vram_if_possible(fd, 0),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		else
> -			bo =3D xe_bo_create(fd, 0, bo_size,
> -					  vram_if_possible(fd, eci->gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data =3D xe_bo_map(fd, bo, bo_size);
> -	}
> -	memset(data, 0, bo_size);
> -
> -	for (i =3D 0; i < n_exec_queues; i++) {
> -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXEC_QUEUE)
> -			bind_exec_queues[i] =3D
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] =3D 0;
> -	};
> -
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> bo_size, sync, 1);
> -	else
> -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr,
> -					 bo_size, sync, 1);
> -#define ONE_SEC	MS_TO_NS(1000)
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], ONE_SEC);
> -	data[0].vm_sync =3D 0;
> -
> -	if (flags & PREFETCH) {
> -		/* Should move to system memory */
> -		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> -				     bo_size, sync, 1, 0);
> -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -			       bind_exec_queues[0], ONE_SEC);
> -		data[0].vm_sync =3D 0;
> -	}
> -
> -	for (i =3D 0; i < n_execs; i++) {
> -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr =3D addr + batch_offset;
> -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr =3D addr + sdi_offset;
> -		int e =3D i % n_exec_queues;
> +	placement =3D (flags & PREFETCH) ? all_memory_regions(fd) |
> +		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
>=20
> -		b =3D 0;
> -		if (flags & INVALID_VA)
> -			sdi_addr =3D 0x1fffffffffff000;
> +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
>=20
> -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -		data[i].batch[b++] =3D sdi_addr;
> -		data[i].batch[b++] =3D sdi_addr >> 32;
> -		data[i].batch[b++] =3D 0xc0ffee;
> -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> +			n_exec_queues, eci, flags);
>=20
> -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> +flags);
>=20
> -		exec.exec_queue_id =3D exec_queues[e];
> -		exec.address =3D batch_addr;
> -		xe_exec(fd, &exec);
> +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> +			n_exec_queues, bo, bo_size, sync, addr, data,
> &map_fd, flags);
>=20
> -		if (flags & REBIND && i + 1 !=3D n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], ONE_SEC);
> -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> -					   addr, bo_size, NULL, 0);
> -
> -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -			addr +=3D bo_size;
> -			if (bo)
> -				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> -						 0, addr, bo_size, sync, 1);
> -			else
> -				xe_vm_bind_userptr_async(fd, vm,
> -							 bind_exec_queues[e],
> -
> to_user_pointer(data),
> -							 addr, bo_size, sync,
> -							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> -				       bind_exec_queues[e], ONE_SEC);
> -			data[0].vm_sync =3D 0;
> -		}
> -
> -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> -			if (!(flags & RACE)) {
> -				/*
> -				 * Wait for exec completion and check data as
> -				 * userptr will likely change to different
> -				 * physical memory on next mmap call
> triggering
> -				 * an invalidate.
> -				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE,
> exec_queues[e],
> -					       ONE_SEC);
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> -			} else if (i * 2 !=3D n_execs) {
> -				/*
> -				 * We issue 1 mmap which races against
> running
> -				 * jobs. No real check here aside from this test
> -				 * not faulting on the GPU.
> -				 */
> -				continue;
> -			}
> -
> -			if (flags & RACE) {
> -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> -					      0x666);
> -				write(map_fd, data, bo_size);
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED, map_fd, 0);
> -			} else {
> -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> -					    MAP_FIXED | MAP_ANONYMOUS, -
> 1, 0);
> -			}
> -			igt_assert(data !=3D MAP_FAILED);
> -		}
> -	}
>  	if (!(flags & INVALID_FAULT)) {
>  		int64_t timeout =3D ONE_SEC;
>=20
> @@ -286,22 +144,15 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  							       exec_queues[i %
> n_exec_queues], &timeout), 0);
>  		}
>  	}
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> -			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], ONE_SEC);
> +
> +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
>=20
>  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>  		for (i =3D j; i < n_execs; i++)
>  				igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
>=20
> -	for (i =3D 0; i < n_exec_queues; i++) {
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -		if (bind_exec_queues[i])
> -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> -	}
> +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> n_exec_queues);
>=20
>  	if (bo) {
>  		munmap(data, bo_size);
> --
> 2.25.1

