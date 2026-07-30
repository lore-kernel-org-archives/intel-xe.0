Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614A5C53200
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 00:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134B510E0CB;
	Thu, 30 Jul 2026 00:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnOfN6F8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8435110E0CB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 00:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785373098; x=1816909098;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4z1pHyA2XQOr93/LpV244dwp6oRaAaSNe+s4XMrdOF8=;
 b=GnOfN6F8JQspiQNdt5cr0iiJWnjzI6awxI4y76u/DKMSGXhhr6vEKXzY
 6xcXnsiZNWbZ5Gs1j67BJNStvyxIuX5PT97lcE8rG/MCc9leo9HpIIz2M
 c6SpYPRrqRT8w+C++6o3Y8sThw9jTRHam2wYITgwGhN74mKrjzN0haPpo
 BCYGUlKDMkykkHDwmzWydrcrwURfu1xV5jVrVlZv5vSTHO1eXipRGABw+
 tDBvabzTrJQOR8Bp65wWtcFz9mwPDSYWCENmN74skc5ShwhwM61xj7COt
 wNCQMHuk6jgD8l8lg7WdOxM1TwYKyvnaDroeGfBxvEiqqnj0UNyVSuWRB w==;
X-CSE-ConnectionGUID: +7OyIGFZSsq4E9yQhJWkBQ==
X-CSE-MsgGUID: CZ6VZeFJQX+jMd3nhV9BIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85111944"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="85111944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 17:58:17 -0700
X-CSE-ConnectionGUID: obqFbJzTQT2gr7wTGxG1DQ==
X-CSE-MsgGUID: Bd9SQruoSxSPvD7hXzzV7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="262111607"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 17:58:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 17:58:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 17:58:16 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 17:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To7NobXmNf5sYY7tvrTLX7WZ3YQDtNU36G/MleDncCFi6dBzVe3JwjrFG4wMRAmyaK9/em6mkzpRCRRULYaelTi3EpfHd+cDhHDpABTa2lZNvdi+yoXvp13s4kT/ohhrHIbUp3GXexCPNurXTsBxwm8i4z2o0wwPqBDfPOUlLRkQhWV+iFhQKZSp2Bha2VgHlq5jzGLoRGiZ4GIz38bVnMPGl0LaqCwiYywiB76WxKLE8Q6Z7VYYwDN3B9PZMcO5LVyDdrbgfK3wB4uYqo8PQb6KDXk6OFPR1Zzf0WMD5ARfRjYaFW0zxKdguOmijyk+MzMf2JmZVUCpvRnbp9RZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVXd5zIQ9krYaW1USXnt+71WfZVaqN98Pm2qZ6o/s9w=;
 b=qJrox1pvYMEvxGcDKD6ObGlXJt2d6tgcskN1e6zx9W5/VRoPK93US5wkFZ/zy+qzXfBTrVtXDEyh9psmQFiRNDmuhsQKVkjRMhDHjPv6IYI5l4nZd9DNDynFum3fZhDOxbcacjjYPSXVDGDDaCZI8/dz1pIsyL2jRyxm+iviPwM3sA7124TjYj6Lv3rgEWbRYYRUngP7KJJu8sSCRiJ/20Nja+FPfwtEjVyYxHHbiJb7oLGTCzK3MUUaV+RKZ9rc80VsGrhOjBZALITWpcxp5DaziXCO+mIWCuegom23J8C58q6OPGpZ6dEXAHGESJ5+giC0zKiS736wtykkIpNUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 00:58:13 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 00:58:12 +0000
Date: Wed, 29 Jul 2026 20:58:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 00/22] drm/xe: Add structured SIGID error logging
 infrastructure
