Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034EC369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 08:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C756110E70F;
	Wed, 30 Apr 2025 08:55:02 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AD910E32A;
 Wed, 30 Apr 2025 08:55:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_x86/efi=3A_Make?=
 =?utf-8?q?_efi=5Fenter/leave=5Fmm=28=29_use_the_use=5F/unuse=5Ftemporary=5F?=
 =?utf-8?q?mm=28=29_machinery_=28linux-next=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Zijlstra" <peterz@infradead.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Apr 2025 08:55:00 -0000
Message-ID: <174600330075.28862.13791767191436385840@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <SJ1PR11MB6129E62E3B372932C6B7477FB9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129E62E3B372932C6B7477FB9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: x86/efi: Make efi_enter/leave_mm() use the use_/unuse_temporary_mm() machinery (linux-next) (rev2)
URL   : https://patchwork.freedesktop.org/series/148428/
State : failure

== Summary ==

Address 'peterz@infradead.org' is not on the allowlist!
Exception occurred during validation, bailing out!


