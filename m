Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFD6CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3077610E9F8;
	Thu, 30 Oct 2025 15:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liVjLraZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF2E10E9F8
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761839230; x=1793375230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j+yKPysC7980SbfgHAOG6nc8hijcazp7fdQzlYqD/sI=;
 b=liVjLraZHfL+SmTKmHPeSclWy0ZlgqfGNoYWTwxqY70BjqVOCIJUFDWM
 8Bk03qRGLoRWVVf5BsD8C2pKPH5fTYJ04ybW+zEdjKBbJD8pBbAHGH5Df
 fQLqTmyAmsLMKwXTRcYADkC9CnrsRqPJxK2xv9/IF+Lmu5rI+MmU+HX2B
 tpWufRP3IZdpfT/xzwPtQwJzW5QR7qkwSU7M5mNpLWan6+s8PW0L7fPPz
 HSffL83UG5EK7LjwgP+Z5J3YoYgdfj6TOc/bMfly9NR8vKyT1YztcFHE+
 8HcuEQCGsjrwAkrUkRsGus/2gUOxVdKSJkS9Ce2fGSCtGdkog2xjwrztv g==;
X-CSE-ConnectionGUID: NaFIMqWqQoKRaCwPzKZ7Qg==
X-CSE-MsgGUID: e6YqWIomT6SKlYIUZI69hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63190071"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63190071"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:47:10 -0700
X-CSE-ConnectionGUID: 98XA+R2kRw6cpSy5rUBXYA==
X-CSE-MsgGUID: u7cCoda7SyGlWVWjzsEYqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223206409"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:47:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:47:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 08:47:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gj/Y4pcM9kMgHdqGUHKhlzEwX+TYq1Kv0h9vkaxDNj1ERjrnIAIws15B5TtAOJWi1B79V9SnlEQ4wSDsCGh3r37Yonj0VN8OJ99raex+SzShEF0wV8ZLotxUSTWo2Uyo5S4+b94ZCmBSdHIavNX/+DSz3E0NojfPyYOCV9tPNiaU4qnI9mW4JaguLgtrajuu/XOOpGZ1aY8S9DLB2ojHDWzugGOTFrN++y2wFbaa4CcFFpozjIs+b0iiSzjbgBLdixLpwdZX1vcMTkafQaMRJi4bjS6X0zfpYLJ66OuXenAsvptDSYuHOOzAAbMbqp8hzAeQVmbR8RO5GxYsigwZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JETXYlAsLjqdXa61Kp9CSsgaf/aQ6BH26J4XAchvKeg=;
 b=nl51vhAV35LFcAuOJEwHpfggVAdya1HaWmNGfvTFYBNSA+5H1XYAyuBLCCdpUn5RkEn8+n/gMw7N2lWO3Dc/vBoO+AzT9dGbywISzuzngkq+5sTyAJvIPJa+naLJFqIfnVj5hCKMb8P3VBPHQvrymOWBdbyVJJ8mlRhZ8tkYPt0hZSapT+gkOV+tq7Is5bNzxhPy0qTQSbArKEADoTNDbTgXRRLtk93tGxmxn5aL51gds7kuboGtKCCrtbbhAHTW32JF1fLJqs/O0uebf+Thty1ejGkQd5dVq6rKc78j40W9CScQ2F39nqjsmDTzv7kkD3GSo1Jn5+9siiCtbol99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7357.namprd11.prod.outlook.com (2603:10b6:8:136::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 15:47:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 15:47:06 +0000
Date: Thu, 30 Oct 2025 11:47:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQOIdza-zd3ES9xw@intel.com>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
 <aQM1oKHBh0GvQQK5@black.igk.intel.com>
 <jnuis4h4uq7he4yq52rsb7ee6jffgclyf4skvftu3m3gsnk7xy@vhtbsgchkvyx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jnuis4h4uq7he4yq52rsb7ee6jffgclyf4skvftu3m3gsnk7xy@vhtbsgchkvyx>
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 585fa269-ff9d-468b-1f46-08de17cb941e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?udMcE/VlmCtISW/RXHxARJBJtFMuOduvud+YjCCNOwt/9OhGMcSmayccKq9e?=
 =?us-ascii?Q?8ubNh06NDtDWHaomFW0pCBBJlksbqwXLPMslv9oY2GxfrvwZ7TtMjREZjuN4?=
 =?us-ascii?Q?4xHswDjaxh221rYY2rjuN2U1xsymOl3VTIJ2g+MDoepKDb7N5I1Z4r0Z1nQP?=
 =?us-ascii?Q?l8d4e/v11iTktCZ1bVEGtNFWVz1PbMCXhZKyaX3LbfCaHft8kTY+rhqFtQrN?=
 =?us-ascii?Q?IQrkhn9yW6QkYX8I3SNP9ax73MF+q7DQmolbcFvZiQwjFwGzgJbzCUtPNhoX?=
 =?us-ascii?Q?7bjf4Ux4ZFHW+NsokDxMhkcfMGtgblrp2kG1WU/MTI9EbD59q8me5CR7MaSt?=
 =?us-ascii?Q?BiHtIMEHv8xfa60UMVj9os0wbNAOS8NnQftil4NSWMPsXyMn88C3+npi8lr6?=
 =?us-ascii?Q?XezAFXg8fnEKZxMrmDd6Wz9E6s2o7FI259eI7XikBf9dRMR3mHGigpjHLZwI?=
 =?us-ascii?Q?oPTJg37HiBYsShX17+20nmhsRCkacF1R94ZTCcrIHhEMZLNYvbtgVrJyNTUe?=
 =?us-ascii?Q?5N8fuSg9Yn4ZhO/ybSGnY5jJJ0Fj/3p6OyJBkFfWjwM53afBjmhwqJh6ojF4?=
 =?us-ascii?Q?QVPPNIwZrtX3hIstiFBp3X8VNT5g7pkq3LAOfT70GP6ZKlUaZk/T5kIZ4r96?=
 =?us-ascii?Q?npM/u6loHB/KnNDR6xfjfvKn5Am3I7fN/5+KquTPEPte2/OPEytwbjXUe+vj?=
 =?us-ascii?Q?hiLOG0soHkD4fr3OO5TmE/gjTtzU8hXQYYm4jnzQlS3AZ/68UuxcxUW3gqBY?=
 =?us-ascii?Q?UytTSqEOLnV1Oop5fYoRRlp7Rk6gNJSAULJP9LRKJcRInfCkVOsFEiJ3Kacb?=
 =?us-ascii?Q?3rfUhOKOqa/Sx99QaO+sekIm9Rv3abOfJYwqmwJIOVFCZkxn86Q2uz/wJSX6?=
 =?us-ascii?Q?729eJL18dhDz2HNNp6D0gILI4xmD5YxOJ6kNLFivp2fyr07AbwJ7wcjAlYRQ?=
 =?us-ascii?Q?rHz41INtXYy5+WqJioz/daTb+m+aVPoZn8WdUtGMQPVw4FsbbZ6KM4VvbnkP?=
 =?us-ascii?Q?FWFigKHMejpX4jyPlq1yJcb2rsu5uMSb2zoQtzvGxEXF3RGgPMtR0xzwqarw?=
 =?us-ascii?Q?x2tIfQZyUTf84lWjrm2RGnCif2+AH2alftmXq+EbNJsHxgfMHcnhG8NUgXmG?=
 =?us-ascii?Q?1C3YN11XJFmbpmDJppnuo8x5nrw/qQyhhLx92vgtFZBy4IWXnGJTSPNmy/66?=
 =?us-ascii?Q?c9TCrso1OBItYuuxV9F3nnqu/WfO4sMRxu1UjRNUD2uZV6omDnyegUCKzVb1?=
 =?us-ascii?Q?wXFyO9iMICkpKMh2nzrCTk/8rkdukj0cDM3HW72QvMyx2FNhSOxE8X7o/Lbk?=
 =?us-ascii?Q?CHtN6J2UnHFBYrewWZuhVCzX7clL5RP0Yms+qQ1424yGZC4mL1swi8ogEahc?=
 =?us-ascii?Q?hr2H8gLSW6ntSs0/td6zrNmgMHW0wNJDCqUueGoXPYfGautjnoJdPQk2G4Ns?=
 =?us-ascii?Q?X4GrjMfSsG2Xjar7ZdBpWludgcC9UBiuRa9i5Rgd2pwGAi0JNt6SzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cj3DPNwR8VfKEnmhD3lMY0CXs8ZCVBH55m//L9vO4l7J4DsJZ8HNxSXvCEOe?=
 =?us-ascii?Q?v+tRfPcZJsB9lCOKzzm9A6Q9xmNhow3Yk9C52OMKTd74uJsm9zXj7XKoLp05?=
 =?us-ascii?Q?Z4cRP9eeX8XK/PGW9Iqh2yFW3n/y9Zl11SmTxjRv2y+xCiiJSPlQ147zLQkq?=
 =?us-ascii?Q?3ygP13TtKFsnUg0jQ40vlxhbai19xBLMNXdmWqSHW6F2wfnCySvTg+F2T8aR?=
 =?us-ascii?Q?Z9VIW/iaUY6MoBzuJjqrtBbqL3n9TR3aIvE0gnv1Sm56srpDodD8ylAwhDXL?=
 =?us-ascii?Q?LLGh4mXwSq8B++rKZu/K/TI66x6x2SzjsXFNWbpco7UyYLVqGrMaC/ooDQ1c?=
 =?us-ascii?Q?dMAADoljcvDCf/TBuuPT9w9Db+nyuN+OFjaFX1bPn7Ns3l0aLUVI1yOTcW24?=
 =?us-ascii?Q?kwWDTl8PWkQB2Neipz1RPGNvexlCrsNAPFDKYCobtTOaXz2xaKCCfhCX95oz?=
 =?us-ascii?Q?CnySxU9cdWQZxwkW+VrCfglxAnVTYE0longAqGpxyU0JLyMYUhp8fLJcsui7?=
 =?us-ascii?Q?q3tHZtB4+3sU+PWUZSrbmCGqvMMImoHMIdE++VT5B/lqaeW7qM5wyyhTNBR1?=
 =?us-ascii?Q?WqyeUa1KnF+5b70i1GsJ/fCjJf+Ozz779mHnHcUcIQ07mmvXcZXfTv0qm0DH?=
 =?us-ascii?Q?QjJ5MqTbduWzu4/t7M6BE85gsTx8Xl39fT8qWnPMglYG6kkOjpx81qz8NMJe?=
 =?us-ascii?Q?wSh+dxxzgKLA7Avp0kSXsq/EFH9dnZNhF7bPZJy/r9WHx/N2pVzImWwhHitj?=
 =?us-ascii?Q?AWuNrRppGsURjgcpogIP0DvsASdNnamPERX2Ptrqw7NMk0bPsqRUiRsHFSjI?=
 =?us-ascii?Q?D8t+FBQOY+siJp2Dg71ZstslHsHleO2iu+QjA+O/CreNOlXfO24GGXmktW+I?=
 =?us-ascii?Q?G1jUtGo5Ymy8gPxeQD0a1exqOeY3de0GbQyfK/6t58dDv8rIyepJsztr72NF?=
 =?us-ascii?Q?f5LwQHpaWTzDa09GpEgLwEiGmq6n9lSiZDkZrW+n6MkcqvjjRuCnGneaNMKW?=
 =?us-ascii?Q?ISnm7U3vKNQsYm+6f4fSHWh7qlBnCESnOKyCrKH5fAXPAvryEMe32zidD2Qi?=
 =?us-ascii?Q?e0BPxuOVKM0CCslNK5qPKX4Q+dVhIf/pxuTKPlE8dfOV52SQF0GPkHJ+jabI?=
 =?us-ascii?Q?U0RjItLNZ0eMRM4/P2g/HyId4IXiY+D0sQ1/Oqffnw7jS+0dxPSmYUyXKJ0v?=
 =?us-ascii?Q?Hp9ikh5VZrGvth5DlvTu586ZIbzk2O8GYM9GMr9337Rtm4sd6Qq2U+Ld+cfE?=
 =?us-ascii?Q?5WhO2MO8MGU1S/qOdObE5qgu/rZR2ienxyeozJ8/Qb3YGNSXVOCV2x/QrW9+?=
 =?us-ascii?Q?Q4U2uWz2C8mOwcinVb5DbXJuS7SJBfanJJbizujdQViorgGFfInm5Vr6AuTZ?=
 =?us-ascii?Q?NBbIaNqZ+96esxEC0q3JzwyO2127oU/vqGkiERoo5BQd4qAXq8BW5QIa0t5J?=
 =?us-ascii?Q?WXNjdNBArirWMFwnImFsM2BpVAtd8X8FU3547orBLZ6PFFi/qpLhldlHu+dc?=
 =?us-ascii?Q?02+t1bNaxBpIVngL9YbPgYf3ZVD//q8kFgHQUm+wA2rp9/cK/LMU0I5z90gY?=
 =?us-ascii?Q?qfB5stJYrI+vd57xr7pWXRM1i2hBcR0AxBoKrPjqVcNpS1WRPDP2RhIf1Y+D?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 585fa269-ff9d-468b-1f46-08de17cb941e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:47:06.6622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: az1BxafvnDD+Y5iS3M6achGHYANqjvqj2fcHgIvxNZkp9V2reD+PnEFwz1e2yxBIRAqaeFc5HD09damZ4WsUUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7357
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

On Thu, Oct 30, 2025 at 09:55:30AM -0500, Lucas De Marchi wrote:
> On Thu, Oct 30, 2025 at 10:53:36AM +0100, Raag Jadav wrote:
> > On Wed, Oct 29, 2025 at 04:45:10PM -0700, Lucas De Marchi wrote:
> > > It's currently not possible to safely monitor if there's throttling
> > > happening and what are the reasons. The approach of reading the status
> > > and then reading the reasons is not reliable as by the time sysadmin
> > > reads the reason, the throttling could not be happening anymore.
> > > 
> > > Previous tentative to fix that[1] was breaking the ABI and potentially
> > > sysadmin's scripts. This takes a different approach of adding and
> > > documenting the additional attribute. It's still valuable, though
> > > redundant, to provide the simpler 0/1 interface.
> > > 
> > > In order to avoid userspace knowledge on the bitmask meaning and to be
> > > able to maintain the kernel side in sync with possible changes in
> > > future, just walk the attribute group and check what are the masks that
> > > match the value read.
> > > 
> > > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> > 
> > ...
> > 
> > > +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> > > +
> > > +static ssize_t status_reasons_show(struct kobject *kobj,
> > > +				   struct kobj_attribute *attr, char *buff)
> > > +{
> > > +	struct xe_gt *gt = throttle_to_gt(kobj);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	const struct attribute_group *group;
> > > +	struct attribute **pother;
> > > +	ssize_t ret = 0;
> > > +	u32 reasons;
> > > +
> > > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> > > +	group = get_platform_throttle_group(xe);
> > > +
> > > +	for (pother = group->attrs; *pother; pother++) {
> > > +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> > > +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> > > +
> > > +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> > > +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> > 
> > Much better.
> > 
> > > +	}
> > > +
> > > +	/* Drop extra space from last iteration above */
> > > +	if (ret)
> > > +		ret--;
> > > +
> > > +	ret += sysfs_emit_at(buff, ret, "\n");
> > 
> > I went through the documentation again and I couldn't find any rules
> > related to empty files or whether it is allowed (just thinking out
> > loud about no throttling cases).
> 
> do you mean if "empty" files are allowed in sysfs? I don't think there's
> any problem with that. It's also not empty, it has a newline there ;)

alternatively we could print the entire reg in hex format?
But I prefer the text line in this patch.

Nothing against the 'empty' file with or without the new-line,
but perhaps we could consider to track that in the loop
and if none is add we print

if (ret)
	ret--;
else
	sysfs_emit_at(buff, ret, "none");

and document that above...

> 
> Lucas De Marchi
> 
> > 
> > Thoughts?
> > 
> > Raag