Message-ID: <amqhoFzQaf1HsuFq@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <dfe82413d317aee8bd39dbbc45ece77f9b6d7610@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfe82413d317aee8bd39dbbc45ece77f9b6d7610@intel.com>
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: df469ea5-ca0b-43f5-0aa9-08deedd5a160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|3023799007|6133799003|10067099003|56012099006|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: w749dsRiX4Ph6HVSmeYqE/vDW8Cs05qzDmpdXn9Qyxw30i/Yh+GdcreaPbbuhysAkjF1C5ut6xWsJ7Q+5FH8RV5yOHGhMnUJ3Oj/VENTzQaFW1mEDCq7AmiCNCs1rH2jDZIre9Sz34UAAlviYIdQmo1EClo0V/ABficKY/ElNtx5mXeIwi2Wo98ExRJV0SkmHEaBzEDJdYBV7Ub213RO99rC8cc6NmWW93Uo7ClOuroENcg0a6/JCE2Qx0SBxpUoh/A7tqHJzHeC+Cp/UjCRsKY2aJcJyXvg9Zvsmmpk+8+Vh6ak5Q9zy7C9qzcqXnPUHLKAQnLjfUHUZsmjVChUN2JgMaPcc/7nVC+GBYHasLrpPGRtuI5358+JicwIE9C24mzB4fli5spO07TVAUMqMKD2rznGO40O49Wn83aeeh+FQlbERAbK77ml4IdNzhJHR8Fbmq6SGOpyjVCgTDsm3DJO6b0160lYOIpTFENJvV8xySuu7gsF5FZRpB/Av5QOo3hN/fnAjNW0CstQEfWtHH4Mmd6ucIqOw7vq8zegyTnof9zaHU1rsFGsW4ogKn96SK3JE8tPR23RZNyIYXMiTJnxBblDtqEuegrjgiDmwkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/1obYe9KbAJR7tLUebkciSvIL7oIUKx2fKuG/z4z2AT/UklPvV6k4mZHgw?=
 =?iso-8859-1?Q?tX1dJVmJp8Iyklmbl4FkA+ezBMNzCnCpXQ46yMkSzntB5cHSxGBon9pjNO?=
 =?iso-8859-1?Q?+0J2SD2q5YgHmZKuHoJVV4IlwAtyRKExaRMdhiEsA8gXZaAXjJd0nLaHUa?=
 =?iso-8859-1?Q?yYtamheo5Bn4Hbd13gyMZso+D6G8jLpllBWV0qfOkBTGQltY9iMz7SEOm6?=
 =?iso-8859-1?Q?jTrnVE28hWjj+cpAldOSvazksuFP9sEvGptH06ve3I6+ubsuW+cPQXDDrB?=
 =?iso-8859-1?Q?bhzVc+IQHHdnd1LTnJ3LSGlGR7lf6m87mz2vCPIiJO/oCwwpbYE3vmXfgp?=
 =?iso-8859-1?Q?g67+REXVaz9XLjO7XXc0e4tvgyDbrjbjpFlxX7KSl0AX37QYJjCo2fvCNx?=
 =?iso-8859-1?Q?Vck3jCUeLxY83t0PwHSMdTCJU+VQqIBp8SqSnSYO/hP8rbY2Nq4T40d/ZP?=
 =?iso-8859-1?Q?1YbdueXbgguXeAb6Dvcu2p3oNneE0pjI6A3fJe5mEEoIIwDsUgMPupb5s1?=
 =?iso-8859-1?Q?Wn+T1YyaS4GeRZ1aNzulg44Ldi1cfdkmL5qzscVG8WMsGr/8lVAt3D1jqB?=
 =?iso-8859-1?Q?Ku/l/TuBEXsEbo64isrNRa6MuEd3vL6artNr529PEOEgau2/FkusPXA0Ae?=
 =?iso-8859-1?Q?L7npAHIhP8OwWlvCtDWDQ6KwRh5xkkvM2Hd6Jaw38HGvklxeZbg9NTMRPi?=
 =?iso-8859-1?Q?6g52sI7eyhhsxDsXTPd2qOIzfkVEIsotS84MsuIiYvJJimszETacamKv96?=
 =?iso-8859-1?Q?HhFAgR+GiAA56gNUJ9A60VFikA3S4vpuZvRFbI5oT8GeqSOEFpwk+HSC3X?=
 =?iso-8859-1?Q?d6KOF5D32e8n64cCG4YQr7WXvB69dFkvQwbGjawz9JBOdz5xLrPytCY7dh?=
 =?iso-8859-1?Q?AhO4+utckJYpnkg6IYHN2xlcpliedXxssRyKK7APT2RUdOdG9B2kuzdyC2?=
 =?iso-8859-1?Q?CVfUXBeVD5TlG782876kzM4h/2K1aKY//6yanfcHsM01sRZE3XJOeCBfhr?=
 =?iso-8859-1?Q?ZO4IiHxwF1p6S82aF/EvfxjxUKNhKhMFaImWyjMVwNYwGpIvB/8x2xlrMw?=
 =?iso-8859-1?Q?T+6nExp1EceXQoT5QlQa5uBwHr3cfmbztK5+t5kwuaHDzWpOEMh0Nl3tru?=
 =?iso-8859-1?Q?L6BkrPa6+9ewYJ/BxONHAZUXU39cdHpG/MYFXXK1l6KiuPwiXluf5AR6DK?=
 =?iso-8859-1?Q?KXO8RndEJLZ7LgYzq6e9zCmUowKWR2co1XhXFEiAIV5S5is4ZGqs+QfLb+?=
 =?iso-8859-1?Q?XyZIXYZ8v3jL8ghkcvNY4W6nwY8ltRzKc8pKqx5rB7Gr286oZSJiFpoGMn?=
 =?iso-8859-1?Q?BkpIPlhXBX0HWGsaFlW9LQb5IhfyQ+5FI44zxuTgIPu6MRpLGa29xP9H7+?=
 =?iso-8859-1?Q?o5kdcsu5miVRV1UTeCgfTgl8O2gCcKzFbSMEuZatDarzs8uPzBFEekmcNl?=
 =?iso-8859-1?Q?iXr8iurFd/HnYSMJZUHYcaJNS+13vIhSgraHf7Oq38XJT363Twe8sJDcN2?=
 =?iso-8859-1?Q?4sXEyenKcZkTojnX3GBz6J6gNBsyJPoKnnJbvSe1g24t1EO7OoGMYteLRc?=
 =?iso-8859-1?Q?EVYSLU3evIdoTuDHPRS4zyyOVh9IQIru9lxd1KjmZVpgkeUQU+fgRHCO8z?=
 =?iso-8859-1?Q?xOE5d/H5i+rLrGmny78c/ro3Xzs25d+zr6/4PVQtbUyaRdqcIMYE5PlWVz?=
 =?iso-8859-1?Q?5gnmNfVYd3wCP+axvJGxqPYsNEpcyEBXCxSw7vyUNMjOXrg02kT5GAT2t1?=
 =?iso-8859-1?Q?49coo7zFPHjNNBMP1oMXIHck3NerYVvmL+yfxWjsqRFZzmR9D0t1t0eMlk?=
 =?iso-8859-1?Q?XtPH5YEQ9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: LpICxeXIyxutAPchLsM9c4aQa3lgb4q/M9eldULVOG3wAkwV5zOhbFTQo33fZgF8/O2ykG9/9toNwdPzWBocEwONt70AbCRK4mQ5mK9lrTV6Mw1LIUcsxftnSR13JvnOu0URO/fx2zlx9+C6zI/Fcn4fhKru+Yf+tZ/I6ltJCe3lf6tX3SIRCFDiSRAspIcvcYPYcs+cx+ZIAHwgggOoQE3ve38/+PRTalNZjbJzkSlOrkkuT+Ly/NObRNDZxFkLmQ3zOR1jkS7/HOhzIHHILziGEoSDjO3HHJtu8B3aFHHXskodMhi/amso++INifZzemF9wKN8gPW4itPXm3Clhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: df469ea5-ca0b-43f5-0aa9-08deedd5a160
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 00:58:12.7816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61mvape0poIayWqkhL86JRI/dYcT/6BTfLxi+O/mUyNm3wwXQIINB99sNd9nUJfyL/Ixqz9QYoYAkqVvteMXGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
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

