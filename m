Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20360CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 19:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D261E10E0E2;
	Mon, 25 May 2026 19:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDYMdPqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9750110E21F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779736360; x=1811272360;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=erMZTw5q+3bsIHmZv/TY/KENnG3zUmTvzh+D7AFVVSQ=;
 b=eDYMdPqCqsIRaWK1LxDI5xpgV42pcwjxLu8RbNtYdPD3+JD/qnt9tlGN
 bq5wgppqfMEY0PMX9FaYI/nMUeWI/wK99tFhXHvM5zv5Hujw5eTGSMJ8w
 lgM/iC/AdJltTno86Sp6oHEAuxsMiwXdiRcKRCZTiO+5lpzoBOKXlFZZY
 ADF3Dx1i0AfXnSheQRa32xlb/vhtqKSEjDr9rdw03O/zc+T//1VfVO6NM
 j52smckEVIBB/Y8iVpP9Kle5Jm/1QjloaPtT8yD+vbnxj2+lH9vLeumy+
 Q0d5kEwACp1SLvb1iVcTsD90FUgAFr6mGQ+InMPJL5JehMgGF8nu/zUUE g==;
X-CSE-ConnectionGUID: wcyYoVtGQS6sSunDiczhkQ==
X-CSE-MsgGUID: QBzQxgipR4OrdVOyL8OpiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91245287"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="91245287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:12:40 -0700
X-CSE-ConnectionGUID: b1cPgcySRliqylmjYj1T+w==
X-CSE-MsgGUID: 0hVqvMRzQ1+wtUBVEpZIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="237491530"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:12:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:12:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 12:12:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOPzY1pR6Qt7G4HTuEg/ogjBw4S9IKd47+6wSm1NP2p+CqJVB52OvM/ma7xQWAbgkGF1VXya3UMxHTFl9C+fqwmHbSMCodQcHFDBf+lvnBvVfMJY+TSwGEiPslsH5wylqm8P364SQPomXxAb8w0QN08hsOFIa9T/ANTRoH157bJ5r5muS3bWeosDMnkBVor4BQv3GzxfZmWy22EXvaIN+ZlCEpz8UdLDu8Qz28+e+p7a0UVDn8Pu4T7MQzsM865cSmv43Xbf/lZpQ1TalhdebsuRgBwaRXRQhu6E19/JELWY2a7WYLGyBVX7k6lywlZjhic3i6fjgZR8RVVFEqKcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOkOZtbOAmS1HWh0prRi+Tum2qKDJNGv6YWf/uzV+lw=;
 b=imaEkuNTWPZOlSEiDNw9tFfRLq/ud41OBqO/4nqAv0PfboQaaunDXGJEuqP82P/fHHrAF+eTozFfZ6XlPZz7+ROzLsNc60E4Fh4sL/wICbU9qdZN0A1v0gVVeDPxvmJd52/lHoTMBZu7s7kD2PKj4urNACK3Nd0bYF7pvEhiWsXXfIlcinNoeqvBTEdRN8qfHteocbsMTCTh9DJnJHN2yl1r1jkjI7XUxix0ypErxvJxj9tb0rviyR6P37ozp3CH8M2b0h8PjkKtA85Gfk/nnM3/KZqemZqIGKje8zKFAHsGAxiaYfX69DTnG/oD/94uU+8e0yNBHXulmU/JcCX0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 19:12:37 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 19:12:36 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe: Move xe->info.devid|revid initialization
In-Reply-To: <bcff5f29-08e1-43de-88fa-1dfef1fafd22@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-4-michal.wajdeczko@intel.com>
 <87ecizido8.fsf@intel.com>
 <bcff5f29-08e1-43de-88fa-1dfef1fafd22@intel.com>
