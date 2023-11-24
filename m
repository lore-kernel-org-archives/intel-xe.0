Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E2C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 07:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA1810E06D;
	Fri, 24 Nov 2023 07:09:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B5810E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700809756; x=1732345756;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=66Fvk8vTODX5pTBUmXDe7udCu9aPgN9LMU2lKFqBZEs=;
 b=e6tn0ZSGr/XcFvUFL07a/L8133WvE42v+SAEngjQnYhfNhVBtNRDfBuB
 VVIlwycrVhNxSThjEOjGPSl4zbSbYffUooZTj3wpYbnZbIH9FEov2Y7kj
 asqOhBmTmuMtEBw8n3Ln8up3vqrrgtmNgEFrw7kX7onxLw4In8+xzn3QF
 sCThbaH/PSxRe54JezLPDULJHIs3RdNoZwIwzTyTXiynn3sotyP00BAgN
 iFqN9/RHeY2W3ls8gvOj7CQpahQU+bDNNgx6DARdq8hay/s0nP3QZ7jA3
 sGwQFxaM+VTksoLzo39Uc+7dt6F21eIKE2rb/8vScKvrSrnDsyVFEIjhg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372537971"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="372537971"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 23:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="858288912"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="858288912"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Nov 2023 23:09:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 23:09:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 23:09:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 23:09:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsht/NtRXxkCe+lHPSihCB7qzVprXM1BgpnTmNI2f4SnDAIGJ3APfj4oIEpiAlpFyHWjirA3JKcMCNzTkIu+Eqe51C24i55G5JHsmw02GzkyeBOSV9F5hAK2NxhiV/20XFotG1tJH6ks92g052FOFZTOBsVVWrQZ6Q/MV2zjW3SFMV0y+2UFlkeND040s9fqiXFWsGBSW6pnPik3LAyFPtWGHv8cDWjiejGd3VsjrlWd3QWxP97kAiAW0xAJDgJNnlDWNFCoTNuahnFBJvmCevtJP87xGRNdG13IHNHjy1oCKOXImggqIcSU2dATxD9uR7FqmfEy3huC92TIijCdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cfkj6u+NOl563TgvLNwjnlVJhdA9S3BugTEIlfxCpMY=;
 b=iNbNC8zzL1pqwvkuWvS9rW1peBMq5WvEfDoFnh5ta7fwTTX4Zcoc6z7bF0oG5LU4C/W7nLBqTwKUbXSIGunj2N26aO1+eo2IT30uKDbwgaIbJff/laXPV+ee0vZWZVPBhXrff5Q7I2gCepITX5N9aCi1FycoH3OV21oKOjLX3aN/o1mPebXsegN90MeLXk6UgnXYV1ndMPb53bLkeE48W8GTOUEyqSBhkE9GF6tsNoo+7WE6heXgYyIt27hT6N6n3RJCEHyiNSad2SV3iwFTemzHX/lI0NYSjuZJpGjFFZalDCcij6kp/wRMefmf/NdVb42gjujJ0lwoE4CQeNq3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CH3PR11MB7867.namprd11.prod.outlook.com (2603:10b6:610:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 07:09:07 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7025.020; Fri, 24 Nov 2023
 07:09:07 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] drm/xe: Fix lockdep warning in xe_force_wake calls