On Wed, Jul 29, 2026 at 11:31:46AM +0300, Jani Nikula wrote:
> On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> > strings that have no stable shape. That is readable for a human, but it
> > gives fleet tooling nothing durable to match on: the wording changes
> > between releases, lines can be rate-limited or dropped under an error
> > storm, and there is no consistent way to ask "which recognised fault
> > just happened?".
> >
> > Introduce a signature identifier (SIGID): a small, stable integer that
> > names one recognised Xe fault situation and serves as the primary handle
> > for triage. A SIGID maps, through published end-user documentation, to a
> > description and a recommended action; the driver only has to emit the
> > right SIGID next to the usual human-readable text.
> >
> > Design decisions:
> >
> >  - Software-emitted signatures only. This header enumerates just the
> >    situations the driver detects and reports itself. Signatures that
> >    originate in firmware or hardware are identified by those layers (via
> >    their own records/counters) and are logged as received -- minting a
> >    driver-side id for them would duplicate an id the reporting layer
> >    already owns.
> >
> >  - Flat catalogue, chosen per report site. Each site emits the single
> >    most specific situation for that site, so a multi-layer failure
> >    produces a chain of reports rather than one ambiguous classification
> >    (e.g. a failed GT reset reports GT_TDR and then WEDGED). A site that
> >    matches no defined situation keeps using ordinary xe_err() /
> >    xe_gt_err() rather than forcing a wrong id.
> >
> >  - Stable numbering. A single flat list numbered sequentially from 1, in
> >    introduction order. Values are only ever appended, never renumbered
> >    or reused.
> >
> >  - First-order action. Each SIGID carries a coarse, in-tree resolution
> >    bucket (COLLECT / RETRY / UPDATE / RECOVER) so it is actionable
> >    without an external reference, and so every new id must declare what
> >    to do about it.
> >
> >  - Severity is decoupled from the SIGID and chosen at the call site via
> >    xe_ras_log_fatal() / _recoverable() / _info(); the same situation can
> >    be reported at different severities depending on the instance.
> >
> >  - dmesg stays close to a normal xe error line by reusing xe_err() /
> >    xe_gt_err() (and their Tile/GT decoration); the only stable,
> >    machine-matchable token added is SIGID=<n>. dmesg is not an ABI --
> >    the durable machine record is the CPER carrying the same SIGID (a
> >    planned follow-up, left as a TODO).
> >
> > Wire up a representative site for each software signature so the set is
> > exercised rather than merely declared:
> >
> >  - PROBE: xe workqueue allocation failure during early init
> >  - WEDGED: xe_device_declare_wedged() (drop redundant "CRITICAL" + BDF)
> >  - SURVIVABILITY: entering boot survivability mode
> >  - RUNTIME_FW: GuC mmio request failure
> >  - DEVICE_FW: PCODE mailbox failure
> >  - GT_TDR: GT reset failure (which then chains into a WEDGED report)
> >  - MEM_FAULT: page-fault queue overflow
> >  - IO_BUS: PCI re-enable failure after a bus reset
> 
> The idea is not new, see for example [1] and [2]. I'm not sure if that
> was ever merged, though. Would be good to know what came of it, and why.
> 
> There's also the printk index support already in the kernel [3]. Did you
> look into that? If not, please do. If yes, please iterate why that can't
> be used, or extended, and a local mechanism is required.

