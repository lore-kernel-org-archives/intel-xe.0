Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E4DEB3624
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D0710E11B;
	Mon,  2 Mar 2026 20:01:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C35210E11B;
 Mon,  2 Mar 2026 20:01:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_checkpatch=3A_teach_check?=
 =?utf-8?q?patch_about_the_Assisted-by=3A_tag_for_AI-assisted_patches?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 20:01:10 -0000
Message-ID: <177248167061.305661.1333768231380491809@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302143659.41882-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260302143659.41882-1-thomas.hellstrom@linux.intel.com>
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

Series: checkpatch: teach checkpatch about the Assisted-by: tag for AI-assisted patches
URL   : https://patchwork.freedesktop.org/series/162433/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b7df9864f125be1128fda77843dcd2cb42dd5d5
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Mar 2 15:36:59 2026 +0100

    checkpatch: teach checkpatch about the Assisted-by: tag for AI-assisted patches
    
    Documentation/process/coding-assistants.rst mandates the use of an
    uses an "Agent:Model" notation rather than a name-and-email-address
    pair, for example:
    
      Assisted-by: GitHub Copilot:claude-sonnet-4.6
    
    checkpatch.pl currently emits false-positive errors and warnings for
    this tag:
    
      WARNING: Non-standard signature: Assisted-by:
      ERROR: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
    
    Teach checkpatch about the tag:
    
    - Add Assisted-by: to the $signature_tags regex so it is no longer
      flagged as a non-standard signature.
    - Add Assisted-by: to the standard_signature_tags list in
      find_standard_signature() so that near-miss typos (e.g.
      'Assited-by:') suggest the correct spelling.
    - Skip the email-address validation for Assisted-by: tags and instead
      validate that the value contains at least one colon separating the
      agent name from the model identifier.  Emit a BAD_SIGN_OFF warning
      if the notation does not conform.
    
    Cc: Andy Whitcroft <apw@canonical.com>
    Cc: Joe Perches <joe@perches.com>
    Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
    Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
    Cc: linux-kernel@vger.kernel.org
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 8527899064372c5c8f4d8db80024412ff3c02128 drm-intel
8b7df9864f12 checkpatch: teach checkpatch about the Assisted-by: tag for AI-assisted patches
-:4: WARNING:EMAIL_SUBJECT: A patch subject line should describe the change not the tool that found it
#4: 
Subject: [PATCH] checkpatch: teach checkpatch about the Assisted-by: tag for

-:14: WARNING:BAD_SIGN_OFF: Do not use whitespace before Assisted-by:
#14: 
  Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:39: WARNING:BAD_SIGN_OFF: Duplicate signature
#39: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:47: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reviewed-by:
#47: FILE: scripts/checkpatch.pl:641:
 	Reviewed-by:|

-:47: WARNING:BAD_SIGN_OFF: Use a single space after Reviewed-by:
#47: FILE: scripts/checkpatch.pl:641:
 	Reviewed-by:|

-:47: ERROR:BAD_SIGN_OFF: Unrecognized email address: '|'
#47: FILE: scripts/checkpatch.pl:641:
 	Reviewed-by:|

-:48: WARNING:BAD_SIGN_OFF: Do not use whitespace before Reported-by:
#48: FILE: scripts/checkpatch.pl:642:
 	Reported-by:|

-:48: WARNING:BAD_SIGN_OFF: Use a single space after Reported-by:
#48: FILE: scripts/checkpatch.pl:642:
 	Reported-by:|

-:48: ERROR:BAD_SIGN_OFF: Unrecognized email address: '|'
#48: FILE: scripts/checkpatch.pl:642:
 	Reported-by:|

-:48: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#48: FILE: scripts/checkpatch.pl:642:
 	Reported-by:|
 	Suggested-by:|

-:49: WARNING:BAD_SIGN_OFF: Do not use whitespace before Suggested-by:
#49: FILE: scripts/checkpatch.pl:643:
 	Suggested-by:|

-:49: WARNING:BAD_SIGN_OFF: Use a single space after Suggested-by:
#49: FILE: scripts/checkpatch.pl:643:
 	Suggested-by:|

-:49: ERROR:BAD_SIGN_OFF: Unrecognized email address: '|'
#49: FILE: scripts/checkpatch.pl:643:
 	Suggested-by:|

-:51: WARNING:BAD_SIGN_OFF: Do not use whitespace before To:
#51: FILE: scripts/checkpatch.pl:645:
 	To:|

-:51: WARNING:BAD_SIGN_OFF: Use a single space after To:
#51: FILE: scripts/checkpatch.pl:645:
 	To:|

-:51: ERROR:BAD_SIGN_OFF: Unrecognized email address: '|'
#51: FILE: scripts/checkpatch.pl:645:
 	To:|

-:52: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#52: FILE: scripts/checkpatch.pl:646:
 	Cc:

-:52: WARNING:BAD_SIGN_OFF: Use a single space after Cc:
#52: FILE: scripts/checkpatch.pl:646:
 	Cc:

-:52: ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#52: FILE: scripts/checkpatch.pl:646:
 	Cc:

total: 5 errors, 14 warnings, 0 checks, 31 lines checked