Thread-Index: AQHaHqFI7jpFXmqs6EutbqpJ8PGWlrCJBpwA
Date: Fri, 24 Nov 2023 07:09:06 +0000
Message-ID: <CY5PR11MB6211B51A140CC49ED286FE5795B8A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231124064408.1800646-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231124064408.1800646-1-aravind.iddamsetty@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CH3PR11MB7867:EE_
x-ms-office365-filtering-correlation-id: 6a5ff2f0-6080-46fb-cf73-08dbecbc3f4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q0t5LIh88IqH6qCuedbbmsYzxlRTaCgYrhqLXTFp9XLjFxct5PA2xVg4bdUYk+LEMeXhYHUBQI0leZ3D5ZsILwrfRuzAMd1UD2kzq0YA3StfKMLqqcEO/kyi26BsDkglqOakOfDhjWQf+SHsydATTROuMA1bAucgxSJvPCzk+uA9Xa+XLLNkJ05/llSVRdnY1dHqFVLN1eyPVRNnZYTvysVkDwTQeuFOX3M1t3o/Vatb18bVRELOuCmMxnyfDs2IL4+SAoR48Ru7yeDr8ty6YoiuYmCJ6Z3JxyTILvp4LReI0oktPvlNzmxLqkkLfhsAa/aiAoXy8XnUnaGZy5TsNdh9c2/H+m6wBVDh6T1gccwpSOM3BfRAdDLM4Knutz2E/SZM/GZntUW/w4aInlZiq1FSanXI4wjYDo8GjuLXubo0mzqVmfnbDoyxG4z+Rh34DszEwaCxHrUj5AApfrvhceel9pm1/VwDCca6/D2QkIoC4e2kkh9YZC6M/hCrp6s7SBoPScYHwbMmxFvwAONfFJwL4Xr7CsWGYUoo7wSjnVLdUsMnRKJ+Ira4Y6W04rZkD0x8DQAE3zr115NpvGLBwLm9iFS6neinijHnFlA7mgbpISguYtN1zJk81qH+1uVM7gcS8pzL4kbMRa+TCS+wGXevTcf0M4vuri2EVBYxorQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(82960400001)(316002)(54906003)(9686003)(66446008)(66476007)(66556008)(76116006)(66946007)(38070700009)(64756008)(86362001)(5660300002)(26005)(8676002)(4326008)(83380400001)(2906002)(8936002)(33656002)(53546011)(110136005)(71200400001)(6506007)(7696005)(52536014)(122000001)(55016003)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WexLvLLdhNwliUI40VvecYbfsR/8rYLFjX5Lmo867FD4Ua7T7RwuK3PN9tCd?=
 =?us-ascii?Q?RzuqIXSjCL8glu5oDd7n0Y6cPO4QoheMUsFLFrDjCHz1ET9uI43l2IF1L0Fb?=
 =?us-ascii?Q?kZjiWRvz6kXvTMx++0Mh6AyOBnjN6CwXjvp8AZz8AJHR4bKTTLKqXTEcflTT?=
 =?us-ascii?Q?Em8QTTuuas1Vpjst4CR6H70zdbMouNQ/DVxGFbSj9sAUaeIdfEGfXbzgBVIz?=
 =?us-ascii?Q?zJS5qnX7+GkvwXirBGnl2YLKvc67wmm+iJNA2aGJ0Tdji4KhhvJmPj2Jlwno?=
 =?us-ascii?Q?DOSUXm4TC9oRMo0ONLBZrI3XuSMpudc2ktvZNJDza6YrD+0iIJQp552HKHga?=
 =?us-ascii?Q?HZBx6vfRliyXTtAQSrKVIqmsPPJSagL8ndo0BzpWl50a7K9CRi4CXaxQ2ZbT?=
 =?us-ascii?Q?CKox28+TIO3nEGeIDgRk2y76J5iEJ/8WkEVV0ljZ/+1bfVLELL5giixCGnU0?=
 =?us-ascii?Q?8dFL3vlpTcGV1T+3oWnz7yAcADAiWn9cu0+GdCc3Mfj1Q3BAo9BIZv01CF7e?=
 =?us-ascii?Q?6f51urpLzDHfV6Dx/qV9dY7Hsy/CPdD8aItkGGScbqGGTYTgVJB/dSvtus6S?=
 =?us-ascii?Q?X+XeL6Sgfz9AHXP6aWZoq1c65xEuCH5MdquMTYhh1yD2TVFnzVcj09TkLyi5?=
 =?us-ascii?Q?sFfv4vMdU9Vpyj+Me0E3uqun34IyOKPi8pJpoimN4WAOHQelqe1QhuoqLZy/?=
 =?us-ascii?Q?p9DBjOr0vAHjhb3LxoiPlJWOWr4FE+0oMkYcP1lkWX5nnFUcFRW2IPGBpohi?=
 =?us-ascii?Q?U5ZBXj76yN0HCtrbgOdw4lclxnBL7K/KCzdTkBzHWLnLBDHFd3QBmNyvIRps?=
 =?us-ascii?Q?MY4Kg2uBv1NCLg0+ONbzh2lTlUB95eBVPu51NS3n46D7dZidgYeJKJMz7Rxf?=
 =?us-ascii?Q?o+/cFyuz7kdDSHuQrajdAvD+NPxwSXbS5+dSstJjbVMQ5Cn1NnVS2wSKXJSs?=
 =?us-ascii?Q?UEFpPsDTLEIgx2Kf/z7bCrJ56JIjkt9so6rKc5Y7uInS1O/Yzy6skPlfnTVQ?=
 =?us-ascii?Q?vhkH/8Xp03tu18nsUyDRxcND4Up1DiYOSAZKz3s/T5WWyH+9jIh7xL4KZb4S?=
 =?us-ascii?Q?7nf4DG8Fv+HPSKoQZfuIumf3rSM/kB3GwVK/5NGCIJTas/Fb3svFJ9Imtfov?=
 =?us-ascii?Q?7Cx/l4d9+pVIVFyZYxa+cgoHREJl2QDBukpANzXbo4kt0SUnD3rZqxg5hHly?=
 =?us-ascii?Q?4OZg9ffQ093NZk+Wu7YaQm7MR8erTWum+m496tjG1nJ08taNdhz8uapZjHOL?=
 =?us-ascii?Q?HZGIUVEsq9zAP2UF+pwyq1xZiJHtbDgVBdZcrLNJlDZh9uMTI/RNxE7mnBWs?=
 =?us-ascii?Q?oO5/9ldmTi0QpiLVrvBVUXaKG5WvnmDZW/qU0TT/I7pvNxxYi0dDFFYM986q?=
 =?us-ascii?Q?H/Kst8n7PY5e2L2HSPI1PbE7Ie9XRHLej5TlPLvOcmDVa97wwB+T7rXeFyoC?=
 =?us-ascii?Q?MPKwIeRy8TUnG8cvwCKOo/LDP8jgRaS0I5iWV6wrQHW4p0dAs6h9MSbGfV0e?=
 =?us-ascii?Q?c2H4Cnx2MFtW7HlBBDfSU1rtyNF77OsRcxNOJxroJLte5wfcumMmjoK3hejF?=
 =?us-ascii?Q?NXQMbApn+z7XDAXGdZm22qH6gBEQ47NzvHGN5qVp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5ff2f0-6080-46fb-cf73-08dbecbc3f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 07:09:06.2991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wfFcWLOrMPcNIn3j6Zcnf1KbffjevUMUPUpWI5+6n7E5HPk4ZI4hyYXtLskKM0pqd6NJAUdjcxb8DD6i0+RXyhR1I82QsQWwPwBRzrNy5+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7867
