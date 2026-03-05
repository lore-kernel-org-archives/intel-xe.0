Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91DCF513E1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E6610E112;
	Thu,  5 Mar 2026 22:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3f6E8CX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5751A10E112
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772751000; x=1804287000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0pL7TxEN7nZZ2KuVzemmRdH1DVLvq3MhFSpiMlIZQ8g=;
 b=Z3f6E8CXqLk2PQcuJKgX6k8W99HDXNyZRUsYC13u/4dBVnD7L4j5P/2V
 SoVFC/rO9BfjA97hX0fGose+o96cKNm9dohBMkstHMa0jrnPvZvGj4naM
 3872YeePId0vauMxkpDVVRjzq/UygBvVLkvozY/KlQ9uG9CNJVTeLQf1s
 iaMqPwMlF5LVaPBd5za9GqX5zJ+XKO88i7nEv8Ft8l0tXyfwocn3MOnFU
 MlHvBxwyJKRh47A/0gr3SbbDqMYP6A7RzxqeZN8qN2RDk3HHHxFdsmV9s
 G6mKbkae8ZdUYZ2hYCdMMiZjJLvOcVGOJCTWHAQ7rnmRTieXRIRkxWGVp Q==;
X-CSE-ConnectionGUID: 4ZulOJ/cSHWxBYyxjGVW9Q==
X-CSE-MsgGUID: ovep1IglTP2mGuRYbJsJmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73728139"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73728139"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:49:59 -0800
X-CSE-ConnectionGUID: r00V0cC9R8a16fet5ZrxXA==
X-CSE-MsgGUID: rMj2t9utQ/iA6/o50j5jtw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:49:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:49:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:49:59 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:49:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LV4hQsUBboPCoKINzVr8svIMRTak8feqC5XnZvYYWuK+YijLnnxz4Y4wodFjkmc8fJnuPxAD62+QYpe1mSGCYwGHS9+rASBFVjK/YjVgagspX2s7yRgnWOgm0z4JETxPWAUNx9hLQqc3k9+zuMBSlDDKBEbiD1yWzd/JySUH1EX1ISVJTTCndxphInBphtqFp6cL6LYdPWL9ip4F7BLHMCeJLI5xir2IC9coEJu2C8rI7DLEBwSBmSbuPdc2WAPtvMdjYStb2U0bfcxEFqsyo9Gyf2MAV92eHM3ARs7aOm/gVarny1WxyvMHHt3omofJxccdFWKCgv3dM/fWyhsgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4EyAEaI3q1z1whePlPBdBz9UbKU0zPcAsWdnSsTW/Q=;
 b=dqGgh0zfFqJDfBWimRnrFfyDGFBkV8U5SiGF1Aw4Q0k55cgizS3T6bOLt+Qq9mKO0ZG9gIejRgkcAabFcSw68vO6Hv+S2siaoVH9BdHZuk/LNy/pHmo49CYM80wRejG1nl6QWRJuCwR8m9vuCwVEtJW7RPvPNW7q9ZeVX+gaE22Ci6C1JAPtLKP8PSNGjE48ukjdHm9uqkYqbv2TzuFuYLDyX7Co8hSNnPoOckgKFq1vE7oXvq5yov1PH86+l4A+jT3MyQ0uGP1puTdHyXYEINmC0qHe5YelpwBf1EsYIA0lrsSA9LCK/fdbpAEid+YNI6QbVso4MmY060abpsWN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:49:56 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 22:49:56 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2] drm/xe: Fix exec queue unwind on hw engine group add
 failure
Thread-Topic: [PATCH v2] drm/xe: Fix exec queue unwind on hw engine group add
 failure
Thread-Index: AQHcq2laN9II6Z8WykWpYCwmZ2ky3LWgdcsAgAAXf9A=
Date: Thu, 5 Mar 2026 22:49:56 +0000
Message-ID: <DM4PR11MB5456876785D4D3645CA62EDBEA7DA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260303235219.1035961-2-shuicheng.lin@intel.com>
 <aan0UAPxjnKT4gHY@nvishwa1-desk>