Well, I do agree with your feeling here. When this request first came to us,
it was framed similarly to the two older proposals you referenced.
I pushed back making it very clear that our kernel log is not an ABI and
it will never be... that our debug messages are for our own developers to
consume and edit as the code evolves. So, I refused and blocked any
attempt to modify all the messages and force them to follow this format.

So, this evolved a bit since. I hope. We have agreed that the ABI itself
is not the dmesg, but the CPER that is emitted on tracefs... that's the
ultimate goal. The message here is just an extra helper and it brings
both our CPER/tracefs and the dmesg helper. So, the printk index cannot
be used here. It has no mechanism to influence or annotate what goes
into CPER records. And even if we modified it, its volatile number
doesn't work with the CPER goals.

The goal is to have this SIGID mostly identifying FW/HW stuff and a few
of the key points that could help providing a guidance/map to a recovery
path. With an intentionally narrow scope.

> 
> FWIW, I think merging driver local mechanisms for what should really be
> generic kernel stuff usually ends up being a maintenance PITA. It's easy
> in the beginning, a burden in the end, and even harder to migrate to
> generic mechanisms. We've seen this over and over in i915, even for
> superficially small things. Part of the reason for xe existing in the
> first place is to use common stuff instead of reinventing the weels.

I agree with you as well on the pain point of maintaining this in the
driver and this is why I liked Michal's macros. At the same time, I do
agree that the macros could be improved for easy cscope usage indeed too.