X-OriginatorOrg: intel.com
Subject: [Intel-xe] FW: [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
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
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>=20
Sent: Friday, November 24, 2023 12:14 PM
To: intel-xe@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>; Gupta, Anshuman <anshuman.gup=
ta@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe: Fix lockdep warning in xe_force_wake calls

Introduce atomic version for xe_force_wake calls which uses spin_lock while=
 the non atomic version uses spin_lock_irq

Fix for below:
[13994.811263] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[13994.811295] WARNING: possible irq lock inversion dependency detected
[13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
[13994.811358] --------------------------------------------------------
[13994.811388] swapper/0/0 just changed the state of lock:
[13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
__perf_event_read+0xb7/0x3a0
[13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
past:
[13994.811528]  (&fw->lock){+.+.}-{2:2}
[13994.811544]

               and interrupts could create inverse lock ordering between th=
em.

[13994.811606]
               other info that might help us debug this:
[13994.811636]  Possible interrupt unsafe locking scenario:

[13994.811667]        CPU0                    CPU1
[13994.811691]        ----                    ----
[13994.811715]   lock(&fw->lock);
[13994.811744]                                local_irq_disable();
[13994.811773]                                lock(&cpuctx_lock);
[13994.811810]                                lock(&fw->lock);
[13994.811846]   <Interrupt>
[13994.811865]     lock(&cpuctx_lock);
[13994.811895]
                *** DEADLOCK ***

v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic conte=
xt (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 62 +++++++++++++++++++++++++++++-  dr=
ivers/gpu/drm/xe/xe_force_wake.h |  4 ++
 drivers/gpu/drm/xe/xe_pmu.c        |  4 +-
 3 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_for=
ce_wake.c
index 32d6c4dd2807..1693097f72d3 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -147,7 +147,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 	enum xe_force_wake_domains tmp, woken =3D 0;
 	int ret, ret2 =3D 0;
=20
-	spin_lock(&fw->lock);
+	spin_lock_irq(&fw->lock);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
 		if (!domain->ref++) {
 			woken |=3D BIT(domain->id);
@@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 				   domain->id, ret);
 	}
 	fw->awake_domains |=3D woken;
-	spin_unlock(&fw->lock);
+	spin_unlock_irq(&fw->lock);
=20
 	return ret2;
 }
@@ -176,6 +176,64 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	enum xe_force_wake_domains tmp, sleep =3D 0;
 	int ret, ret2 =3D 0;
=20
+	spin_lock_irq(&fw->lock);
+	for_each_fw_domain_masked(domain, domains, fw, tmp) {
+		if (!--domain->ref) {
+			sleep |=3D BIT(domain->id);
+			domain_sleep(gt, domain);
+		}
+	}
+	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
+		ret =3D domain_sleep_wait(gt, domain);
+		ret2 |=3D ret;
+		if (ret)
+			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack sleep, ret=
=3D%d\n",
+				   domain->id, ret);
+	}
+	fw->awake_domains &=3D ~sleep;
+	spin_unlock_irq(&fw->lock);
+
+	return ret2;
+}
+
+int xe_atomic_force_wake_get(struct xe_force_wake *fw,
+			     enum xe_force_wake_domains domains) {
Is it possible to re-use the code something like below, for both atomic and=
 non-atomic versions?
Any how we are using lock around whole function here.

int xe_force_wake_get()
{
	local_irq_disable();
	xe_atomic_force_wake_get();
	local_irq_disable();
}
Thanks,
Anshuman Gupta.=20
+	struct xe_device *xe =3D fw_to_xe(fw);
+	struct xe_gt *gt =3D fw_to_gt(fw);
+	struct xe_force_wake_domain *domain;
+	enum xe_force_wake_domains tmp, woken =3D 0;
+	int ret, ret2 =3D 0;
+
+	spin_lock(&fw->lock);
+	for_each_fw_domain_masked(domain, domains, fw, tmp) {
+		if (!domain->ref++) {
+			woken |=3D BIT(domain->id);
+			domain_wake(gt, domain);
+		}
+	}
+	for_each_fw_domain_masked(domain, woken, fw, tmp) {
+		ret =3D domain_wake_wait(gt, domain);
+		ret2 |=3D ret;
+		if (ret)
+			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack wake, ret=3D=
%d\n",
+				   domain->id, ret);
+	}
+	fw->awake_domains |=3D woken;
+	spin_unlock(&fw->lock);
+
+	return ret2;
+}
+
+int xe_atomic_force_wake_put(struct xe_force_wake *fw,
+			     enum xe_force_wake_domains domains) {
+	struct xe_device *xe =3D fw_to_xe(fw);
+	struct xe_gt *gt =3D fw_to_gt(fw);
+	struct xe_force_wake_domain *domain;
+	enum xe_force_wake_domains tmp, sleep =3D 0;
+	int ret, ret2 =3D 0;
+
 	spin_lock(&fw->lock);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
 		if (!--domain->ref) {
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_for=
ce_wake.h
index 83cb157da7cc..584bedcd72fe 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -19,6 +19,10 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);  int xe_force_wake_put(struct=
 xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
+int xe_atomic_force_wake_get(struct xe_force_wake *fw,
+			     enum xe_force_wake_domains domains); int=20
+xe_atomic_force_wake_put(struct xe_force_wake *fw,
+			     enum xe_force_wake_domains domains);
=20
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw, diff --git a/drivers/gpu/drm/x=
e/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c index 9d0b7887cfc4..4fb77c7693c2 1=
00644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -71,9 +71,9 @@ static u64 engine_group_busyness_read(struct xe_gt *gt, u=
64 config)
=20
 	device_awake =3D xe_device_mem_access_get_if_ongoing(xe);
 	if (device_awake) {
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		XE_WARN_ON(xe_atomic_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		val =3D __engine_group_busyness_read(gt, sample_type);
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+		XE_WARN_ON(xe_atomic_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 		xe_device_mem_access_put(xe);
 	}
=20
--
2.25.1