In-Reply-To: <aan0UAPxjnKT4gHY@nvishwa1-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM6PR11MB4531:EE_
x-ms-office365-filtering-correlation-id: 54810604-b388-4782-163c-08de7b0985de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: Pa9TKvSueIugGWhL33o/XZiw1/Qx5qm6VzaxeruQvIAumFa2rp/D8PsmFFFIfkk923U3OzIv57niZ1VEqhBapE3rAWsemNVfTtS4EcblVdf7Voihjp0kwXYF865td56O0Jb/PZqcq9XTzuHd1H4tfNvZVfuKzVRWYgGHfM1M6/dCe+BWHQtD8ufuhSK+O0tSfmkAF238KGCRJOk0btFPg89fadRYGNR6QjEL+1DI9w0sIGfqnT10HVOAIioDQPbTbD2TUbE+VIddwra3h61girPRfs78tS0DUxhHnkyU1clN0Fj9W67RGKdxSfycirQSHI0Umd2cQfuvMEELbpf2gEJ4gtew/Ff+n0MhB69dSEs0AaViUy91Hm04vdtNEMSCnkW4dkXo1xBBfsgFdV4i14uRKTsRop85lRXTuqBmtDejXdHXQKW4RYZsP0H3nMIvdrADOGJCCcSxKNfC4oxeAvnKv5EU7O3QbArpc29Ln10/TxZd5r+1ho1MVLz337QrJykYBvNkGdzLSy5K1jjrlCe9jln/2wieIc1aZ+l+5+zRi6YgglDW6XK2ewqH7mCrpiAK0wMn/6WEPGZUlw2lLFxzb1ilkXQfbS2DlwCA+NudAfNRAVYGO4aGx2T6HvplPKnAL6LENJhH5715Prg+2L9AOy2tTfp9Ctq/cm4cYcd/7T83T8kO1yrCQpsa4qGpsoZ/b4Wy6g2uKY9+5vCtO13tt2igKzJQf0Sa/wChHiPSR1/Zb+otSZhO+JW4FgmiEjRmscLWq4EJcmUhARNYGXKbYhsbD0ASkhPp2hkvgXQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2a8E2kTHKyAP40wzJj8NkS/Y2gVFYZAcBtlceBD5cbibp07QjKxjbyZiH6Ko?=
 =?us-ascii?Q?tcgVLjOI/BhTi+uxiPSEnY8cJq01VKdX5JWM+sTwLswAWAnikp/APBiJujyn?=
 =?us-ascii?Q?u+6RO1OoQkvy6RioXWxCrUKmEG5eHKp36Ncyl+PXT24HnYx+m1P4UZ5hhm25?=
 =?us-ascii?Q?uagOvqmnFOFiu6JokL5BNvFQ72gS1HHmcV4JVu0OQ+FVeHR3anwa1adY7r8m?=
 =?us-ascii?Q?EK3PRFctTixypoqIcmoquoSWRavifNu6n4sokwDqCMTwcr0XSCP/lj9MMTPV?=
 =?us-ascii?Q?AMLc+HI4iSRYhpWszPn1ppCAk07NxGK2NEwnlrWQdmr4gR19xjRIpcj5RaqL?=
 =?us-ascii?Q?xkMpjaPhsm8VU4D0lilNaSl2QTgIHYWuN+hnDSJRRTr8ue7l7czKHYJGX7zG?=
 =?us-ascii?Q?PUzrY621cSgGMjAX90KMgjfG6vrhkRe/DWl2J4liiV0915+AFE5isMTLbIjJ?=
 =?us-ascii?Q?L5wObgpKoFKjifWNtfVjdvl1y2Pul2cTx+LYOzX7EDBZiGxQpyf9Ij01creV?=
 =?us-ascii?Q?nFtTEf4OO7U8tbj8wx5NC9yUI5SzPpKb7CdTpSYELfaaHUtNL4zH3bnBzHtu?=
 =?us-ascii?Q?X7p7XavLHim1CKkEnBEDXqRXm9D7EzVWoMgDbNI9mzyekQnvsvZNhPMkCfqx?=
 =?us-ascii?Q?sbD/WuU8dX/wRoSD7APJi2IyiC2Pi0LwbDz9MpseOy/zo2IuuqsoMECHz3Io?=
 =?us-ascii?Q?YrScJs7Q2I7Ciz7fvEmw36ZWgJQGMo9R7hz+V2/xaYKTSFNO4QL2Qg3yG3nY?=
 =?us-ascii?Q?vmGVBVfeJo0sO0KQOkLUSThTtXTkIRgQy4uCbc3xbln78gdlCJLtAQ/oCALp?=
 =?us-ascii?Q?40EhaHSqFAdhIat+kTOuhqI1gtKjatUWK/sH/9zZOqm3rqLbqQ7vpS0HKSe9?=
 =?us-ascii?Q?g+YyjJd7P2uPSdscIyaAbfCVO10eNrR36h4qe0aV1+QxxRi2LUulGhCsSPv+?=
 =?us-ascii?Q?2tRtvlwBUJMPN4PIsLqxuMHR1xkgCMvJ4QAPg/8eojIvM/b5qD1+Ps9QRTMw?=
 =?us-ascii?Q?JFqWAML+8evmTQRjv06f7AvItgTxg1LafPT/OPhodO4SXyXzjulm+deFgi4J?=
 =?us-ascii?Q?St6Yg7DJjIvGdW9WxGKChocuaQGh9iDfSR0CstMq4y+D6T2LUnUryzq0zcvB?=
 =?us-ascii?Q?LOtRbxMEtO9SI9jtfRqDurOt5DHKn3CUqofhA65Fi6OpfhHJ1CyUnQUduYGX?=
 =?us-ascii?Q?LXae7bAyrNtUTTLExOFiG/3H/lQ3zVb4WpinPEM+did1z5FRJ27KldM5Sccl?=
 =?us-ascii?Q?WoayOIg7d/miBlLh9caN+lTADiIkreSvMPLLtqMMjBjgObuY7673lxzCJoH9?=
 =?us-ascii?Q?YbgpVuPlFdUmdydm6tG5WF4ExI3qnFqdYI79k0+U6mzKdCKQSbvhMuii2JbK?=
 =?us-ascii?Q?crLmEdjk+F3q59sH9qG0rMlrNNm6ei6ka+IFTlvbZWwBxJ4GXSCHP7bP0nRn?=
 =?us-ascii?Q?pCcXEeupBbySkV17ACXDNR9JG+rTOphgW0MQpfXxyFXXyVCRWncLDiRvtb3a?=
 =?us-ascii?Q?sIEXH1AN199rRh775HNu5dFMGCm/38Lxp8JBKnxvq6wecyVYK0vmtVOI2sdz?=
 =?us-ascii?Q?fIiMI6qRfsf2OywFxUdOTIC81B3mXoaiiDdCecQ/cxFK4r98F9JvoIeCh8GG?=
 =?us-ascii?Q?N0xYQg9RmRQjW8kBjQOT4cHTJg0R4pOluXgR/4YI5jTmLvKfhs27dmyLUnsq?=
 =?us-ascii?Q?D861vMVVMbZsoy3Q1RFX9muHMcPqZKM4RDfOAmh0y/ZncZvkqTDVp56ThnS+?=
 =?us-ascii?Q?NeMdiLO4Aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54810604-b388-4782-163c-08de7b0985de
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 22:49:56.3472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YwJJgTbUbSHHTqiw8gNaObjDwGGKmVlEHi4ihRB+HWcbZlzub8P/Jx6cnWs4boIY+pN1Tz6BfGjPkCDhzjE8Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
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