I also agree with the sentiment that it will be even harder to migrate
to generic mechanisms if needed. But honestly, I doubt that this specific
Intel GPU IDs will go beyond our GPU CPERs. So, let's just contain this
in the mapping macros here for now, use in a very few key places and
move forward.

Thanks,
Rodrigo.

> 
> BR,
> Jani.
> 
> 
> [1] https://lwn.net/Articles/464276/
> [2] https://lwn.net/Articles/492125/
> [3] https://lkml.org/lkml/2021/6/15/1053
> 
> >
> > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > Cc: Badal Nilawar <badal.nilawar@intel.com>
> >
> > v1: https://patchwork.freedesktop.org/series/171022/#rev1
> > v2: component/location dmesg decorations moved away from macros
> >     HW component identifiers related to RAS/FW enum values
> >     CORRECTED severity rendered as an error
> >     more support for const pointers
> >     log 'probe blocked' as INFO
> >     fix kunit device setup
> >     more tests
> >
> > Mallesh Koujalagi (1):
> >   drm/xe/log: Add structured SIGID error logging infrastructure
> >
> > Michal Wajdeczko (21):
> >   drm/xe: Introduce xe_any helpers
> >   drm/xe/log: Introduce structured component/location identifiers
> >   drm/xe/log: Add component/location decorations to dmesg
> >   drm/xe/log: Add SIGID log helpers for severity
> >   drm/xe/log: Add SIGID log helpers for location
> >   drm/xe/log: Add SIGID log helpers for location & severity
> >   drm/xe/log: Add SIGID log helpers for components
> >   drm/xe/log: Add SIGID log helpers for errno-only
> >   drm/xe/log: Add hardware error signatures
> >   drm/xe/log: Extend components list with hardware items
> >   drm/xe/ras: Check RAS and LOG component definitions
> >   drm/xe/kunit: Setup driver data in the test device
> >   drm/xe/tests: Add Kunit tests for xe_log
> >   drm/xe: Report 'probe blocked' error using SIGID
> >   drm/xe: Report 'device wedged' errors using SIGID
> >   drm/xe: Report 'Survivability Mode' errors using SIGID
> >   drm/xe/guc: Report 'GuC mmio' errors using SIGID
> >   drm/xe/pcode: Report 'Mailbox failed' error using SIGID
> >   drm/xe/gt: Report 'reset failed' errors using SIGID
> >   drm/xe/gt: Report 'pagefault' errors using SIGID
> >   drm/xe/pci: Report 'cannot re-enable' error using SIGID
> >
> >  Documentation/gpu/xe/index.rst              |   1 +
> >  Documentation/gpu/xe/xe_sigid.rst           |  14 +
> >  drivers/gpu/drm/xe/Makefile                 |   1 +
> >  drivers/gpu/drm/xe/abi/xe_log_abi.h         | 197 ++++++++
> >  drivers/gpu/drm/xe/abi/xe_sigid_abi.h       | 195 ++++++++
> >  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   4 +
> >  drivers/gpu/drm/xe/tests/xe_log_kunit.c     | 480 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_any.h                 | 112 +++++
> >  drivers/gpu/drm/xe/xe_device.c              |  16 +-
> >  drivers/gpu/drm/xe/xe_gt.c                  |   7 +-
> >  drivers/gpu/drm/xe/xe_guc.c                 |  18 +-
> >  drivers/gpu/drm/xe/xe_log.c                 | 212 +++++++++
> >  drivers/gpu/drm/xe/xe_log.h                 | 158 +++++++
> >  drivers/gpu/drm/xe/xe_pagefault.c           |  10 +-
> >  drivers/gpu/drm/xe/xe_pci.c                 |   5 +-
> >  drivers/gpu/drm/xe/xe_pci_error.c           |   7 +-
> >  drivers/gpu/drm/xe/xe_pcode.c               |   5 +-
> >  drivers/gpu/drm/xe/xe_ras.c                 |  11 +
> >  drivers/gpu/drm/xe/xe_survivability_mode.c  |  24 +-
> >  19 files changed, 1438 insertions(+), 39 deletions(-)
> >  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
> >  create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
> >  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >  create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_any.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_log.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_log.h
> 
> -- 
> Jani Nikula, Intel