Date: Mon, 25 May 2026 16:12:32 -0300
Message-ID: <87qzmzgv6n.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: ac10365d-6300-4d07-4b14-08deba919519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|11063799006|5023799004|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OPlpcwVy1roaEPuX98dnezTBXo6fvysqwrSMai+Eki0oYqxLma1YE+ZEPI70YQMsSGJoKQeIGSLMphmAM2pxHpbDUGmznC5FKXmMrptNbcEByDnHO90rQWyAy+vQqGt8bF0gQq0Tar4AqAtrZLhrCER5N3W4+UOsZLIlWHbVVPSYlM69/+Y+1H6J0ni6XQ4LJknl/qcxoFzUCqQ9smXYNJmMXsLrLvFc44OaXbITAv7Ia7HS86axoioClhVpj8wdHl+x+RLqoPr6lQtLteEF9TAs4pcBDiJOzvHMUtRmdhtgTSy/4NMPaEUYvj1ekXXektezAv9U6Epedcxkl6/TrQcm4eGb5XIqyROW3WALDsmTQtOsNK1XTpHfXua+osZVmnP8YhKu9ZIn+CPqruqsQ8ditxONA5GoOBnfJioWpLOPvRcAj4GSvh2E3aFJ8nbd8Ndo/A4UEgoptaqVs3LfS6ZrlhJdpOwaBcjhJsj6luM/tV7x7Xf1tJVnc6ryN+/wd+VF+779DiuFWAkXtoCUIJAqnsHEbwinzn59aHb1M57tMjDwIWhf/2zm7lFiH4YhjgI8HVMjXFyPsbbSMAt3T0s6qonP8GdE0b/gY4tQYz9mq7mIJnnnm/R7e0F0oOtsbTIdPLiioQWoehLb4B6QhXMQ5aX5DZnPRQ9Mggly9Wl25BC5o0znzNht7y2ikPyP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(5023799004)(6133799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5dO3pq3G3n6I9/la5iGa4EOvHAjXDelRpYrEHUsCze5sxX+Xjm+/AlnvYGD/?=
 =?us-ascii?Q?drF90793n+n1BN33x95n8CR/elWp6r74h0YIEglpi0e1rFRJdnzZaIc0OJlO?=
 =?us-ascii?Q?MBx6eTQEAiYsbSHS3PsRcQbWpwDQpKoZ63bcU0M4gqI6u0xwUQaP/sYHqWEH?=
 =?us-ascii?Q?MIIIpfnYNWHRBqmR7AdceqP5aT7mBmHgj1cPeVUxbap8S1Kaok07aXTK6DAA?=
 =?us-ascii?Q?EPmxoNE82XB1Id7PP+9VqESdaoDRuz52D/PIls/LeFrqzwp9JxamnK5D0Y/N?=
 =?us-ascii?Q?BxbWOXQ54oHA1dziSSuubcU5ehHLsIuLGO+ngWSt230xYsf6y6JNIQym0YPZ?=
 =?us-ascii?Q?xy1MNPrbfnRRgTuImN2+8rkyjX6M2RHhR8nhAm9nRw3glucFRRQO+jKgzVxW?=
 =?us-ascii?Q?3bpOiiCST7EccERBMI0MrqXdivjhGcH3jqs3VZQcuQWqueiLhr+UNOZIPKnm?=
 =?us-ascii?Q?AMhfYJ3yL87VMiyqY6cL9UUesqHbDPQH7NJZs5CmoyYpcHSGyS4ANjf2HHvW?=
 =?us-ascii?Q?8FqldesvN0kDgRxL5Ex0ZjmFAVOnmGkA1EDhb4pC1K/2bkBm0GCamP/hFssT?=
 =?us-ascii?Q?liX/cetMtMNpOLHjddazfXNiXdY7GY0sKDSN45fM6l7uDuNCGxwLsU/pMsD/?=
 =?us-ascii?Q?SWAfoc1Q5V/LMz78wbUmw4f9wIFWIrQFWBPzxSVjvAdlf9lA4rlzlYkK2alF?=
 =?us-ascii?Q?B8PoxeVuxZbPB7W4OFDqSUpN36EmLrLHaOapjIxYgU7aMMzPsZblaRpowQ6Y?=
 =?us-ascii?Q?uW7RHNXygv+r0WiJAuP4LYRUoJAbMvKQDOGb6uqAmmrbn8fzTsmCZhbKwjAh?=
 =?us-ascii?Q?n4yaBmpnFevgZ5sf75DXQyjqSRSD0HbKUkObrlhWjCbsykfi1J/e5hftGdnF?=
 =?us-ascii?Q?82SpyTxe9593ITzM6g/4A8sSb8buxyGfmUspciqli0FRmVMqZrNcJyyvTukV?=
 =?us-ascii?Q?HObNtB/bakwmdAmvebedpkb5us4TAOX6Frt4rqsR+8qrF1O6aOAMsS+CUD1F?=
 =?us-ascii?Q?nmFrK8zFc30FQgeOYUMsKeoGxopfFrpP31zX9wjCfJx26UhXxXf5IiSumBAA?=
 =?us-ascii?Q?yr+U8HVOBypE8uP5vW8EAyZ8eqUNLn2qRqBd24Fh+Go58zRkz/5hBNsn3ZhK?=
 =?us-ascii?Q?6Nqqhx2u/zjTSeVIDw2kuavnTIykN8mvpjij3PDX5e1G4cjep3pbXiW7RmQ6?=
 =?us-ascii?Q?v/gt4zHXoNOf9sE+FZjEuZOXV9xTwjnW+/fS1lEFRIs0KN/Dxk03lI9f7qL3?=
 =?us-ascii?Q?aK4Z/yxca6WdXW6Ti3RpIJ7KAjijIyLnuP65GJG7wdiwEEk9XN4o6KpPsp9i?=
 =?us-ascii?Q?9TvDXmzN8Bw6U4EMfSVhukm7gaHQVnKqU7soVnn5hP2IPR6xQFNtvclCuL9N?=
 =?us-ascii?Q?DrKdhcS1wVKU/ywHNW8tda2ITrPFCt/kUpX3oXm6C2jAMwZ6lRrrRo9Dc034?=
 =?us-ascii?Q?VYdwkGBVYjt1ds3PU6dYK86+UAaZ+q4WPUNCl2f06ikF/ZnvWRnb4O1k5EcX?=
 =?us-ascii?Q?OWP13bEBQ4VB0ewVjsXGjfMcMm/51ucQS1/j+LdlEx7EA40tkq654PRt8hqs?=
 =?us-ascii?Q?KsmubKzCSZnQlDLHti8w7BYEPLPqmy9QWjSYN+1spWd2TMP/Z6ts0Knza+04?=
 =?us-ascii?Q?O1AJLnbPiyhDGVGUhWc9Asb5IRD8nxPZIrNsMWJ3vLWr9Xc9CfXmpC6iWm8t?=
 =?us-ascii?Q?vNTxF+S9Zs0P4YIrUXZTUiH9U+9eWdGAcmwtizag/nMhGKJj/R/QvLMMrKIq?=
 =?us-ascii?Q?1ACax40gLg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Z/QQ2S8A6Kp6ETz0FnwTbTOu5bZT5eATrzPr+KL4Nl+Zg7KBXN1MEiaBdh4maOai6J4uUSWIQmCwD9sS50NOaLgZ4A8NyijsrPVCNIOo9P0iuPPNLGqUQQen7z67gCrw3a3CQQirt1FTe3utFlbNLfI3Gvya+MYbiSZUAFEglGR1B+wU8rTmJELAZBUCF45OIFGmDvcUEf/M87fux7OVjMZjzVC4fm00/pmgjfr59OvyzD/g2AsAUaDXKp1th0jf5UZhISqLjG6rF1e01sRuBeFTelGcWkVDg6aC3HfTs6n4/+oRcuFXNco725+WNuCNUoItsviONhLIWd+3WYEoJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac10365d-6300-4d07-4b14-08deba919519
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 19:12:36.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKdNGtzv6gHI76NPFdWqolo9HqsVmpuXnyT7aVgAk6YnVRoez+3jViLczofWk3jNAzb5hX5wv2JBOIxjsLCrYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> On 5/25/2026 7:47 PM, Gustavo Sousa wrote:
>> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
>> 
>>> The xe_info_init_early() is a place where we initialize those of
>>> the xe->info fields that do not require any additional hardware
>>> probes. Move the initialization of the devid/revid also there, but
>>> to avoid breaking the kunit helper, which also calls this function,
>>> keep their initialization separate in sub-function so we can easily
>>> stub it when running the kunit test.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++++++++
>>>  drivers/gpu/drm/xe/tests/xe_pci_test.h |  2 ++
>>>  drivers/gpu/drm/xe/xe_device.c         |  2 --
>>>  drivers/gpu/drm/xe/xe_pci.c            | 12 ++++++++++++
>>>  4 files changed, 26 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> index 860409c579f8..7c3428ab4c89 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> @@ -311,6 +311,17 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>>>  }
>>>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>>>  
>>> +static void fake_init_devid(struct xe_device *xe)
>>> +{
>>> +	struct kunit *test = kunit_get_current_test();
>>> +	struct xe_pci_fake_data *data = test->priv;
>>> +
>>> +	if (data) {
>>> +		xe->info.devid = data->devid;
>>> +		xe->info.revid = data->revid;
>>> +	}
>>> +}
>>> +
>>>  static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>>>  			   u32 *ver, u32 *revid)
>>>  {
>>> @@ -369,6 +380,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>>  	xe->sriov.__mode = data && data->sriov_mode ?
>>>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>>>  
>>> +	kunit_activate_static_stub(test, init_devid, fake_init_devid);
>>>  	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>>>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>>>  				   fake_xe_info_probe_tile_count);
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>>> index 30505d1cbefc..46f961f75ecd 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>>> @@ -22,6 +22,8 @@ struct xe_pci_fake_data {
>>>  	struct xe_step_info step;
>>>  	u32 graphics_verx100;
>>>  	u32 media_verx100;
>>> +	u16 devid;
>>> +	u8 revid;
>> 
>> Do we need to add those fields?
>> 
>> Looking through the rest of the series, I don't see us using them.  I
>> think we could just have fake_init_devid() do nothing for now.  We could
>> come back and add support for having devid and revid values when/if we
>> need them.
>
> hmm, we can return later, but OTOH this is a trivial change with near
> zero cost (as this struct is used in kunit only) so why postpone it?

Because it currently looks like dead code to me and maybe a distraction
for someone reading the code.

If we are confident that we are going to need it in the near future, I
guess it would be okay (although I personally would postpone to be done
in the series/patch that starts using it).  Otherwise, I would avoid it.

--
Gustavo Sousa

>
> existing code can still keep it uninitialized (zero) and any new test
> that would like to use devid/revid can be written immediately 
>
> and actually I was considering updating fake_xe_info_probe_tile_count
> to use new xe_pci_fake_data.tile_count field just for completeness ;)
>
>> 
>> --
>> Gustavo Sousa
>> 
>>>  };
>>>  
>>>  int xe_pci_fake_device_init(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index cdc7e0935c13..b498147dcf61 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -521,8 +521,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  	if (err)
>>>  		return ERR_PTR(err);
>>>  
>>> -	xe->info.devid = pdev->device;
>>> -	xe->info.revid = pdev->revision;
>>>  	xe->atomic_svm_timeslice_ms = 5;
>>>  	xe->min_run_period_lr_ms = 5;
>>>  
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index b1f5f0098f26..6b1a4cb7ccb0 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -727,6 +727,16 @@ static int handle_gmdid(struct xe_device *xe,
>>>  	return 0;
>>>  }
>>>  
>>> +static void init_devid(struct xe_device *xe)
>>> +{
>>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> +
>>> +	KUNIT_STATIC_STUB_REDIRECT(init_devid, xe);
>>> +
>>> +	xe->info.devid = pdev->device;
>>> +	xe->info.revid = pdev->revision;
>>> +}
>>> +
>>>  /*
>>>   * Initialize device info content that only depends on static driver_data
>>>   * passed to the driver at probe time from PCI ID table.
>>> @@ -742,6 +752,8 @@ static int xe_info_init_early(struct xe_device *xe,
>>>  	xe->info.subplatform = subplatform_desc ?
>>>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>>>  
>>> +	init_devid(xe);
>>> +
>>>  	xe->info.dma_mask_size = desc->dma_mask_size;
>>>  	xe->info.va_bits = desc->va_bits;
>>>  	xe->info.vm_max_level = desc->vm_max_level;
>>> -- 
>>> 2.47.1