On Thu, Mar 5, 2026 1:23 PM Niranjana Vishwanathapura wrote:
> On Tue, Mar 03, 2026 at 11:52:20PM +0000, Shuicheng Lin wrote:
> >When xe_hw_engine_group_add_exec_queue() fails in
> >xe_exec_queue_create_ioctl(), to undo xe_exec_queue_group_add() and
> >xe_vm_add_compute_exec_queue(), the code should unwind through
> >kill_exec_queue rather than directly dropping the queue reference.
> >
> >Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi
> >queue support")
> >Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >
> >---
> >Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> >Cc: Matthew Brost <matthew.brost@intel.com>
> >
> >v2: correct the jump label from delete_queue_group to kill_exec_queue
> >(Matt)
> >---
> > drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> >b/drivers/gpu/drm/xe/xe_exec_queue.c
> >index bb273ca02d28..4dc59f448f2e 100644
> >--- a/drivers/gpu/drm/xe/xe_exec_queue.c
> >+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> >@@ -1297,7 +1297,7 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
> > 		if (q->vm && q->hwe->hw_engine_group) {
> > 			err =3D xe_hw_engine_group_add_exec_queue(q->hwe-
> >hw_engine_group, q);
> > 			if (err)
> >-				goto put_exec_queue;
> >+				goto kill_exec_queue;
> > 		}
> > 	}
>=20
> This looks good. But it makes me think if we should call
> xe_hw_engine_group_del_exec_queue() if the xa_alloc() below fails.

Yes. I think you are right. Let me double check the code and update the pat=
ch.
Thanks.

Shuicheng

>=20
> Niranjana
>=20
> >
> >--
> >2.50.1
> >
